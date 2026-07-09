module pipeline_assertions(
input logic clk,rst_n,
input logic stall,
input logic [31:0] if_id_pc,
input logic [31:0] id_ex_pc);

property p_pipeline_advances;
 @(posedge clk) disable iff(!rst_n)
 !stall |=> (id_ex_pc==$past(if_id_pc));
endproperty

ap_pipeline_advances: assert property(p_pipeline_advances);
endmodule
