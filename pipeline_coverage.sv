covergroup pipeline_cg @(posedge clk);
    option.per_instance = 1;

    stall_cp : coverpoint stall;
    flush_cp : coverpoint flush;

    pipeline_state : cross stall_cp, flush_cp;
endgroup
