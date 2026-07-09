//============================================================
// Class : riscv_scoreboard
//============================================================
class riscv_scoreboard;

    mailbox #(riscv_transaction) mon2sb;

    int total_txns;
    int regwrite_count;

    function new(mailbox #(riscv_transaction) mon2sb);
        this.mon2sb = mon2sb;
    endfunction

    task run();
        riscv_transaction tr;

        forever begin
            mon2sb.get(tr);

            total_txns++;

            if(tr.reg_write)
                regwrite_count++;

            $display("[SB] PC=%08h INST=%08h RD=%0d WR=%0d DATA=%08h",
                     tr.pc,tr.instruction,tr.rd,tr.reg_write,tr.write_data);

            // TODO:
            // - Compare expected ALU results
            // - Compare memory operations
            // - Verify branch behavior
            // - Check register write-back
        end
    endtask

    function void report();
        $display("--------------------------------");
        $display("Transactions : %0d", total_txns);
        $display("Register Writes : %0d", regwrite_count);
        $display("--------------------------------");
    endfunction

endclass
