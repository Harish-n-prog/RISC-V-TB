//============================================================
// Class : riscv_env
//============================================================
class riscv_env;

    virtual riscv_if vif;

    mailbox #(riscv_transaction) gen2drv;
    mailbox #(riscv_transaction) mon2sb;

    riscv_generator  gen;
    riscv_driver     drv;
    riscv_monitor    mon;
    riscv_scoreboard sb;

    function new(virtual riscv_if vif);

        this.vif = vif;

        gen2drv = new();
        mon2sb  = new();

        gen = new(gen2drv);
        drv = new(vif, gen2drv);
        mon = new(vif, mon2sb);
        sb  = new(mon2sb);

    endfunction

    task run();

        fork
            drv.reset();
            gen.run();
            drv.run();
            mon.run();
            sb.run();
        join_none

    endtask

endclass
