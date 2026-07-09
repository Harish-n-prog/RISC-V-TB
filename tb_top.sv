`timescale 1ns/1ps

module tb_top;

    logic clk;

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Interface
    riscv_if vif(clk);

    // DUT
    rv32i_top dut (
        .clk  (clk),
        .rst_n(vif.rst_n)
    );

    // Test handle
    riscv_test test;

    initial begin
        test = new(vif);
        test.run();
    end

endmodule
