load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d11, d12, d21, d22, d_1, d_2, e_10, e_3, e_4, e_5, e_6, e_7, e_8, e_9, i, x};

formula := ( 
((d_1 + 1 = d_1) impl (e_7 <= e_7)) and 
((d_1 + 1 = d_2) impl (e_7 <= e_8)) and 
((d_1 + 1 = i) impl (e_7 <= e_9)) and 
((d_1 + 1 = x) impl (e_7 <= e_10)) and 
((d_2 + 1 = d_1) impl (e_8 <= e_7)) and 
((d_2 + 1 = d_2) impl (e_8 <= e_8)) and 
((d_2 + 1 = i) impl (e_8 <= e_9)) and 
((d_2 + 1 = x) impl (e_8 <= e_10)) and 
((i + 1 = d_1) impl (e_9 <= e_7)) and 
((i + 1 = d_2) impl (e_9 <= e_8)) and 
((i + 1 = i) impl (e_9 <= e_9)) and 
((i + 1 = x) impl (e_9 <= e_10)) and 
((x + 1 = d_1) impl (e_10 <= e_7)) and 
((x + 1 = d_2) impl (e_10 <= e_8)) and 
((x + 1 = i) impl (e_10 <= e_9)) and 
((x + 1 = x) impl (e_10 <= e_10)) and 
((i = x) impl (e_9 = e_10)) and 
((d_2 = i) impl (e_8 = e_9)) and 
((d_2 = x) impl (e_8 = e_10)) and 
((d_1 = d_2) impl (e_7 = e_8)) and 
((d_1 = i) impl (e_7 = e_9)) and 
((d_1 = x) impl (e_7 = e_10)) and 
d_1 = i + 1 and 
d_2 = x + 1 and 
d12 = e_5 and 
d22 = e_3 and 
d11 <= d21 and 
((d12 <= d22 and e_6 <= e_4) impl (false)) and 
((i = x) impl (e_5 = e_6)) and 
((d_2 = i) impl (e_4 = e_5)) and 
((d_2 = x) impl (e_4 = e_6)) and 
((d_1 = d_2) impl (e_3 = e_4)) and 
((d_1 = i) impl (e_3 = e_5)) and 
((d_1 = x) impl (e_3 = e_6)) and 
e_3 = e_7 + 1 and 
e_4 = e_8 + 1 and 
e_5 = e_9 + 1 and 
e_6 = e_10 + 1
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
