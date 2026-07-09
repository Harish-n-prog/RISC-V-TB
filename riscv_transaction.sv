//============================================================
// Class : riscv_transaction
//============================================================
class riscv_transaction;

    rand bit [31:0] instruction;

    bit [31:0] pc;
    bit        reg_write;
    bit [4:0]  rd;
    bit [31:0] write_data;

    constraint word_align_c {
        instruction[1:0] == 2'b11;
    }

    function void display();
        $display("[TXN] PC=%08h INST=%08h RD=%0d REG_WR=%0d DATA=%08h",
                  pc,instruction,rd,reg_write,write_data);
    endfunction

endclass
