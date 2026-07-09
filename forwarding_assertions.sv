module forwarding_assertions(
input logic clk,rst_n,
input logic ex_mem_reg_write,
input logic [4:0] ex_mem_rd,id_ex_rs1,
input logic [1:0] forwardA);

property p_forward_from_exmem;
 @(posedge clk) disable iff(!rst_n)
 (ex_mem_reg_write && ex_mem_rd!=0 && ex_mem_rd==id_ex_rs1)
 |-> (forwardA==2'b10);
endproperty

ap_forward_from_exmem: assert property(p_forward_from_exmem);
endmodule
