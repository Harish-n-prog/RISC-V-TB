module register_assertions(
input logic clk,rst_n,
input logic reg_write,
input logic [4:0] rd);

property p_x0_never_written;
 @(posedge clk) disable iff(!rst_n)
 reg_write |-> (rd!=5'd0);
endproperty

ap_x0_never_written: assert property(p_x0_never_written);
endmodule
