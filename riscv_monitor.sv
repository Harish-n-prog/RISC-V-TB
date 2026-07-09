//============================================================
// Class : riscv_monitor
//============================================================
class riscv_monitor;

    virtual riscv_if vif;
    mailbox #(riscv_transaction) mon2sb;

    function new(virtual riscv_if vif,
                 mailbox #(riscv_transaction) mon2sb);
        this.vif = vif;
        this.mon2sb = mon2sb;
    endfunction

    task run();
        riscv_transaction tr;

        forever begin
            @(posedge vif.clk);

            tr = new();

            tr.pc         = vif.pc;
            tr.instruction= vif.instruction;
            tr.reg_write  = vif.reg_write;
            tr.rd         = vif.rd;
            tr.write_data = vif.write_data;

            mon2sb.put(tr);

            tr.display();
        end
    endtask

endclass
