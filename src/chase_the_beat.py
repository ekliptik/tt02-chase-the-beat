import sys
from amaranth import *

class Chase(Elaboratable):
    def __init__(self):
        self.tap = Signal()
        self.o = Signal(unsigned(8))

    def elaborate(self, platform):
        m = Module()
        counter = Signal(unsigned(10))
        ceiling = Signal(unsigned(10), reset=1)
        prev_tap = Signal()
        mode = Signal(unsigned(2))

        with m.If(self.tap & ~ prev_tap):
            with m.If(mode == 0):
                m.d.sync += mode.eq(1)
                m.d.sync += counter.eq(0)
            with m.Elif(mode == 1):
                m.d.sync += mode.eq(2)
                m.d.sync += ceiling.eq(counter)
                m.d.sync += counter.eq(0)
                m.d.sync += self.o.eq(1)
        with m.Elif((mode == 2) & (counter == ceiling)):
            m.d.sync += counter.eq(0)
            m.d.sync += self.o.eq(self.o.rotate_left(1))
        with m.Else():
            m.d.sync += counter.eq(counter + 1)

        m.d.sync += prev_tap.eq(self.tap)
        return m

class Noise(Elaboratable):
    def __init__(self):
        self.o = Signal(unsigned(8))

    def elaborate(self, _):
        m = Module()
        lfsr_inits = [12, 60, 2, 26, 118, 15, 13, 82]
        for lfsr_idx in range(8):
            # Max length external feedback LFSR with n = 7, P(x) = x**n + x + 1
            length = 22
            shift_reg = Signal(length, reset=lfsr_inits[lfsr_idx])
            m.d.sync += shift_reg[0].eq(shift_reg[-1] ^ shift_reg[0])
            for i in range(1, length):
                m.d.sync += shift_reg[i].eq(shift_reg[i-1])
            m.d.comb += self.o[lfsr_idx].eq(shift_reg[-1])
        return m


class AmaranthTop(Elaboratable):
    def __init__(self):
        self.tap = Signal()
        self.o = Signal(unsigned(8))
        self.mode = Signal()

    def elaborate(self, _):
        m = Module()
        chase = m.submodules.chase = Chase()
        noise = m.submodules.noise = Noise()
        m.d.comb += [
            chase.tap.eq(self.tap),
            self.o.eq(Mux(self.mode, chase.o, noise.o))
        ]
        return m

if len(sys.argv) == 2 and sys.argv[1] == "wav":
    from amaranth.sim import Simulator
    import wave
    a_top = AmaranthTop()
    sim = Simulator(a_top)
    wavf = wave.open('sound.wav','w')
    wavf.setnchannels(1)
    wavf.setsampwidth(1)
    wavf.setframerate(5000)
    def process():
        yield a_top.mode.eq(0)
        yield
        for _ in range(10000):
            out = yield a_top.o
            wavf.writeframesraw(bytes([out]))
            yield
    sim.add_sync_process(process)
    sim.add_clock(1e-3)
    with sim.write_vcd(f"chase.vcd", f"chase.gtkw", traces=[a_top.o]):
        sim.run()
else:
    from amaranth.cli import main
    a_top = AmaranthTop()
    main(a_top, ports=[a_top.tap, a_top.mode, a_top.o])
