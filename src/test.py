import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_chase(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 1, units="ms")
    cocotb.fork(clock.start())

    dut._log.info("reset")
    dut.mode.value = 1
    dut.rst.value = 1
    await ClockCycles(dut.clk, 2)
    dut.rst.value = 0

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


@cocotb.test()
async def test_noise(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 1, units="ms")
    cocotb.fork(clock.start())

    dut._log.info("reset")
    dut.rst.value = 1
    dut.mode.value = 0
    await ClockCycles(dut.clk, 1)
    dut.rst.value = 0
    await ClockCycles(dut.clk, 1)
    counts = [[0, 0] for _ in range(8)]
    for _ in range(127):
        for i in range(8):
            counts[i][dut.o[i].value] += 1
        await ClockCycles(dut.clk, 1)
    # Check LFSR balance property for max run
    print(counts)
    for i in range(8):
        assert counts[i][0] + 1 == counts[i][1]
