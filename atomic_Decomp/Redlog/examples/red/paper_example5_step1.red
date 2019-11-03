load_package redlog;
rlset OFSF;
off rlverbose;
on rlnzden;
vars := {d_1, e_10, e_11, e_12, e_13, e_14, e_15, e_16, e_17, e_18, e_19, e_2, e_20, e_21, e_22, e_23, e_24, e_25, e_26, e_27, e_28, e_29, e_3, e_30, e_31, e_32, e_33, e_34, e_35, e_36, e_37, e_38, e_39, e_4, e_40, e_41, e_5, e_6, e_7, e_8, e_9, nil, u, v};

formula := ( 
((e_2 > e_2) impl (e_26 = e_2)) and 
((e_2 > e_3) impl (e_27 = e_2)) and 
((e_2 > e_4) impl (e_28 = e_2)) and 
((e_2 > e_5) impl (e_29 = e_2)) and 
((e_3 > e_2) impl (e_30 = e_3)) and 
((e_3 > e_3) impl (e_31 = e_3)) and 
((e_3 > e_4) impl (e_32 = e_3)) and 
((e_3 > e_5) impl (e_33 = e_3)) and 
((e_4 > e_2) impl (e_34 = e_4)) and 
((e_4 > e_3) impl (e_35 = e_4)) and 
((e_4 > e_4) impl (e_36 = e_4)) and 
((e_4 > e_5) impl (e_37 = e_4)) and 
((e_5 > e_2) impl (e_38 = e_5)) and 
((e_5 > e_3) impl (e_39 = e_5)) and 
((e_5 > e_4) impl (e_40 = e_5)) and 
((e_5 > e_5) impl (e_41 = e_5)) and 
((e_2 <= e_2) impl (e_26 = e_2)) and 
((e_2 <= e_3) impl (e_27 = e_3)) and 
((e_2 <= e_4) impl (e_28 = e_4)) and 
((e_2 <= e_5) impl (e_29 = e_5)) and 
((e_3 <= e_2) impl (e_30 = e_2)) and 
((e_3 <= e_3) impl (e_31 = e_3)) and 
((e_3 <= e_4) impl (e_32 = e_4)) and 
((e_3 <= e_5) impl (e_33 = e_5)) and 
((e_4 <= e_2) impl (e_34 = e_2)) and 
((e_4 <= e_3) impl (e_35 = e_3)) and 
((e_4 <= e_4) impl (e_36 = e_4)) and 
((e_4 <= e_5) impl (e_37 = e_5)) and 
((e_5 <= e_2) impl (e_38 = e_2)) and 
((e_5 <= e_3) impl (e_39 = e_3)) and 
((e_5 <= e_4) impl (e_40 = e_4)) and 
((e_5 <= e_5) impl (e_41 = e_5)) and 
((e_5 = e_5 and e_4 = e_5) impl (e_40 = e_41)) and 
((e_5 = e_5 and e_3 = e_4) impl (e_39 = e_40)) and 
((e_5 = e_5 and e_3 = e_5) impl (e_39 = e_41)) and 
((e_5 = e_5 and e_2 = e_3) impl (e_38 = e_39)) and 
((e_5 = e_5 and e_2 = e_4) impl (e_38 = e_40)) and 
((e_5 = e_5 and e_2 = e_5) impl (e_38 = e_41)) and 
((e_4 = e_5 and e_5 = e_2) impl (e_37 = e_38)) and 
((e_4 = e_5 and e_5 = e_3) impl (e_37 = e_39)) and 
((e_4 = e_5 and e_5 = e_4) impl (e_37 = e_40)) and 
((e_4 = e_5 and e_5 = e_5) impl (e_37 = e_41)) and 
((e_4 = e_4 and e_4 = e_5) impl (e_36 = e_37)) and 
((e_4 = e_5 and e_4 = e_2) impl (e_36 = e_38)) and 
((e_4 = e_5 and e_4 = e_3) impl (e_36 = e_39)) and 
((e_4 = e_5 and e_4 = e_4) impl (e_36 = e_40)) and 
((e_4 = e_5 and e_4 = e_5) impl (e_36 = e_41)) and 
((e_4 = e_4 and e_3 = e_4) impl (e_35 = e_36)) and 
((e_4 = e_4 and e_3 = e_5) impl (e_35 = e_37)) and 
((e_4 = e_5 and e_3 = e_2) impl (e_35 = e_38)) and 
((e_4 = e_5 and e_3 = e_3) impl (e_35 = e_39)) and 
((e_4 = e_5 and e_3 = e_4) impl (e_35 = e_40)) and 
((e_4 = e_5 and e_3 = e_5) impl (e_35 = e_41)) and 
((e_4 = e_4 and e_2 = e_3) impl (e_34 = e_35)) and 
((e_4 = e_4 and e_2 = e_4) impl (e_34 = e_36)) and 
((e_4 = e_4 and e_2 = e_5) impl (e_34 = e_37)) and 
((e_4 = e_5 and e_2 = e_2) impl (e_34 = e_38)) and 
((e_4 = e_5 and e_2 = e_3) impl (e_34 = e_39)) and 
((e_4 = e_5 and e_2 = e_4) impl (e_34 = e_40)) and 
((e_4 = e_5 and e_2 = e_5) impl (e_34 = e_41)) and 
((e_3 = e_4 and e_5 = e_2) impl (e_33 = e_34)) and 
((e_3 = e_4 and e_5 = e_3) impl (e_33 = e_35)) and 
((e_3 = e_4 and e_5 = e_4) impl (e_33 = e_36)) and 
((e_3 = e_4 and e_5 = e_5) impl (e_33 = e_37)) and 
((e_3 = e_5 and e_5 = e_2) impl (e_33 = e_38)) and 
((e_3 = e_5 and e_5 = e_3) impl (e_33 = e_39)) and 
((e_3 = e_5 and e_5 = e_4) impl (e_33 = e_40)) and 
((e_3 = e_5 and e_5 = e_5) impl (e_33 = e_41)) and 
((e_3 = e_3 and e_4 = e_5) impl (e_32 = e_33)) and 
((e_3 = e_4 and e_4 = e_2) impl (e_32 = e_34)) and 
((e_3 = e_4 and e_4 = e_3) impl (e_32 = e_35)) and 
((e_3 = e_4 and e_4 = e_4) impl (e_32 = e_36)) and 
((e_3 = e_4 and e_4 = e_5) impl (e_32 = e_37)) and 
((e_3 = e_5 and e_4 = e_2) impl (e_32 = e_38)) and 
((e_3 = e_5 and e_4 = e_3) impl (e_32 = e_39)) and 
((e_3 = e_5 and e_4 = e_4) impl (e_32 = e_40)) and 
((e_3 = e_5 and e_4 = e_5) impl (e_32 = e_41)) and 
((e_3 = e_3 and e_3 = e_4) impl (e_31 = e_32)) and 
((e_3 = e_3 and e_3 = e_5) impl (e_31 = e_33)) and 
((e_3 = e_4 and e_3 = e_2) impl (e_31 = e_34)) and 
((e_3 = e_4 and e_3 = e_3) impl (e_31 = e_35)) and 
((e_3 = e_4 and e_3 = e_4) impl (e_31 = e_36)) and 
((e_3 = e_4 and e_3 = e_5) impl (e_31 = e_37)) and 
((e_3 = e_5 and e_3 = e_2) impl (e_31 = e_38)) and 
((e_3 = e_5 and e_3 = e_3) impl (e_31 = e_39)) and 
((e_3 = e_5 and e_3 = e_4) impl (e_31 = e_40)) and 
((e_3 = e_5 and e_3 = e_5) impl (e_31 = e_41)) and 
((e_3 = e_3 and e_2 = e_3) impl (e_30 = e_31)) and 
((e_3 = e_3 and e_2 = e_4) impl (e_30 = e_32)) and 
((e_3 = e_3 and e_2 = e_5) impl (e_30 = e_33)) and 
((e_3 = e_4 and e_2 = e_2) impl (e_30 = e_34)) and 
((e_3 = e_4 and e_2 = e_3) impl (e_30 = e_35)) and 
((e_3 = e_4 and e_2 = e_4) impl (e_30 = e_36)) and 
((e_3 = e_4 and e_2 = e_5) impl (e_30 = e_37)) and 
((e_3 = e_5 and e_2 = e_2) impl (e_30 = e_38)) and 
((e_3 = e_5 and e_2 = e_3) impl (e_30 = e_39)) and 
((e_3 = e_5 and e_2 = e_4) impl (e_30 = e_40)) and 
((e_3 = e_5 and e_2 = e_5) impl (e_30 = e_41)) and 
((e_2 = e_3 and e_5 = e_2) impl (e_29 = e_30)) and 
((e_2 = e_3 and e_5 = e_3) impl (e_29 = e_31)) and 
((e_2 = e_3 and e_5 = e_4) impl (e_29 = e_32)) and 
((e_2 = e_3 and e_5 = e_5) impl (e_29 = e_33)) and 
((e_2 = e_4 and e_5 = e_2) impl (e_29 = e_34)) and 
((e_2 = e_4 and e_5 = e_3) impl (e_29 = e_35)) and 
((e_2 = e_4 and e_5 = e_4) impl (e_29 = e_36)) and 
((e_2 = e_4 and e_5 = e_5) impl (e_29 = e_37)) and 
((e_2 = e_5 and e_5 = e_2) impl (e_29 = e_38)) and 
((e_2 = e_5 and e_5 = e_3) impl (e_29 = e_39)) and 
((e_2 = e_5 and e_5 = e_4) impl (e_29 = e_40)) and 
((e_2 = e_5 and e_5 = e_5) impl (e_29 = e_41)) and 
((e_2 = e_2 and e_4 = e_5) impl (e_28 = e_29)) and 
((e_2 = e_3 and e_4 = e_2) impl (e_28 = e_30)) and 
((e_2 = e_3 and e_4 = e_3) impl (e_28 = e_31)) and 
((e_2 = e_3 and e_4 = e_4) impl (e_28 = e_32)) and 
((e_2 = e_3 and e_4 = e_5) impl (e_28 = e_33)) and 
((e_2 = e_4 and e_4 = e_2) impl (e_28 = e_34)) and 
((e_2 = e_4 and e_4 = e_3) impl (e_28 = e_35)) and 
((e_2 = e_4 and e_4 = e_4) impl (e_28 = e_36)) and 
((e_2 = e_4 and e_4 = e_5) impl (e_28 = e_37)) and 
((e_2 = e_5 and e_4 = e_2) impl (e_28 = e_38)) and 
((e_2 = e_5 and e_4 = e_3) impl (e_28 = e_39)) and 
((e_2 = e_5 and e_4 = e_4) impl (e_28 = e_40)) and 
((e_2 = e_5 and e_4 = e_5) impl (e_28 = e_41)) and 
((e_2 = e_2 and e_3 = e_4) impl (e_27 = e_28)) and 
((e_2 = e_2 and e_3 = e_5) impl (e_27 = e_29)) and 
((e_2 = e_3 and e_3 = e_2) impl (e_27 = e_30)) and 
((e_2 = e_3 and e_3 = e_3) impl (e_27 = e_31)) and 
((e_2 = e_3 and e_3 = e_4) impl (e_27 = e_32)) and 
((e_2 = e_3 and e_3 = e_5) impl (e_27 = e_33)) and 
((e_2 = e_4 and e_3 = e_2) impl (e_27 = e_34)) and 
((e_2 = e_4 and e_3 = e_3) impl (e_27 = e_35)) and 
((e_2 = e_4 and e_3 = e_4) impl (e_27 = e_36)) and 
((e_2 = e_4 and e_3 = e_5) impl (e_27 = e_37)) and 
((e_2 = e_5 and e_3 = e_2) impl (e_27 = e_38)) and 
((e_2 = e_5 and e_3 = e_3) impl (e_27 = e_39)) and 
((e_2 = e_5 and e_3 = e_4) impl (e_27 = e_40)) and 
((e_2 = e_5 and e_3 = e_5) impl (e_27 = e_41)) and 
((e_2 = e_2 and e_2 = e_3) impl (e_26 = e_27)) and 
((e_2 = e_2 and e_2 = e_4) impl (e_26 = e_28)) and 
((e_2 = e_2 and e_2 = e_5) impl (e_26 = e_29)) and 
((e_2 = e_3 and e_2 = e_2) impl (e_26 = e_30)) and 
((e_2 = e_3 and e_2 = e_3) impl (e_26 = e_31)) and 
((e_2 = e_3 and e_2 = e_4) impl (e_26 = e_32)) and 
((e_2 = e_3 and e_2 = e_5) impl (e_26 = e_33)) and 
((e_2 = e_4 and e_2 = e_2) impl (e_26 = e_34)) and 
((e_2 = e_4 and e_2 = e_3) impl (e_26 = e_35)) and 
((e_2 = e_4 and e_2 = e_4) impl (e_26 = e_36)) and 
((e_2 = e_4 and e_2 = e_5) impl (e_26 = e_37)) and 
((e_2 = e_5 and e_2 = e_2) impl (e_26 = e_38)) and 
((e_2 = e_5 and e_2 = e_3) impl (e_26 = e_39)) and 
((e_2 = e_5 and e_2 = e_4) impl (e_26 = e_40)) and 
((e_2 = e_5 and e_2 = e_5) impl (e_26 = e_41)) and 
d_1 = e_21 and 
e_4 <= e_8 and 
e_5 <= e_9 and 
e_2 > e_6 and 
e_5 >= 0 and 
e_4 >= 0 and 
e_7 = 0 and 
e_3 = 0 and 
((u = v) impl (e_8 = e_9)) and 
((nil = u) impl (e_7 = e_8)) and 
((nil = v) impl (e_7 = e_9)) and 
((d_1 = nil) impl (e_6 = e_7)) and 
((d_1 = u) impl (e_6 = e_8)) and 
((d_1 = v) impl (e_6 = e_9)) and 
((u = v) impl (e_4 = e_5)) and 
((nil = u) impl (e_3 = e_4)) and 
((nil = v) impl (e_3 = e_5)) and 
((d_1 = nil) impl (e_2 = e_3)) and 
((d_1 = u) impl (e_2 = e_4)) and 
((d_1 = v) impl (e_2 = e_5)) and 
((e_10 = d_1) impl (e_2 = e_26)) and 
((e_10 = nil) impl (e_3 = e_26)) and 
((e_10 = u) impl (e_4 = e_26)) and 
((e_10 = v) impl (e_5 = e_26)) and 
((e_11 = d_1) impl (e_2 = e_27)) and 
((e_11 = nil) impl (e_3 = e_27)) and 
((e_11 = u) impl (e_4 = e_27)) and 
((e_11 = v) impl (e_5 = e_27)) and 
((e_12 = d_1) impl (e_2 = e_28)) and 
((e_12 = nil) impl (e_3 = e_28)) and 
((e_12 = u) impl (e_4 = e_28)) and 
((e_12 = v) impl (e_5 = e_28)) and 
((e_13 = d_1) impl (e_2 = e_29)) and 
((e_13 = nil) impl (e_3 = e_29)) and 
((e_13 = u) impl (e_4 = e_29)) and 
((e_13 = v) impl (e_5 = e_29)) and 
((e_14 = d_1) impl (e_2 = e_30)) and 
((e_14 = nil) impl (e_3 = e_30)) and 
((e_14 = u) impl (e_4 = e_30)) and 
((e_14 = v) impl (e_5 = e_30)) and 
((e_15 = d_1) impl (e_2 = e_31)) and 
((e_15 = nil) impl (e_3 = e_31)) and 
((e_15 = u) impl (e_4 = e_31)) and 
((e_15 = v) impl (e_5 = e_31)) and 
((e_16 = d_1) impl (e_2 = e_32)) and 
((e_16 = nil) impl (e_3 = e_32)) and 
((e_16 = u) impl (e_4 = e_32)) and 
((e_16 = v) impl (e_5 = e_32)) and 
((e_17 = d_1) impl (e_2 = e_33)) and 
((e_17 = nil) impl (e_3 = e_33)) and 
((e_17 = u) impl (e_4 = e_33)) and 
((e_17 = v) impl (e_5 = e_33)) and 
((e_18 = d_1) impl (e_2 = e_34)) and 
((e_18 = nil) impl (e_3 = e_34)) and 
((e_18 = u) impl (e_4 = e_34)) and 
((e_18 = v) impl (e_5 = e_34)) and 
((e_19 = d_1) impl (e_2 = e_35)) and 
((e_19 = nil) impl (e_3 = e_35)) and 
((e_19 = u) impl (e_4 = e_35)) and 
((e_19 = v) impl (e_5 = e_35)) and 
((e_20 = d_1) impl (e_2 = e_36)) and 
((e_20 = nil) impl (e_3 = e_36)) and 
((e_20 = u) impl (e_4 = e_36)) and 
((e_20 = v) impl (e_5 = e_36)) and 
((e_21 = d_1) impl (e_2 = e_37)) and 
((e_21 = nil) impl (e_3 = e_37)) and 
((e_21 = u) impl (e_4 = e_37)) and 
((e_21 = v) impl (e_5 = e_37)) and 
((e_22 = d_1) impl (e_2 = e_38)) and 
((e_22 = nil) impl (e_3 = e_38)) and 
((e_22 = u) impl (e_4 = e_38)) and 
((e_22 = v) impl (e_5 = e_38)) and 
((e_23 = d_1) impl (e_2 = e_39)) and 
((e_23 = nil) impl (e_3 = e_39)) and 
((e_23 = u) impl (e_4 = e_39)) and 
((e_23 = v) impl (e_5 = e_39)) and 
((e_24 = d_1) impl (e_2 = e_40)) and 
((e_24 = nil) impl (e_3 = e_40)) and 
((e_24 = u) impl (e_4 = e_40)) and 
((e_24 = v) impl (e_5 = e_40)) and 
((e_25 = d_1) impl (e_2 = e_41)) and 
((e_25 = nil) impl (e_3 = e_41)) and 
((e_25 = u) impl (e_4 = e_41)) and 
((e_25 = v) impl (e_5 = e_41)) and 
((e_10 = d_1) impl (e_6 = 1 + (e_6 + e_6))) and 
((e_10 = nil) impl (e_7 = 1 + (e_6 + e_6))) and 
((e_10 = u) impl (e_8 = 1 + (e_6 + e_6))) and 
((e_10 = v) impl (e_9 = 1 + (e_6 + e_6))) and 
((e_11 = d_1) impl (e_6 = 1 + (e_6 + e_7))) and 
((e_11 = nil) impl (e_7 = 1 + (e_6 + e_7))) and 
((e_11 = u) impl (e_8 = 1 + (e_6 + e_7))) and 
((e_11 = v) impl (e_9 = 1 + (e_6 + e_7))) and 
((e_12 = d_1) impl (e_6 = 1 + (e_6 + e_8))) and 
((e_12 = nil) impl (e_7 = 1 + (e_6 + e_8))) and 
((e_12 = u) impl (e_8 = 1 + (e_6 + e_8))) and 
((e_12 = v) impl (e_9 = 1 + (e_6 + e_8))) and 
((e_13 = d_1) impl (e_6 = 1 + (e_6 + e_9))) and 
((e_13 = nil) impl (e_7 = 1 + (e_6 + e_9))) and 
((e_13 = u) impl (e_8 = 1 + (e_6 + e_9))) and 
((e_13 = v) impl (e_9 = 1 + (e_6 + e_9))) and 
((e_14 = d_1) impl (e_6 = 1 + (e_7 + e_6))) and 
((e_14 = nil) impl (e_7 = 1 + (e_7 + e_6))) and 
((e_14 = u) impl (e_8 = 1 + (e_7 + e_6))) and 
((e_14 = v) impl (e_9 = 1 + (e_7 + e_6))) and 
((e_15 = d_1) impl (e_6 = 1 + (e_7 + e_7))) and 
((e_15 = nil) impl (e_7 = 1 + (e_7 + e_7))) and 
((e_15 = u) impl (e_8 = 1 + (e_7 + e_7))) and 
((e_15 = v) impl (e_9 = 1 + (e_7 + e_7))) and 
((e_16 = d_1) impl (e_6 = 1 + (e_7 + e_8))) and 
((e_16 = nil) impl (e_7 = 1 + (e_7 + e_8))) and 
((e_16 = u) impl (e_8 = 1 + (e_7 + e_8))) and 
((e_16 = v) impl (e_9 = 1 + (e_7 + e_8))) and 
((e_17 = d_1) impl (e_6 = 1 + (e_7 + e_9))) and 
((e_17 = nil) impl (e_7 = 1 + (e_7 + e_9))) and 
((e_17 = u) impl (e_8 = 1 + (e_7 + e_9))) and 
((e_17 = v) impl (e_9 = 1 + (e_7 + e_9))) and 
((e_18 = d_1) impl (e_6 = 1 + (e_8 + e_6))) and 
((e_18 = nil) impl (e_7 = 1 + (e_8 + e_6))) and 
((e_18 = u) impl (e_8 = 1 + (e_8 + e_6))) and 
((e_18 = v) impl (e_9 = 1 + (e_8 + e_6))) and 
((e_19 = d_1) impl (e_6 = 1 + (e_8 + e_7))) and 
((e_19 = nil) impl (e_7 = 1 + (e_8 + e_7))) and 
((e_19 = u) impl (e_8 = 1 + (e_8 + e_7))) and 
((e_19 = v) impl (e_9 = 1 + (e_8 + e_7))) and 
((e_20 = d_1) impl (e_6 = 1 + (e_8 + e_8))) and 
((e_20 = nil) impl (e_7 = 1 + (e_8 + e_8))) and 
((e_20 = u) impl (e_8 = 1 + (e_8 + e_8))) and 
((e_20 = v) impl (e_9 = 1 + (e_8 + e_8))) and 
((e_21 = d_1) impl (e_6 = 1 + (e_8 + e_9))) and 
((e_21 = nil) impl (e_7 = 1 + (e_8 + e_9))) and 
((e_21 = u) impl (e_8 = 1 + (e_8 + e_9))) and 
((e_21 = v) impl (e_9 = 1 + (e_8 + e_9))) and 
((e_22 = d_1) impl (e_6 = 1 + (e_9 + e_6))) and 
((e_22 = nil) impl (e_7 = 1 + (e_9 + e_6))) and 
((e_22 = u) impl (e_8 = 1 + (e_9 + e_6))) and 
((e_22 = v) impl (e_9 = 1 + (e_9 + e_6))) and 
((e_23 = d_1) impl (e_6 = 1 + (e_9 + e_7))) and 
((e_23 = nil) impl (e_7 = 1 + (e_9 + e_7))) and 
((e_23 = u) impl (e_8 = 1 + (e_9 + e_7))) and 
((e_23 = v) impl (e_9 = 1 + (e_9 + e_7))) and 
((e_24 = d_1) impl (e_6 = 1 + (e_9 + e_8))) and 
((e_24 = nil) impl (e_7 = 1 + (e_9 + e_8))) and 
((e_24 = u) impl (e_8 = 1 + (e_9 + e_8))) and 
((e_24 = v) impl (e_9 = 1 + (e_9 + e_8))) and 
((e_25 = d_1) impl (e_6 = 1 + (e_9 + e_9))) and 
((e_25 = nil) impl (e_7 = 1 + (e_9 + e_9))) and 
((e_25 = u) impl (e_8 = 1 + (e_9 + e_9))) and 
((e_25 = v) impl (e_9 = 1 + (e_9 + e_9))) and 
((v = v and u = v) impl (e_24 = e_25)) and 
((v = v and nil = u) impl (e_23 = e_24)) and 
((v = v and nil = v) impl (e_23 = e_25)) and 
((v = v and d_1 = nil) impl (e_22 = e_23)) and 
((v = v and d_1 = u) impl (e_22 = e_24)) and 
((v = v and d_1 = v) impl (e_22 = e_25)) and 
((u = v and v = d_1) impl (e_21 = e_22)) and 
((u = v and v = nil) impl (e_21 = e_23)) and 
((u = v and v = u) impl (e_21 = e_24)) and 
((u = v and v = v) impl (e_21 = e_25)) and 
((u = u and u = v) impl (e_20 = e_21)) and 
((u = v and u = d_1) impl (e_20 = e_22)) and 
((u = v and u = nil) impl (e_20 = e_23)) and 
((u = v and u = u) impl (e_20 = e_24)) and 
((u = v and u = v) impl (e_20 = e_25)) and 
((u = u and nil = u) impl (e_19 = e_20)) and 
((u = u and nil = v) impl (e_19 = e_21)) and 
((u = v and nil = d_1) impl (e_19 = e_22)) and 
((u = v and nil = nil) impl (e_19 = e_23)) and 
((u = v and nil = u) impl (e_19 = e_24)) and 
((u = v and nil = v) impl (e_19 = e_25)) and 
((u = u and d_1 = nil) impl (e_18 = e_19)) and 
((u = u and d_1 = u) impl (e_18 = e_20)) and 
((u = u and d_1 = v) impl (e_18 = e_21)) and 
((u = v and d_1 = d_1) impl (e_18 = e_22)) and 
((u = v and d_1 = nil) impl (e_18 = e_23)) and 
((u = v and d_1 = u) impl (e_18 = e_24)) and 
((u = v and d_1 = v) impl (e_18 = e_25)) and 
((nil = u and v = d_1) impl (e_17 = e_18)) and 
((nil = u and v = nil) impl (e_17 = e_19)) and 
((nil = u and v = u) impl (e_17 = e_20)) and 
((nil = u and v = v) impl (e_17 = e_21)) and 
((nil = v and v = d_1) impl (e_17 = e_22)) and 
((nil = v and v = nil) impl (e_17 = e_23)) and 
((nil = v and v = u) impl (e_17 = e_24)) and 
((nil = v and v = v) impl (e_17 = e_25)) and 
((nil = nil and u = v) impl (e_16 = e_17)) and 
((nil = u and u = d_1) impl (e_16 = e_18)) and 
((nil = u and u = nil) impl (e_16 = e_19)) and 
((nil = u and u = u) impl (e_16 = e_20)) and 
((nil = u and u = v) impl (e_16 = e_21)) and 
((nil = v and u = d_1) impl (e_16 = e_22)) and 
((nil = v and u = nil) impl (e_16 = e_23)) and 
((nil = v and u = u) impl (e_16 = e_24)) and 
((nil = v and u = v) impl (e_16 = e_25)) and 
((nil = nil and nil = u) impl (e_15 = e_16)) and 
((nil = nil and nil = v) impl (e_15 = e_17)) and 
((nil = u and nil = d_1) impl (e_15 = e_18)) and 
((nil = u and nil = nil) impl (e_15 = e_19)) and 
((nil = u and nil = u) impl (e_15 = e_20)) and 
((nil = u and nil = v) impl (e_15 = e_21)) and 
((nil = v and nil = d_1) impl (e_15 = e_22)) and 
((nil = v and nil = nil) impl (e_15 = e_23)) and 
((nil = v and nil = u) impl (e_15 = e_24)) and 
((nil = v and nil = v) impl (e_15 = e_25)) and 
((nil = nil and d_1 = nil) impl (e_14 = e_15)) and 
((nil = nil and d_1 = u) impl (e_14 = e_16)) and 
((nil = nil and d_1 = v) impl (e_14 = e_17)) and 
((nil = u and d_1 = d_1) impl (e_14 = e_18)) and 
((nil = u and d_1 = nil) impl (e_14 = e_19)) and 
((nil = u and d_1 = u) impl (e_14 = e_20)) and 
((nil = u and d_1 = v) impl (e_14 = e_21)) and 
((nil = v and d_1 = d_1) impl (e_14 = e_22)) and 
((nil = v and d_1 = nil) impl (e_14 = e_23)) and 
((nil = v and d_1 = u) impl (e_14 = e_24)) and 
((nil = v and d_1 = v) impl (e_14 = e_25)) and 
((d_1 = nil and v = d_1) impl (e_13 = e_14)) and 
((d_1 = nil and v = nil) impl (e_13 = e_15)) and 
((d_1 = nil and v = u) impl (e_13 = e_16)) and 
((d_1 = nil and v = v) impl (e_13 = e_17)) and 
((d_1 = u and v = d_1) impl (e_13 = e_18)) and 
((d_1 = u and v = nil) impl (e_13 = e_19)) and 
((d_1 = u and v = u) impl (e_13 = e_20)) and 
((d_1 = u and v = v) impl (e_13 = e_21)) and 
((d_1 = v and v = d_1) impl (e_13 = e_22)) and 
((d_1 = v and v = nil) impl (e_13 = e_23)) and 
((d_1 = v and v = u) impl (e_13 = e_24)) and 
((d_1 = v and v = v) impl (e_13 = e_25)) and 
((d_1 = d_1 and u = v) impl (e_12 = e_13)) and 
((d_1 = nil and u = d_1) impl (e_12 = e_14)) and 
((d_1 = nil and u = nil) impl (e_12 = e_15)) and 
((d_1 = nil and u = u) impl (e_12 = e_16)) and 
((d_1 = nil and u = v) impl (e_12 = e_17)) and 
((d_1 = u and u = d_1) impl (e_12 = e_18)) and 
((d_1 = u and u = nil) impl (e_12 = e_19)) and 
((d_1 = u and u = u) impl (e_12 = e_20)) and 
((d_1 = u and u = v) impl (e_12 = e_21)) and 
((d_1 = v and u = d_1) impl (e_12 = e_22)) and 
((d_1 = v and u = nil) impl (e_12 = e_23)) and 
((d_1 = v and u = u) impl (e_12 = e_24)) and 
((d_1 = v and u = v) impl (e_12 = e_25)) and 
((d_1 = d_1 and nil = u) impl (e_11 = e_12)) and 
((d_1 = d_1 and nil = v) impl (e_11 = e_13)) and 
((d_1 = nil and nil = d_1) impl (e_11 = e_14)) and 
((d_1 = nil and nil = nil) impl (e_11 = e_15)) and 
((d_1 = nil and nil = u) impl (e_11 = e_16)) and 
((d_1 = nil and nil = v) impl (e_11 = e_17)) and 
((d_1 = u and nil = d_1) impl (e_11 = e_18)) and 
((d_1 = u and nil = nil) impl (e_11 = e_19)) and 
((d_1 = u and nil = u) impl (e_11 = e_20)) and 
((d_1 = u and nil = v) impl (e_11 = e_21)) and 
((d_1 = v and nil = d_1) impl (e_11 = e_22)) and 
((d_1 = v and nil = nil) impl (e_11 = e_23)) and 
((d_1 = v and nil = u) impl (e_11 = e_24)) and 
((d_1 = v and nil = v) impl (e_11 = e_25)) and 
((d_1 = d_1 and d_1 = nil) impl (e_10 = e_11)) and 
((d_1 = d_1 and d_1 = u) impl (e_10 = e_12)) and 
((d_1 = d_1 and d_1 = v) impl (e_10 = e_13)) and 
((d_1 = nil and d_1 = d_1) impl (e_10 = e_14)) and 
((d_1 = nil and d_1 = nil) impl (e_10 = e_15)) and 
((d_1 = nil and d_1 = u) impl (e_10 = e_16)) and 
((d_1 = nil and d_1 = v) impl (e_10 = e_17)) and 
((d_1 = u and d_1 = d_1) impl (e_10 = e_18)) and 
((d_1 = u and d_1 = nil) impl (e_10 = e_19)) and 
((d_1 = u and d_1 = u) impl (e_10 = e_20)) and 
((d_1 = u and d_1 = v) impl (e_10 = e_21)) and 
((d_1 = v and d_1 = d_1) impl (e_10 = e_22)) and 
((d_1 = v and d_1 = nil) impl (e_10 = e_23)) and 
((d_1 = v and d_1 = u) impl (e_10 = e_24)) and 
((d_1 = v and d_1 = v) impl (e_10 = e_25)) and 
not( e_10 = d_1) and 
not( e_11 = nil) and 
not( e_12 = u) and 
not( e_13 = v) and 
not( e_14 = d_1) and 
not( e_15 = nil) and 
not( e_16 = u) and 
not( e_17 = v) and 
not( e_18 = d_1) and 
not( e_19 = nil) and 
not( e_20 = u) and 
not( e_21 = v) and 
not( e_22 = d_1) and 
not( e_23 = nil) and 
not( e_24 = u) and 
not( e_25 = v) and 
not( e_10 = d_1) and 
not( e_11 = d_1) and 
not( e_12 = d_1) and 
not( e_13 = d_1) and 
not( e_14 = nil) and 
not( e_15 = nil) and 
not( e_16 = nil) and 
not( e_17 = nil) and 
not( e_18 = u) and 
not( e_19 = u) and 
not( e_20 = u) and 
not( e_21 = u) and 
not( e_22 = v) and 
not( e_23 = v) and 
not( e_24 = v) and 
not( e_25 = v) and 
((e_11 = e_10) impl (nil = d_1)) and 
((e_12 = e_10) impl (u = d_1)) and 
((e_13 = e_10) impl (v = d_1)) and 
((e_15 = e_10) impl (nil = d_1)) and 
((e_16 = e_10) impl (u = d_1)) and 
((e_17 = e_10) impl (v = d_1)) and 
((e_19 = e_10) impl (nil = d_1)) and 
((e_20 = e_10) impl (u = d_1)) and 
((e_21 = e_10) impl (v = d_1)) and 
((e_23 = e_10) impl (nil = d_1)) and 
((e_24 = e_10) impl (u = d_1)) and 
((e_25 = e_10) impl (v = d_1)) and 
((e_10 = e_11) impl (d_1 = nil)) and 
((e_12 = e_11) impl (u = nil)) and 
((e_13 = e_11) impl (v = nil)) and 
((e_14 = e_11) impl (d_1 = nil)) and 
((e_16 = e_11) impl (u = nil)) and 
((e_17 = e_11) impl (v = nil)) and 
((e_18 = e_11) impl (d_1 = nil)) and 
((e_20 = e_11) impl (u = nil)) and 
((e_21 = e_11) impl (v = nil)) and 
((e_22 = e_11) impl (d_1 = nil)) and 
((e_24 = e_11) impl (u = nil)) and 
((e_25 = e_11) impl (v = nil)) and 
((e_10 = e_12) impl (d_1 = u)) and 
((e_11 = e_12) impl (nil = u)) and 
((e_13 = e_12) impl (v = u)) and 
((e_14 = e_12) impl (d_1 = u)) and 
((e_15 = e_12) impl (nil = u)) and 
((e_17 = e_12) impl (v = u)) and 
((e_18 = e_12) impl (d_1 = u)) and 
((e_19 = e_12) impl (nil = u)) and 
((e_21 = e_12) impl (v = u)) and 
((e_22 = e_12) impl (d_1 = u)) and 
((e_23 = e_12) impl (nil = u)) and 
((e_25 = e_12) impl (v = u)) and 
((e_10 = e_13) impl (d_1 = v)) and 
((e_11 = e_13) impl (nil = v)) and 
((e_12 = e_13) impl (u = v)) and 
((e_14 = e_13) impl (d_1 = v)) and 
((e_15 = e_13) impl (nil = v)) and 
((e_16 = e_13) impl (u = v)) and 
((e_18 = e_13) impl (d_1 = v)) and 
((e_19 = e_13) impl (nil = v)) and 
((e_20 = e_13) impl (u = v)) and 
((e_22 = e_13) impl (d_1 = v)) and 
((e_23 = e_13) impl (nil = v)) and 
((e_24 = e_13) impl (u = v)) and 
((e_11 = e_14) impl (nil = d_1)) and 
((e_12 = e_14) impl (u = d_1)) and 
((e_13 = e_14) impl (v = d_1)) and 
((e_15 = e_14) impl (nil = d_1)) and 
((e_16 = e_14) impl (u = d_1)) and 
((e_17 = e_14) impl (v = d_1)) and 
((e_19 = e_14) impl (nil = d_1)) and 
((e_20 = e_14) impl (u = d_1)) and 
((e_21 = e_14) impl (v = d_1)) and 
((e_23 = e_14) impl (nil = d_1)) and 
((e_24 = e_14) impl (u = d_1)) and 
((e_25 = e_14) impl (v = d_1)) and 
((e_10 = e_15) impl (d_1 = nil)) and 
((e_12 = e_15) impl (u = nil)) and 
((e_13 = e_15) impl (v = nil)) and 
((e_14 = e_15) impl (d_1 = nil)) and 
((e_16 = e_15) impl (u = nil)) and 
((e_17 = e_15) impl (v = nil)) and 
((e_18 = e_15) impl (d_1 = nil)) and 
((e_20 = e_15) impl (u = nil)) and 
((e_21 = e_15) impl (v = nil)) and 
((e_22 = e_15) impl (d_1 = nil)) and 
((e_24 = e_15) impl (u = nil)) and 
((e_25 = e_15) impl (v = nil)) and 
((e_10 = e_16) impl (d_1 = u)) and 
((e_11 = e_16) impl (nil = u)) and 
((e_13 = e_16) impl (v = u)) and 
((e_14 = e_16) impl (d_1 = u)) and 
((e_15 = e_16) impl (nil = u)) and 
((e_17 = e_16) impl (v = u)) and 
((e_18 = e_16) impl (d_1 = u)) and 
((e_19 = e_16) impl (nil = u)) and 
((e_21 = e_16) impl (v = u)) and 
((e_22 = e_16) impl (d_1 = u)) and 
((e_23 = e_16) impl (nil = u)) and 
((e_25 = e_16) impl (v = u)) and 
((e_10 = e_17) impl (d_1 = v)) and 
((e_11 = e_17) impl (nil = v)) and 
((e_12 = e_17) impl (u = v)) and 
((e_14 = e_17) impl (d_1 = v)) and 
((e_15 = e_17) impl (nil = v)) and 
((e_16 = e_17) impl (u = v)) and 
((e_18 = e_17) impl (d_1 = v)) and 
((e_19 = e_17) impl (nil = v)) and 
((e_20 = e_17) impl (u = v)) and 
((e_22 = e_17) impl (d_1 = v)) and 
((e_23 = e_17) impl (nil = v)) and 
((e_24 = e_17) impl (u = v)) and 
((e_11 = e_18) impl (nil = d_1)) and 
((e_12 = e_18) impl (u = d_1)) and 
((e_13 = e_18) impl (v = d_1)) and 
((e_15 = e_18) impl (nil = d_1)) and 
((e_16 = e_18) impl (u = d_1)) and 
((e_17 = e_18) impl (v = d_1)) and 
((e_19 = e_18) impl (nil = d_1)) and 
((e_20 = e_18) impl (u = d_1)) and 
((e_21 = e_18) impl (v = d_1)) and 
((e_23 = e_18) impl (nil = d_1)) and 
((e_24 = e_18) impl (u = d_1)) and 
((e_25 = e_18) impl (v = d_1)) and 
((e_10 = e_19) impl (d_1 = nil)) and 
((e_12 = e_19) impl (u = nil)) and 
((e_13 = e_19) impl (v = nil)) and 
((e_14 = e_19) impl (d_1 = nil)) and 
((e_16 = e_19) impl (u = nil)) and 
((e_17 = e_19) impl (v = nil)) and 
((e_18 = e_19) impl (d_1 = nil)) and 
((e_20 = e_19) impl (u = nil)) and 
((e_21 = e_19) impl (v = nil)) and 
((e_22 = e_19) impl (d_1 = nil)) and 
((e_24 = e_19) impl (u = nil)) and 
((e_25 = e_19) impl (v = nil)) and 
((e_10 = e_20) impl (d_1 = u)) and 
((e_11 = e_20) impl (nil = u)) and 
((e_13 = e_20) impl (v = u)) and 
((e_14 = e_20) impl (d_1 = u)) and 
((e_15 = e_20) impl (nil = u)) and 
((e_17 = e_20) impl (v = u)) and 
((e_18 = e_20) impl (d_1 = u)) and 
((e_19 = e_20) impl (nil = u)) and 
((e_21 = e_20) impl (v = u)) and 
((e_22 = e_20) impl (d_1 = u)) and 
((e_23 = e_20) impl (nil = u)) and 
((e_25 = e_20) impl (v = u)) and 
((e_10 = e_21) impl (d_1 = v)) and 
((e_11 = e_21) impl (nil = v)) and 
((e_12 = e_21) impl (u = v)) and 
((e_14 = e_21) impl (d_1 = v)) and 
((e_15 = e_21) impl (nil = v)) and 
((e_16 = e_21) impl (u = v)) and 
((e_18 = e_21) impl (d_1 = v)) and 
((e_19 = e_21) impl (nil = v)) and 
((e_20 = e_21) impl (u = v)) and 
((e_22 = e_21) impl (d_1 = v)) and 
((e_23 = e_21) impl (nil = v)) and 
((e_24 = e_21) impl (u = v)) and 
((e_11 = e_22) impl (nil = d_1)) and 
((e_12 = e_22) impl (u = d_1)) and 
((e_13 = e_22) impl (v = d_1)) and 
((e_15 = e_22) impl (nil = d_1)) and 
((e_16 = e_22) impl (u = d_1)) and 
((e_17 = e_22) impl (v = d_1)) and 
((e_19 = e_22) impl (nil = d_1)) and 
((e_20 = e_22) impl (u = d_1)) and 
((e_21 = e_22) impl (v = d_1)) and 
((e_23 = e_22) impl (nil = d_1)) and 
((e_24 = e_22) impl (u = d_1)) and 
((e_25 = e_22) impl (v = d_1)) and 
((e_10 = e_23) impl (d_1 = nil)) and 
((e_12 = e_23) impl (u = nil)) and 
((e_13 = e_23) impl (v = nil)) and 
((e_14 = e_23) impl (d_1 = nil)) and 
((e_16 = e_23) impl (u = nil)) and 
((e_17 = e_23) impl (v = nil)) and 
((e_18 = e_23) impl (d_1 = nil)) and 
((e_20 = e_23) impl (u = nil)) and 
((e_21 = e_23) impl (v = nil)) and 
((e_22 = e_23) impl (d_1 = nil)) and 
((e_24 = e_23) impl (u = nil)) and 
((e_25 = e_23) impl (v = nil)) and 
((e_10 = e_24) impl (d_1 = u)) and 
((e_11 = e_24) impl (nil = u)) and 
((e_13 = e_24) impl (v = u)) and 
((e_14 = e_24) impl (d_1 = u)) and 
((e_15 = e_24) impl (nil = u)) and 
((e_17 = e_24) impl (v = u)) and 
((e_18 = e_24) impl (d_1 = u)) and 
((e_19 = e_24) impl (nil = u)) and 
((e_21 = e_24) impl (v = u)) and 
((e_22 = e_24) impl (d_1 = u)) and 
((e_23 = e_24) impl (nil = u)) and 
((e_25 = e_24) impl (v = u)) and 
((e_10 = e_25) impl (d_1 = v)) and 
((e_11 = e_25) impl (nil = v)) and 
((e_12 = e_25) impl (u = v)) and 
((e_14 = e_25) impl (d_1 = v)) and 
((e_15 = e_25) impl (nil = v)) and 
((e_16 = e_25) impl (u = v)) and 
((e_18 = e_25) impl (d_1 = v)) and 
((e_19 = e_25) impl (nil = v)) and 
((e_20 = e_25) impl (u = v)) and 
((e_22 = e_25) impl (d_1 = v)) and 
((e_23 = e_25) impl (nil = v)) and 
((e_24 = e_25) impl (u = v)) and 
((e_14 = e_10) impl (nil = d_1)) and 
((e_15 = e_10) impl (nil = d_1)) and 
((e_16 = e_10) impl (nil = d_1)) and 
((e_17 = e_10) impl (nil = d_1)) and 
((e_18 = e_10) impl (u = d_1)) and 
((e_19 = e_10) impl (u = d_1)) and 
((e_20 = e_10) impl (u = d_1)) and 
((e_21 = e_10) impl (u = d_1)) and 
((e_22 = e_10) impl (v = d_1)) and 
((e_23 = e_10) impl (v = d_1)) and 
((e_24 = e_10) impl (v = d_1)) and 
((e_25 = e_10) impl (v = d_1)) and 
((e_14 = e_11) impl (nil = d_1)) and 
((e_15 = e_11) impl (nil = d_1)) and 
((e_16 = e_11) impl (nil = d_1)) and 
((e_17 = e_11) impl (nil = d_1)) and 
((e_18 = e_11) impl (u = d_1)) and 
((e_19 = e_11) impl (u = d_1)) and 
((e_20 = e_11) impl (u = d_1)) and 
((e_21 = e_11) impl (u = d_1)) and 
((e_22 = e_11) impl (v = d_1)) and 
((e_23 = e_11) impl (v = d_1)) and 
((e_24 = e_11) impl (v = d_1)) and 
((e_25 = e_11) impl (v = d_1)) and 
((e_14 = e_12) impl (nil = d_1)) and 
((e_15 = e_12) impl (nil = d_1)) and 
((e_16 = e_12) impl (nil = d_1)) and 
((e_17 = e_12) impl (nil = d_1)) and 
((e_18 = e_12) impl (u = d_1)) and 
((e_19 = e_12) impl (u = d_1)) and 
((e_20 = e_12) impl (u = d_1)) and 
((e_21 = e_12) impl (u = d_1)) and 
((e_22 = e_12) impl (v = d_1)) and 
((e_23 = e_12) impl (v = d_1)) and 
((e_24 = e_12) impl (v = d_1)) and 
((e_25 = e_12) impl (v = d_1)) and 
((e_14 = e_13) impl (nil = d_1)) and 
((e_15 = e_13) impl (nil = d_1)) and 
((e_16 = e_13) impl (nil = d_1)) and 
((e_17 = e_13) impl (nil = d_1)) and 
((e_18 = e_13) impl (u = d_1)) and 
((e_19 = e_13) impl (u = d_1)) and 
((e_20 = e_13) impl (u = d_1)) and 
((e_21 = e_13) impl (u = d_1)) and 
((e_22 = e_13) impl (v = d_1)) and 
((e_23 = e_13) impl (v = d_1)) and 
((e_24 = e_13) impl (v = d_1)) and 
((e_25 = e_13) impl (v = d_1)) and 
((e_10 = e_14) impl (d_1 = nil)) and 
((e_11 = e_14) impl (d_1 = nil)) and 
((e_12 = e_14) impl (d_1 = nil)) and 
((e_13 = e_14) impl (d_1 = nil)) and 
((e_18 = e_14) impl (u = nil)) and 
((e_19 = e_14) impl (u = nil)) and 
((e_20 = e_14) impl (u = nil)) and 
((e_21 = e_14) impl (u = nil)) and 
((e_22 = e_14) impl (v = nil)) and 
((e_23 = e_14) impl (v = nil)) and 
((e_24 = e_14) impl (v = nil)) and 
((e_25 = e_14) impl (v = nil)) and 
((e_10 = e_15) impl (d_1 = nil)) and 
((e_11 = e_15) impl (d_1 = nil)) and 
((e_12 = e_15) impl (d_1 = nil)) and 
((e_13 = e_15) impl (d_1 = nil)) and 
((e_18 = e_15) impl (u = nil)) and 
((e_19 = e_15) impl (u = nil)) and 
((e_20 = e_15) impl (u = nil)) and 
((e_21 = e_15) impl (u = nil)) and 
((e_22 = e_15) impl (v = nil)) and 
((e_23 = e_15) impl (v = nil)) and 
((e_24 = e_15) impl (v = nil)) and 
((e_25 = e_15) impl (v = nil)) and 
((e_10 = e_16) impl (d_1 = nil)) and 
((e_11 = e_16) impl (d_1 = nil)) and 
((e_12 = e_16) impl (d_1 = nil)) and 
((e_13 = e_16) impl (d_1 = nil)) and 
((e_18 = e_16) impl (u = nil)) and 
((e_19 = e_16) impl (u = nil)) and 
((e_20 = e_16) impl (u = nil)) and 
((e_21 = e_16) impl (u = nil)) and 
((e_22 = e_16) impl (v = nil)) and 
((e_23 = e_16) impl (v = nil)) and 
((e_24 = e_16) impl (v = nil)) and 
((e_25 = e_16) impl (v = nil)) and 
((e_10 = e_17) impl (d_1 = nil)) and 
((e_11 = e_17) impl (d_1 = nil)) and 
((e_12 = e_17) impl (d_1 = nil)) and 
((e_13 = e_17) impl (d_1 = nil)) and 
((e_18 = e_17) impl (u = nil)) and 
((e_19 = e_17) impl (u = nil)) and 
((e_20 = e_17) impl (u = nil)) and 
((e_21 = e_17) impl (u = nil)) and 
((e_22 = e_17) impl (v = nil)) and 
((e_23 = e_17) impl (v = nil)) and 
((e_24 = e_17) impl (v = nil)) and 
((e_25 = e_17) impl (v = nil)) and 
((e_10 = e_18) impl (d_1 = u)) and 
((e_11 = e_18) impl (d_1 = u)) and 
((e_12 = e_18) impl (d_1 = u)) and 
((e_13 = e_18) impl (d_1 = u)) and 
((e_14 = e_18) impl (nil = u)) and 
((e_15 = e_18) impl (nil = u)) and 
((e_16 = e_18) impl (nil = u)) and 
((e_17 = e_18) impl (nil = u)) and 
((e_22 = e_18) impl (v = u)) and 
((e_23 = e_18) impl (v = u)) and 
((e_24 = e_18) impl (v = u)) and 
((e_25 = e_18) impl (v = u)) and 
((e_10 = e_19) impl (d_1 = u)) and 
((e_11 = e_19) impl (d_1 = u)) and 
((e_12 = e_19) impl (d_1 = u)) and 
((e_13 = e_19) impl (d_1 = u)) and 
((e_14 = e_19) impl (nil = u)) and 
((e_15 = e_19) impl (nil = u)) and 
((e_16 = e_19) impl (nil = u)) and 
((e_17 = e_19) impl (nil = u)) and 
((e_22 = e_19) impl (v = u)) and 
((e_23 = e_19) impl (v = u)) and 
((e_24 = e_19) impl (v = u)) and 
((e_25 = e_19) impl (v = u)) and 
((e_10 = e_20) impl (d_1 = u)) and 
((e_11 = e_20) impl (d_1 = u)) and 
((e_12 = e_20) impl (d_1 = u)) and 
((e_13 = e_20) impl (d_1 = u)) and 
((e_14 = e_20) impl (nil = u)) and 
((e_15 = e_20) impl (nil = u)) and 
((e_16 = e_20) impl (nil = u)) and 
((e_17 = e_20) impl (nil = u)) and 
((e_22 = e_20) impl (v = u)) and 
((e_23 = e_20) impl (v = u)) and 
((e_24 = e_20) impl (v = u)) and 
((e_25 = e_20) impl (v = u)) and 
((e_10 = e_21) impl (d_1 = u)) and 
((e_11 = e_21) impl (d_1 = u)) and 
((e_12 = e_21) impl (d_1 = u)) and 
((e_13 = e_21) impl (d_1 = u)) and 
((e_14 = e_21) impl (nil = u)) and 
((e_15 = e_21) impl (nil = u)) and 
((e_16 = e_21) impl (nil = u)) and 
((e_17 = e_21) impl (nil = u)) and 
((e_22 = e_21) impl (v = u)) and 
((e_23 = e_21) impl (v = u)) and 
((e_24 = e_21) impl (v = u)) and 
((e_25 = e_21) impl (v = u)) and 
((e_10 = e_22) impl (d_1 = v)) and 
((e_11 = e_22) impl (d_1 = v)) and 
((e_12 = e_22) impl (d_1 = v)) and 
((e_13 = e_22) impl (d_1 = v)) and 
((e_14 = e_22) impl (nil = v)) and 
((e_15 = e_22) impl (nil = v)) and 
((e_16 = e_22) impl (nil = v)) and 
((e_17 = e_22) impl (nil = v)) and 
((e_18 = e_22) impl (u = v)) and 
((e_19 = e_22) impl (u = v)) and 
((e_20 = e_22) impl (u = v)) and 
((e_21 = e_22) impl (u = v)) and 
((e_10 = e_23) impl (d_1 = v)) and 
((e_11 = e_23) impl (d_1 = v)) and 
((e_12 = e_23) impl (d_1 = v)) and 
((e_13 = e_23) impl (d_1 = v)) and 
((e_14 = e_23) impl (nil = v)) and 
((e_15 = e_23) impl (nil = v)) and 
((e_16 = e_23) impl (nil = v)) and 
((e_17 = e_23) impl (nil = v)) and 
((e_18 = e_23) impl (u = v)) and 
((e_19 = e_23) impl (u = v)) and 
((e_20 = e_23) impl (u = v)) and 
((e_21 = e_23) impl (u = v)) and 
((e_10 = e_24) impl (d_1 = v)) and 
((e_11 = e_24) impl (d_1 = v)) and 
((e_12 = e_24) impl (d_1 = v)) and 
((e_13 = e_24) impl (d_1 = v)) and 
((e_14 = e_24) impl (nil = v)) and 
((e_15 = e_24) impl (nil = v)) and 
((e_16 = e_24) impl (nil = v)) and 
((e_17 = e_24) impl (nil = v)) and 
((e_18 = e_24) impl (u = v)) and 
((e_19 = e_24) impl (u = v)) and 
((e_20 = e_24) impl (u = v)) and 
((e_21 = e_24) impl (u = v)) and 
((e_10 = e_25) impl (d_1 = v)) and 
((e_11 = e_25) impl (d_1 = v)) and 
((e_12 = e_25) impl (d_1 = v)) and 
((e_13 = e_25) impl (d_1 = v)) and 
((e_14 = e_25) impl (nil = v)) and 
((e_15 = e_25) impl (nil = v)) and 
((e_16 = e_25) impl (nil = v)) and 
((e_17 = e_25) impl (nil = v)) and 
((e_18 = e_25) impl (u = v)) and 
((e_19 = e_25) impl (u = v)) and 
((e_20 = e_25) impl (u = v)) and 
((e_21 = e_25) impl (u = v))
 ); 

query :=  (rlqe ex(vars, formula)); 

end; 
