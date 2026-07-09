covergroup hazard_cg @(posedge clk);
    option.per_instance = 1;

    hazard_cp : coverpoint hazard_detected;
    stall_cp  : coverpoint stall;

    hazard_x_stall : cross hazard_cp, stall_cp;
endgroup
