//============================================================
// Class : riscv_driver
//============================================================
class riscv_driver;

    virtual riscv_if vif;
    mailbox #(riscv_transaction) gen2drv;

    function new(virtual riscv_if vif,
                 mailbox #(riscv_transaction) gen2drv);
        this.vif = vif;
        this.gen2drv = gen2drv;
    endfunction

    task reset();
        vif.rst_n <= 0;
        repeat(5) @(posedge vif.clk);
        vif.rst_n <= 1;
    endtask

    task run();
        riscv_transaction tr;

        forever begin
            gen2drv.get(tr);

            @(posedge vif.clk);

            // For instruction-driven verification
            // preload instruction into instruction memory/model
            vif.instruction <= tr.instruction;
            vif.pc          <= tr.pc;

            @(posedge vif.clk);
        end
    endtask

endclass
