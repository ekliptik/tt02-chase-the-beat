module top (
  input [7:0] io_in,
  output [7:0] io_out
);
    chase chase(.io_out(io_out), .clk(io_in[0]), rst(io_in[1]), tap(io_in[0]));
endmodule