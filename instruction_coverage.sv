covergroup instruction_cg @(posedge clk);
    option.per_instance = 1;

    opcode_cp : coverpoint opcode {
        bins r_type = {7'b0110011};
        bins i_type = {7'b0010011};
        bins load   = {7'b0000011};
        bins store  = {7'b0100011};
        bins branch = {7'b1100011};
    }
endgroup
