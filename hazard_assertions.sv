module hazard_assertions(
input logic clk,rst_n,
input logic hazard_detected,
input logic stall);

property p_hazard_causes_stall;
 @(posedge clk) disable iff(!rst_n)
 hazard_detected |-> stall;
endproperty

ap_hazard_causes_stall: assert property(p_hazard_causes_stall);
endmodule
