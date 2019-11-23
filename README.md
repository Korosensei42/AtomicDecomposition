Please see the file Commandline_atomic_decomp.pdf for a setup tutorial.

As for the actual content of this repository:

The code provided implements the algorithm for atomic set decomposition.
This is used to transform a set- and/or arithmetical formula to a purely
arithmetical formula. The resulting formula can then be represented as a graph
and can also be copied to a text file which serves as input for Reduce/Redlog, a
prover that can decide such formulas.

Thus, in total, the algorithm provided gives a possibility to decide
the satisfiablitity of set formulas and arithmetical formulas.

The restrictions are:
- any formula entered should not contain any formula with more than 8 set variables.
Otherwise Redlog can't handle the size of the resulting formula.
- the transformation for formulas with up to 9 set variables still works, but those
formulas can't be decided by Redlog as stated in the last point

The extensions are:
- opposed to the original version of the algorithm in research, this implementation
contains the possibility to have multiplication within the formulas. This results in
the possibility to decide formulas that model conditional probabilities.
