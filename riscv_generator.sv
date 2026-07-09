//============================================================
// Class : riscv_generator
//============================================================
class riscv_generator;

    mailbox #(riscv_transaction) gen2drv;
    int num_transactions = 100;

    function new(mailbox #(riscv_transaction) gen2drv);
        this.gen2drv = gen2drv;
    endfunction

    task run();
        riscv_transaction tr;

        repeat(num_transactions) begin
            tr = new();

            assert(tr.randomize())
                else $fatal("Randomization failed");

            gen2drv.put(tr);
            tr.display();
        end
    endtask

endclass
