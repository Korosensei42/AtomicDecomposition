load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d11, d12, d21, d22, d31, d32, d_1, d_2, d_3, e_4, e_5, e_6};

formula := ( 
((d_1 <= d_1) impl (e_4 <= e_4)) and 
((d_1 <= d_2) impl (e_4 <= e_5)) and 
((d_1 <= d_3) impl (e_4 <= e_6)) and 
((d_2 <= d_1) impl (e_5 <= e_4)) and 
((d_2 <= d_2) impl (e_5 <= e_5)) and 
((d_2 <= d_3) impl (e_5 <= e_6)) and 
((d_3 <= d_1) impl (e_6 <= e_4)) and 
((d_3 <= d_2) impl (e_6 <= e_5)) and 
((d_3 <= d_3) impl (e_6 <= e_6)) and 
((d_2 = d_3) impl (e_5 = e_6)) and 
((d_1 = d_2) impl (e_4 = e_5)) and 
((d_1 = d_3) impl (e_4 = e_6)) and 
d_1 = d11 + 1 and 
d_2 = d21 + 1 and 
d_3 = d12 + 1 and 
d12 = e_4 and 
d22 = e_5 + (1 - d31) and 
2 * d32 = d31 and 
d21 >= e_4 and 
d31 <= 1 and 
((d22 >= e_6 and d32 <= 1) impl (false))
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
