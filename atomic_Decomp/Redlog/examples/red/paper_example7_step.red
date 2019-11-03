load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d_1, e_10, e_2, e_3, e_4, e_5, e_6, e_7, e_8, e_9, nil, u};

formula := ( 
not( e_8 = d_1) and 
not( e_9 = nil) and 
not( e_10 = u) and 
((e_8 = e_9) impl (d_1 = nil)) and 
((e_8 = e_10) impl (d_1 = u)) and 
((e_9 = e_8) impl (nil = d_1)) and 
((e_9 = e_10) impl (nil = u)) and 
((e_10 = e_8) impl (u = d_1)) and 
((e_10 = e_9) impl (u = nil)) and 
((nil = u) impl (e_9 = e_10)) and 
((d_1 = nil) impl (e_8 = e_9)) and 
((d_1 = u) impl (e_8 = e_10)) and 
d_1 = e_10 and 
e_4 <= e_7 and 
e_2 > e_5 and 
e_6 = 1 and 
e_3 = 0 and 
((nil = u) impl (e_6 = e_7)) and 
((d_1 = nil) impl (e_5 = e_6)) and 
((d_1 = u) impl (e_5 = e_7)) and 
((nil = u) impl (e_3 = e_4)) and 
((d_1 = nil) impl (e_2 = e_3)) and 
((d_1 = u) impl (e_2 = e_4)) and 
((e_8 = d_1) impl (e_2 = 1 + e_2)) and 
((e_8 = nil) impl (e_3 = 1 + e_2)) and 
((e_8 = u) impl (e_4 = 1 + e_2)) and 
((e_9 = d_1) impl (e_2 = 1 + e_3)) and 
((e_9 = nil) impl (e_3 = 1 + e_3)) and 
((e_9 = u) impl (e_4 = 1 + e_3)) and 
((e_10 = d_1) impl (e_2 = 1 + e_4)) and 
((e_10 = nil) impl (e_3 = 1 + e_4)) and 
((e_10 = u) impl (e_4 = 1 + e_4)) and 
((e_8 = d_1) impl (e_5 = 2 * e_5)) and 
((e_8 = nil) impl (e_6 = 2 * e_5)) and 
((e_8 = u) impl (e_7 = 2 * e_5)) and 
((e_9 = d_1) impl (e_5 = 2 * e_6)) and 
((e_9 = nil) impl (e_6 = 2 * e_6)) and 
((e_9 = u) impl (e_7 = 2 * e_6)) and 
((e_10 = d_1) impl (e_5 = 2 * e_7)) and 
((e_10 = nil) impl (e_6 = 2 * e_7)) and 
((e_10 = u) impl (e_7 = 2 * e_7))
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
