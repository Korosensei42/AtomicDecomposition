load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d11, d12, d21, d22, d_1, d_2, e_3, e_4, e_5, e_6, e_7, e_8};

formula := (
((d_1 = d_2) impl (e_7 = e_8)) and
((d21 = d_1) impl (e_6 = e_7)) and
((d21 = d_2) impl (e_6 = e_8)) and
((d_1 = d_2) impl (e_4 = e_5)) and
((d21 = d_1) impl (e_3 = e_4)) and
((d21 = d_2) impl (e_3 = e_5)) and
d_1 = d11 + 1 and
d_2 = d12 + 1 and
d12 = e_4 and
d22 = e_6 and
d21 = e_4 and
not( d22 = e_5)
 );

query :=  (rlqe ex(vars, formula));

end;
