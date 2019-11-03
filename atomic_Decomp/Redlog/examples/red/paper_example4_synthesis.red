load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d11, d12, d21, d22, d_1, e_2, e_3, e_4, e_5, i};

formula := ( 
((d_1 = i) impl (e_4 = e_5)) and 
d_1 = i + 1 and 
d12 = e_3 and 
d22 = e_2 and 
d11 <= d21 and 
not( d12 <= d22) and 
((d_1 = i) impl (e_2 = e_3)) and 
e_2 = e_4 + 1 and 
e_3 = e_5 + 1
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
