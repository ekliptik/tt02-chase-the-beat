import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


# segments = [ 63, 6, 91, 79, 102, 109, 124, 7, 127, 103 ]

@cocotb.test()
async def test_chase(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 1, units="ms")
    cocotb.fork(clock.start())

    dut._log.info("reset")
    dut.rst.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 0

    # dut._log.info("check all segments")
    async def click():
        dut.tap.value = 1
        await ClockCycles(dut.clk, 1)
        dut.tap.value = 0
        await ClockCycles(dut.clk, 1)
    await click()
    await ClockCycles(dut.clk, 10)
    await click()
    await ClockCycles(dut.clk, 3)
    assert int(dut.o.value) == 1
    await ClockCycles(dut.clk, 10)
    assert int(dut.o.value) == 2

