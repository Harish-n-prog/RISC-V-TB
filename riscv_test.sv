//============================================================
// Class : riscv_test
//============================================================
class riscv_test;

    riscv_env env;

    function new(virtual riscv_if vif);
        env = new(vif);
    endfunction

    task run();
        $display("[TEST] Starting RV32I Verification...");
        env.run();

        // Allow generator/driver/monitor to execute
        #5000;

        env.sb.report();

        $display("[TEST] Completed.");
        $finish;
    endtask

endclass
