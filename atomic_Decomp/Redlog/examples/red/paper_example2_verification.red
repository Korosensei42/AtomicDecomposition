load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d11, d12, d21, d22, d_1, d_2, e_10, e_3, e_4, e_5, e_6, e_7, e_8, e_9};

formula := ( 
((1 + 1 = 1) impl (e_7 = e_3)) and 
((d21 + 1 = 1) impl (e_8 = e_3)) and 
((d_1 + 1 = 1) impl (e_9 = e_3)) and 
((d_2 + 1 = 1) impl (e_10 = e_3)) and 
((1 + 1 = d21) impl (e_7 = e_4)) and 
((d21 + 1 = d21) impl (e_8 = e_4)) and 
((d_1 + 1 = d21) impl (e_9 = e_4)) and 
((d_2 + 1 = d21) impl (e_10 = e_4)) and 
((1 + 1 = d_1) impl (e_7 = e_5)) and 
((d21 + 1 = d_1) impl (e_8 = e_5)) and 
((d_1 + 1 = d_1) impl (e_9 = e_5)) and 
((d_2 + 1 = d_1) impl (e_10 = e_5)) and 
((1 + 1 = d_2) impl (e_7 = e_6)) and 
((d21 + 1 = d_2) impl (e_8 = e_6)) and 
((d_1 + 1 = d_2) impl (e_9 = e_6)) and 
((d_2 + 1 = d_2) impl (e_10 = e_6)) and 
((d_1 = d_2) impl (e_9 = e_10)) and 
((d21 = d_1) impl (e_8 = e_9)) and 
((d21 = d_2) impl (e_8 = e_10)) and 
((1 = d21) impl (e_7 = e_8)) and 
((1 = d_1) impl (e_7 = e_9)) and 
((1 = d_2) impl (e_7 = e_10)) and 
((d_1 = d_2) impl (e_5 = e_6)) and 
((d21 = d_1) impl (e_4 = e_5)) and 
((d21 = d_2) impl (e_4 = e_6)) and 
((1 = d21) impl (e_3 = e_4)) and 
((1 = d_1) impl (e_3 = e_5)) and 
((1 = d_2) impl (e_3 = e_6)) and 
d_1 = d11 + 1 and 
d_2 = d12 + 1 and 
d12 = e_5 and 
d22 = e_8 and 
d21 = e_5 and 
not( d22 = e_6)
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
