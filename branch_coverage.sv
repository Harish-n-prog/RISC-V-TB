covergroup branch_cg @(posedge clk);
    option.per_instance = 1;

    branch_cp : coverpoint branch;
    taken_cp  : coverpoint take_branch;

    branch_cross : cross branch_cp, taken_cp;
endgroup
