load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {e_1, e_2, e_3, nil};

formula := ( 
not( e_3 = nil) and 
e_1 > e_2 and 
e_2 = 1 and 
e_1 = 0 and 
((e_3 = nil) impl (e_1 = 1 + e_1)) and 
((e_3 = nil) impl (e_2 = 2 * e_2))
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
