//============================================================
// Interface : riscv_if
//============================================================
interface riscv_if(input logic clk);

    logic rst_n;

    // Fetch
    logic [31:0] instruction;
    logic [31:0] pc;

    // Register write-back observation
    logic        reg_write;
    logic [4:0]  rd;
    logic [31:0] write_data;

    // Memory interface observation
    logic        mem_read;
    logic        mem_write;
    logic [31:0] addr;
    logic [31:0] wdata;
    logic [31:0] rdata;

endinterface
