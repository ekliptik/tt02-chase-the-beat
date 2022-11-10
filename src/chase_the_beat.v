/* Generated by Yosys 0.22+37 (git sha1 be1a12595, gcc 12.2.0 -march=x86-64 -mtune=generic -O2 -fno-plt -fexceptions -fstack-clash-protection -fcf-protection -fPIC -Os) */

(* \amaranth.hierarchy  = "top" *)
(* top =  1  *)
(* generator = "Amaranth" *)
module top(o, clk, rst, tap);
  reg \$auto$verilog_backend.cc:2083:dump_module$1  = 0;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$1 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
  wire \$11 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *)
  wire \$13 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$15 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$17 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$19 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$21 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$23 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
  wire \$25 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *)
  wire \$27 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:31" *)
  wire [10:0] \$29 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$3 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:31" *)
  wire [10:0] \$30 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$32 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$34 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$36 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$38 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$40 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
  wire \$42 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *)
  wire \$44 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$46 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
  wire \$48 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$5 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$50 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$52 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$54 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
  wire \$56 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *)
  wire \$58 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$7 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *)
  wire \$9 ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:12" *)
  reg [9:0] ceiling = 10'h001;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:12" *)
  reg [9:0] \ceiling$next ;
  (* src = "/home/emil/pulls/amaranth/amaranth/hdl/ir.py:527" *)
  input clk;
  wire clk;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:11" *)
  reg [9:0] counter = 10'h000;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:11" *)
  reg [9:0] \counter$next ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:14" *)
  reg [1:0] mode = 2'h0;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:14" *)
  reg [1:0] \mode$next ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:6" *)
  output [7:0] o;
  reg [7:0] o = 8'h00;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:6" *)
  reg [7:0] \o$next ;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:13" *)
  reg prev_tap = 1'h0;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:13" *)
  reg \prev_tap$next ;
  (* src = "/home/emil/pulls/amaranth/amaranth/hdl/ir.py:527" *)
  input rst;
  wire rst;
  (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:5" *)
  input tap;
  wire tap;
  assign \$9  = \$5  & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) \$7 ;
  assign \$11  = ! (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *) mode;
  assign \$13  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *) 1'h1;
  assign \$15  = ~ (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) prev_tap;
  assign \$17  = tap & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) \$15 ;
  assign \$1  = ~ (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) prev_tap;
  assign \$19  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) 2'h2;
  assign \$21  = counter == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) ceiling;
  assign \$23  = \$19  & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) \$21 ;
  assign \$25  = ! (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *) mode;
  assign \$27  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *) 1'h1;
  assign \$30  = counter + (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:31" *) 1'h1;
  assign \$32  = ~ (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) prev_tap;
  assign \$34  = tap & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) \$32 ;
  assign \$36  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) 2'h2;
  assign \$38  = counter == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) ceiling;
  assign \$3  = tap & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) \$1 ;
  assign \$40  = \$36  & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) \$38 ;
  assign \$42  = ! (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *) mode;
  assign \$44  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *) 1'h1;
  assign \$46  = ~ (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) prev_tap;
  assign \$48  = tap & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *) \$46 ;
  assign \$50  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) 2'h2;
  assign \$52  = counter == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) ceiling;
  assign \$54  = \$50  & (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) \$52 ;
  assign \$56  = ! (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *) mode;
  assign \$58  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" *) 1'h1;
  assign \$5  = mode == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) 2'h2;
  always @(posedge clk)
    mode <= \mode$next ;
  always @(posedge clk)
    counter <= \counter$next ;
  always @(posedge clk)
    ceiling <= \ceiling$next ;
  always @(posedge clk)
    o <= \o$next ;
  always @(posedge clk)
    prev_tap <= \prev_tap$next ;
  assign \$7  = counter == (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" *) ceiling;
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$1 ) begin end
    \mode$next  = mode;
    (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
    casez ({ \$9 , \$3  })
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" */
      2'b?1:
          (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
          casez ({ \$13 , \$11  })
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" */
            2'b?1:
                \mode$next  = 2'h1;
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" */
            2'b1?:
                \mode$next  = 2'h2;
          endcase
    endcase
    (* src = "/home/emil/pulls/amaranth/amaranth/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \mode$next  = 2'h0;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$1 ) begin end
    \counter$next  = counter;
    (* full_case = 32'd1 *)
    (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
    casez ({ \$23 , \$17  })
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" */
      2'b?1:
          (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
          casez ({ \$27 , \$25  })
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" */
            2'b?1:
                \counter$next  = 10'h000;
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" */
            2'b1?:
                \counter$next  = 10'h000;
          endcase
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" */
      2'b1?:
          \counter$next  = 10'h000;
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:30" */
      default:
          \counter$next  = \$30 [9:0];
    endcase
    (* src = "/home/emil/pulls/amaranth/amaranth/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \counter$next  = 10'h000;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$1 ) begin end
    \ceiling$next  = ceiling;
    (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
    casez ({ \$40 , \$34  })
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" */
      2'b?1:
          (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
          casez ({ \$44 , \$42  })
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" */
            2'b?1:
                /* empty */;
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" */
            2'b1?:
                \ceiling$next  = counter;
          endcase
    endcase
    (* src = "/home/emil/pulls/amaranth/amaranth/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \ceiling$next  = 10'h001;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$1 ) begin end
    \o$next  = o;
    (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" *)
    casez ({ \$54 , \$48  })
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:18" */
      2'b?1:
          (* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" *)
          casez ({ \$58 , \$56  })
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:19" */
            2'b?1:
                /* empty */;
            /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:22" */
            2'b1?:
                \o$next  = 8'h01;
          endcase
      /* src = "/home/emil/pulls/tt02-verilog-demo/src/chase_the_beat.py:27" */
      2'b1?:
          \o$next  = { o[6:0], o[7] };
    endcase
    (* src = "/home/emil/pulls/amaranth/amaranth/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \o$next  = 8'h00;
    endcase
  end
  always @* begin
    if (\$auto$verilog_backend.cc:2083:dump_module$1 ) begin end
    \prev_tap$next  = tap;
    (* src = "/home/emil/pulls/amaranth/amaranth/hdl/xfrm.py:519" *)
    casez (rst)
      1'h1:
          \prev_tap$next  = 1'h0;
    endcase
  end
  assign \$29  = \$30 ;
`ifdef COCOTB_SIM
initial begin
  $dumpfile ("chase_cocotb.vcd");
  $dumpvars (0, top);
  #1;
end
`endif
endmodule
