from amaranth import *

class Chase(Elaboratable):
    def __init__(self):
        self.tap = Signal()
        self.o = Signal(unsigned(8))
        # self.rst = Signal()

    def elaborate(self, platform):
        m = Module()
        counter = Signal(unsigned(10))
        ceiling = Signal(unsigned(10), reset=1)
        prev_tap = Signal()
        mode = Signal(unsigned(2))

        # m.d.comb += ResetSignal().eq(self.rst)

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
        self.o = Signal()

    def elaborate(self, _):
        m = Module()
        # Max length external feedback LFSR with n = 7, P(x) = x**n + x + 1
        length = 7
        shift_reg = Signal(length, reset=1)
        m.d.sync += self.o.eq(shift_reg[-1])
        m.d.sync += shift_reg[0].eq(shift_reg[-1] ^ shift_reg[1])
        for i in range(1, length):
            m.d.sync += shift_reg[i].eq(shift_reg[i-1])
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
            self.o.eq(Mux(self.mode, chase.o, Cat(noise.o, Const(0, 7))))
        ]
        return m

if __name__ == '__main__':
    from amaranth.cli import main
    # from amaranth.sim import Simulator
    a_top = AmaranthTop()
    main(a_top, ports=[a_top.tap, a_top.mode, a_top.o])
    # if False:
    # m = Module()
    # top_rst = Signal()
    # m.submodules += ResetInserter(top_rst)(top)
    # sim = Simulator(m)
    # def process():
    #     for _ in range(2):
    #         yield
    #         yield top.tap.eq(1)
    #         yield
    #         yield top.tap.eq(0)
    #         for _ in range(10):
    #             yield
    #         yield top.tap.eq(1)
    #         yield
    #         yield top.tap.eq(0)
    #         for _ in range(100):
    #             yield
    #         yield top_rst.eq(1)
    #         yield
    #         yield top_rst.eq(0)

    # sim.add_sync_process(process)
    # sim.add_clock(1e-3)
    # with sim.write_vcd(f"chase.vcd", f"chase.gtkw"):
    #     sim.run()