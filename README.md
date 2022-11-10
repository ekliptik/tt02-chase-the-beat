![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

This is my design for Tiny Tapeout 2. It has two modes. When the mode input is at 0, the first output pin
generates noise with a 7-bit linear feedback shift register with external feedback, which should
make band passed white noise from 20 to 500 Hz, with probably harsh components outside that band.
It's made to run with the first input pin connected
to the built-in clock divided to about 1 kHz. When the mode input is at 1, the outputs rotate to the beat
of music - you need to press the "tap" input twice, and the period between the two key presses will be
the period with which the output changes, cycling which LED out of 8 lights up.

I wrote it in Amaranth and generated Verilog from it and tested the generated Verilog with cocotb.
I'm testing the noise generator with the LFSR [maximum run length property](https://en.wikipedia.org/wiki/Maximum_length_sequence#Properties_of_maximum_length_sequences)
where the number of ones
in the output over one full period (63 cycles) is one higher than the number of zeros.

You can view the GDS (silicon geometry to be fabricated) [here](https://gds-viewer.tinytapeout.com/?model=https://ekliptik.github.io/tt02-chase-the-beat/tinytapeout.gds.gltf)

# What is Tiny Tapeout?

TinyTapeout is an educational project that aims to make it easier and cheaper than ever to get your digital designs manufactured on a real chip!

Go to https://tinytapeout.com for instructions!

## Resources

* [FAQ](https://tinytapeout.com/faq/)
* [Digital design lessons](https://tinytapeout.com/digital_design/)
* [Join the community](https://discord.gg/rPK2nSjxy8)
