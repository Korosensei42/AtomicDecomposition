load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {e_1, e_2, e_3, e_4, nil};

formula := ( 
((e_1 > e_1) impl (e_4 = e_1)) and 
((e_1 <= e_1) impl (e_4 = e_1)) and 
e_1 > e_2 and 
e_2 = 0 and 
e_1 = 0 and 
((e_3 = nil) impl (e_1 = e_4)) and 
((e_3 = nil) impl (e_2 = 1 + (e_2 + e_2))) and 
not( e_3 = nil) and 
not( e_3 = nil)
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
