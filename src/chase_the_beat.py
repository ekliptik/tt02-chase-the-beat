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

if __name__ == '__main__':
    from amaranth.cli import main
    from amaranth.sim import Simulator
    top = Chase()
    main(top, ports=[top.tap, top.o])
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