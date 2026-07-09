covergroup forwarding_cg @(posedge clk);
    option.per_instance = 1;

    forwardA_cp : coverpoint forwardA {
        bins none = {2'b00};
        bins memwb= {2'b01};
        bins exmem= {2'b10};
    }

    forwardB_cp : coverpoint forwardB {
        bins none = {2'b00};
        bins memwb= {2'b01};
        bins exmem= {2'b10};
    }
endgroup
