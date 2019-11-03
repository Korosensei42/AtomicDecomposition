# -*- coding: utf-8 -*-
"""
Created on Sat Sep  7 12:43:54 2019

@author: kweir
"""
PRINT_RESULT = "result"
PRINT_ATOMDECOMP = "decomp"
PRINT_INPUTFORMULA = "input"

PICTURE_PATH = "Tests\\Testgraphs\\"
PICTURE_PATH_WITH_FORMULAS = "Tests\\TestgraphsWithFormulasOnTop\\"
PICTURE_PATH_WITH_DECOMP = "Tests\\TestgraphsWithAtomicDecompOnTop\\"
REDLOG_PATH = "Redlog\\RedlogInputFiles\\"

SET_OP_UN = "union"
SET_OP_IN = "intersect"
SET_OP_COM = "neg"
BIN_SET_OPS = {SET_OP_UN, SET_OP_IN}
SET_OPS = {SET_OP_UN, SET_OP_IN, SET_OP_COM}

SET_PRED_EQ = "setequals"
SET_PRED_NEQ = "setnotequals"
SET_PRED_SEQ = "subsetequals"
SET_PRED_SUB = "subset"
SET_PREDS = {SET_PRED_EQ, SET_PRED_SEQ, SET_PRED_SUB} #SET_PRED_NEQ not included, since it is not allowed as an input

SET_CONST_EMPTY = "emptyset"
SET_CONST_UNIVERSE = "U"

ARIT_OP_PLUS = "+"
ARIT_OP_MEASURE = "m"
ARIT_OP_CONST = "c"
UNARY_ARIT_OPS = {ARIT_OP_MEASURE, ARIT_OP_CONST}
ARIT_OPS = {ARIT_OP_PLUS, ARIT_OP_MEASURE, ARIT_OP_CONST}

ARIT_PRED_EQ = "arithequals"
ARIT_PRED_LEQ = "leq"
ARIT_PRED_NEQ = "arithnotequals"
ARIT_PREDS = {ARIT_PRED_EQ, ARIT_PRED_LEQ}

PREDS = SET_PREDS.union(ARIT_PREDS, {SET_PRED_NEQ})

LOG_OP_AND = "and"
LOG_OP_OR = "or"
LOG_OP_NOT = "not"
LOG_OP_IMPL = "implies"
BIN_LOG_OPS = {LOG_OP_AND, LOG_OP_OR, LOG_OP_IMPL}
LOG_OPS = {LOG_OP_AND, LOG_OP_OR, LOG_OP_NOT, LOG_OP_IMPL}

BIN_PREDS_OPS = {ARIT_OP_PLUS, ARIT_PRED_NEQ}.union(PREDS, BIN_LOG_OPS)

SET_FORMULA_STRING = "Setformula"
ARIT_FORMULA_STRING = "Arithmeticalformula"

NUMBER_OF_TESTS = 48

import copy
import ast
from itertools import combinations
from copy import deepcopy
import re
import itertools
import time

def printPreambel():
    print("""begin_problem(SetTheoryExample).
          list_of_descriptions.
          name({* SetTheoryExample *}).
          author({* Kevin Weirauch *}).
          status(unknown).
          description({* A description logic example. *}).
          end_of_list. \n
          list_of_symbols.""")

# Input: nr_of_at_vars (Number of atomic variables, Integer)
# Output: A list containing all binary numbers that have a length of nr_of_at_vars
def createBinNums(nr_of_at_vars):
    return [format(i, '0{}b'.format(nr_of_at_vars)) for i in range(2**nr_of_at_vars)]

# Input: Two lists labeled list1 and list2.
# Output: A list that has all elements that are in list1, but not in list2
def diff(list1, list2):
    list_dif = [i for i in list1 + list2 if i not in list1 or i not in list2]
    if list_dif == []:
        list_dif = [SET_CONST_EMPTY]
    return list_dif

# Input: A list of binary numbers and an integer index.
# Output: A list of all binary numbers that have a 1 at position index - 1.
# Alternatively thought of as a list that does not contain the numbers that have 0 at position index - 1.
# For this function the indexing starts at 1, which explains the shift to index - 1.
def deleteElemsFromBinList(binNums, index):
    return [binNum for binNum in binNums if binNum[index - 1] == "1"]

# Input: A list of binary numbers
# Output: A list equal to the input, except for the fact that now there is the letter V in front of every number
def createVennRegions(binNums):
    return ["V" + binNum for binNum in binNums]

# Input: A list of sets, that is of the form "x1, x2, ..., xn".
# Output: A list containing all binary numbers of length n.
def createUniverseRepresentation(sets):
    return createVennRegions(createBinNums(len(sets)))

# three handlers to handle the different set theoretic functions

# Input: A list representing a term of form [[setexprleft], [setexprright]] as well as a list of sets of form [x1, ..., xn]
# Output: A list containing all elements that are either in the left or the right setexpression or in both.
def unionHandler(term, sets):
    setexprleft = createVennRepresentation(term[0], sets)
    setexprright = createVennRepresentation(term[1], sets)
    return list(set(setexprleft) | set(setexprright))

# Input: A list representing a term of form [[setexprleft], [setexprright]] as well as a list of sets of form [x1, ..., xn]
# Output: A list containing all elements that only are in both setexpressions.
def intersectHandler(term, sets):
    setexprleft = createVennRepresentation(term[0], sets)
    setexprright = createVennRepresentation(term[1], sets)
    res = [venn_region for venn_region in setexprleft if venn_region in setexprright]
    if res == []:
        res = [SET_CONST_EMPTY]
    return [venn_region for venn_region in setexprleft if venn_region in setexprright]

# Input: A list representing a term of form [setexpr] as well as a list of sets of form [x1, ..., xn]
# Output: A list containing all elements that are not in the setexpression, i.e. that represent the complement of the setexpression
def negHandler(term, sets):
    universe = createVennRepresentation([SET_CONST_UNIVERSE], sets)
    subtractThis = createVennRepresentation(term, sets)
    return diff(universe, subtractThis)

# Input: As list of sets of form [x1, ..., xn] as well as a term of one of the following forms:
# ["emptyset"]
# ["U"]
# ["xj"] for a j between 1 and n.
# ["union", [[termleft], [termright]]]
# ["intersect", [[termleft], [termright]]]
# ["neg", [term]]
# Output: A list of vennregions resembling the union of vennregions that represents the term.
def createVennRepresentation(term, sets):
    res = term
    term_op = res[0]
    # induction start
    if term_op == SET_CONST_EMPTY:
        pass
    if term_op == SET_CONST_UNIVERSE:
        res = createUniverseRepresentation(sets)
    if term_op in sets:
        universe = createBinNums(len(sets))
        singleton_set_binNums = deleteElemsFromBinList(universe, int(term_op[1:]))
        res = createVennRegions(singleton_set_binNums)
    # inductive step
    if term_op == SET_OP_UN:
        remaining_term = res[1]
        res = unionHandler(remaining_term, sets)
    if term_op == SET_OP_COM:
        remaining_term = res[1]
        remaining_term = flattenUnneccessaryListLevels(remaining_term)
        res = negHandler(remaining_term, sets)
    if term_op == SET_OP_IN:
        remaining_term = res[1]
        res = intersectHandler(remaining_term, sets)
    res = [vennregion for vennregion in res if vennregion != SET_CONST_EMPTY]
    if res == []:
        res = [SET_CONST_EMPTY]
    return res

# Input: A list of form [setpredicate, [leftside, rightside]] representing a formula, where leftside
# and rightside are lists themselves representing a union of vennregions. Example of a formula: [SET_PRED_EQ, [["V11", "V01"], ["V00", "V01"]]]
# Output: The same list as the input with the difference, that all vennregions that appeared in leftside and rightside are deleted
def simplifyVennRepresentations(formula):
    op = formula[0]
    if op in SET_PREDS:
        left_hand = formula[1][0]
        right_hand = formula[1][1]
        on_both_sides = set(left_hand).intersection(set(right_hand))
        new_left_hand = [vennregion for vennregion in left_hand if vennregion not in on_both_sides]
        new_right_hand = [vennregion for vennregion in right_hand if vennregion not in on_both_sides]
        if new_left_hand == []:
            new_left_hand = [SET_CONST_EMPTY]
        if new_right_hand == []:
            new_right_hand = [SET_CONST_EMPTY]
        return [op, [new_left_hand, new_right_hand]]
    else:
        raise ValueError("Die eingegebene Formel benötigt an erster Stelle ein Mengenprädikat.")

# Input: A list of form [[left_formula], [right_formula]] representing a formula and a string mode representing a logical connective.
# Output: A conjunction, disjunction or similar of left_formula and right_formula.
def connectSubformulas(formula, mode):
    if len(formula) <= 1:
        return formula
    if len(formula) == 2:
        left_formula = formula[0]
        right_formula = formula[1]
        return [str(mode), [left_formula, right_formula]]
    else:
        tmp = formula[:-1]
        return [str(mode), [connectSubformulas(tmp, mode), [formula[-1]]]]

# Creates a big disjunction or conjunction out of a setformula only containing formulas that compare with the empty set
# Input: A list consisting of vennregions
# Output: If ven_nrep is of form [V1, V2, V3,..., Vn] this function
# returns [con, [[con, [[...[[con, [[V1], [V2]]]]]]],... [Vn]]] where con is a logical connective ("and" or "or") depending on
# the value of equalBool. con is "and" iff equalBool s True and "or" otherwise
def vennRepToEqualityWithEmptyset(venn_rep, equalBool):
    res = venn_rep
    if len(res) == 0: # emptyset
        return res
    if len(res) == 1 and equalBool:
        return [SET_PRED_EQ, [[res[0]], [SET_CONST_EMPTY]]]
    if len(res) == 1 and not equalBool:
        return [SET_PRED_NEQ, [[res[0]], [SET_CONST_EMPTY]]]
    else:
        # introduce emptyset for each Venn-Region
        for i in range(len(res)):
            res[i] = [vennRepToEqualityWithEmptyset([res[i]], equalBool)]
        # to fix the error that the formula is one level too deep
        for i in range(len(res)):
            res[i] = res[i][0]
        if equalBool:
            res = connectSubformulas(res, LOG_OP_AND)
        if not equalBool:
            res = connectSubformulas(res, LOG_OP_OR)
        return res

# Input: A list consisting of a setformula
# Output: A list consisting of equalities of vennregions with the emptyset.
def setFormulaToEqualitiesWithEmptyset(formula, sets):
    setpred = formula[0]
    venn_regions = formula[1]
    venn_regions_left = venn_regions[0]
    venn_regions_right = venn_regions[1]
    if setpred == SET_PRED_EQ:
        venn_regions_left = vennRepToEqualityWithEmptyset(venn_regions_left, True)
        venn_regions_right = vennRepToEqualityWithEmptyset(venn_regions_right, True)
        venn_regions = connectSubformulas([venn_regions_left, venn_regions_right], LOG_OP_AND)
    if setpred == SET_PRED_SEQ:
        venn_regions = vennRepToEqualityWithEmptyset(venn_regions_left, True)
    if setpred == SET_PRED_SUB:
        venn_regions_left = vennRepToEqualityWithEmptyset(venn_regions_left, True)
        venn_regions_right = vennRepToEqualityWithEmptyset(venn_regions_right, False)
        venn_regions = connectSubformulas([venn_regions_left, venn_regions_right], LOG_OP_AND)
    return venn_regions

# Input of form [m, [set]], Output is sum of measures of VennRegions
# Input: A list of form ["m", [V1, ..., Vn]] where the list [V1,..., Vn] is assumed to represent a union of vennregions
# Result: A list consisting the term m(V1) + ... m(Vn) in prefix notation.
def simplifyMeasures(formula):
    token = formula[0]
    if token == ARIT_OP_PLUS:
        left_term = formula[1][0]
        right_term = formula[1][1]
        return [ARIT_OP_PLUS, [simplifyMeasures(left_term), simplifyMeasures(right_term)]]
    if token == ARIT_OP_MEASURE:
        vennregions = formula[1]
        if len(vennregions) == 1:
            return [ARIT_OP_MEASURE, vennregions]
        if len(vennregions) == 2:
            first_vennregion = vennregions[0]
            second_vennregion = vennregions[1]
            return [ARIT_OP_PLUS, [[ARIT_OP_MEASURE, [first_vennregion]], [ARIT_OP_MEASURE, [second_vennregion]]]]
        else:
            tmp = vennregions[:-1]
            return [ARIT_OP_PLUS, [[ARIT_OP_MEASURE, [vennregions[-1]]], [simplifyMeasures([ARIT_OP_MEASURE, tmp])]]]
        return formula

# Applies the algorithm for atomic set decomposition for a set formula
# Input: A list representing a formula of type set as well as a list of sets [x1, ...,xn]
# Output: A equisatisfiable formula that only includes comparisons of vennregions with the empty set
def setFormulasMain(formula, sets):
    res = []
    setpred = formula[0]
    left_term = formula[1][0]
    right_term = formula[1][1]
    # especially for complementary sets there can be additional levels of nesting. The next four lines remove them
    while len(left_term) == 1 and isinstance(left_term[0], list):
        left_term = left_term[0]
    while len(right_term) == 1 and isinstance(right_term[0], list):
        right_term = right_term[0]
    left_term = createVennRepresentation(left_term, sets)
    right_term = createVennRepresentation(right_term, sets)
    res = [setpred, [left_term, right_term]]
    res = simplifyVennRepresentations(res)
    res = setFormulaToEqualitiesWithEmptyset(res, sets)
    res = rewriteSetEquality(res)
    return res

# Input: A list that represents an arithmetical term, for example ["m", [xi]] for some set xi, as well as a list of sets.
# Output: The same list in which the sets are replaced by their vennrepresentation
def simplifyArithTerm(term, sets):
    arit_op = term[0]
    res = term
    if arit_op == ARIT_OP_MEASURE:
        set_term = term[1]
        set_term = createVennRepresentation(set_term, sets)
        res[1] = set_term
        return res
    elif arit_op == ARIT_OP_PLUS:
        left_term = term[1][0]
        right_term = term[1][1]
        return [ARIT_OP_PLUS, [simplifyArithTerm(left_term, sets), simplifyArithTerm(right_term, sets)]]
    elif arit_op[0] == ARIT_OP_CONST:
        return term
    else:
        raise ValueError("There has to be an arithmetical function or constant on top. Instead it is: " + str(arit_op))

# Input: A list representing a arithmetic formula as well as a list of sets
# Output: The same formula, only that all sets within it are repplaced by their vennRegions and measures of unions are replaced by a  sum of measures
def aritIntroduceVennRepsAndSumOfMeasures(formula, sets):
    arit_token = formula[0]
    if arit_token in ARIT_PREDS:
        left_term = formula[1][0]
        right_term = formula[1][1]
        left_term = simplifyArithTerm(left_term, sets)
        right_term = simplifyArithTerm(right_term, sets)
        left_term = simplifyMeasures(left_term)
        right_term = simplifyMeasures(right_term)
        return [arit_token, [left_term, right_term]]
    else:
        raise ValueError("Die eingegebene Formel ist keine arithmetische Formel. Das Prädikat müsste leq oder arithequals sein, es ist aber: " + str(arit_token))

# distinguishes between a arithmetic formula and a set formula
def detectTypeOfFormula(formula, sets):
    pred = formula[0]
    if pred in SET_PREDS:
        return SET_FORMULA_STRING
    if pred in ARIT_OPS or pred in ARIT_PREDS or pred[0] == ARIT_OP_CONST:
        return ARIT_FORMULA_STRING
    else:
        raise ValueError("Die Eingabe ist weder eine Mengenformel noch eine arithmetische Formel: " + str(formula))

# Input: A list that may or may not contain multiple unneccessary nestings, such as [[[]]]
# Output: A list that has such unneccessary nestings removed, if they are present
# Example: Should reduce ["neg", [["x1"]]] to ["neg", ["x1"]]
def flattenUnneccessaryListLevels(flattenThis):
    if isinstance(flattenThis[0], list) and len(flattenThis) <= 1 and flattenThis[0] != []:
        flattenThis = flattenThis[0]
    for i in range(len(flattenThis)):
        if isinstance(flattenThis[i], list) and flattenThis[i] != [] and len(flattenThis[i]) <= 1:
            if isinstance(flattenThis[i][0], list):
                flattenThis[i] = flattenThis[i][0]
                flattenThis[i] = flattenUnneccessaryListLevels([flattenThis[i]])
    return flattenThis

# Input: A list
# Output: A string that is equal to the string representation of the inputlist with the exception that the brackets are missing
def flattenWholeList(nested_list):
    nested_list = deepcopy(nested_list)
    while nested_list:
        sublist = nested_list.pop(0)
        if isinstance(sublist, list):
            nested_list = sublist + nested_list
        else:
            yield sublist

# Input: A list representing a formula
# Output: A list containing a conjunction of instances of the axioms M1 and M2 for every atomic set occuring in the formula
# Axioms from M1 are of form 0 <= m(V1010)
# Axioms from M2 are of form (V1010 = emptyset) implies (m(V1010) = 0)
# Finds the instances of the axioms M1 (non-negativity) and M2 (the empty set has measure 0) for all sets inside a formula
def findM1M2(formula):
    tmpM1 = [[ARIT_PRED_LEQ, [[0], [ARIT_OP_MEASURE, [formula[i + 1][0:]]]]] for i in range(len(formula) - 1)
    if formula[i + 1][0] == "V" and formula[i] == ARIT_OP_MEASURE]
    tmpM1.sort()
    tmpM1 = list(item for item,_ in itertools.groupby(tmpM1))
    tmpM2 = [[LOG_OP_IMPL, [[SET_PRED_EQ, [[formula[i + 1][0:]], [SET_CONST_EMPTY]]], [ARIT_PRED_EQ, [[ARIT_OP_MEASURE, [formula[i + 1][0:]]], [0]]]]] for i in range(len(formula) - 1)
                                    if formula[i + 1][0] == "V" and formula[i] == ARIT_OP_MEASURE]
    tmpM2.sort()
    tmpM2 = list(item for item,_ in itertools.groupby(tmpM2))
    tmpM1 = connectSubformulas(tmpM1, LOG_OP_AND)
    tmpM2 = connectSubformulas(tmpM2, LOG_OP_AND)
    tmp = connectSubformulas([tmpM1, tmpM2], LOG_OP_AND)
    return tmp

# Input: A list representing a formula and a list representing a collection of sets
# Output: A list representing the conjunction of a list containing the axioms M1 and M2 as well as a list containing the formula with only measure atoms of form m(Vx)
# adds the instances found in findM1M2 to a formula
def addM1M2(formula, sets):
    res = formula
    res = aritIntroduceVennRepsAndSumOfMeasures(res, sets)
    tmp = list(flattenWholeList(res))
    tmp = findM1M2(tmp)
    res = [LOG_OP_AND, [res, tmp]]
    return res

# Input: A list representing a formula as well as a list representing a collection of sets
# Output: A list containing the formula after the algorithm of atomic decomposition
def purifyArithFormula(formula, sets):
    res = formula
    res = addM1M2(res, sets)
    res = replaceMeasuresWithVars(res, sets)
    res = rewriteSetEquality(res)
    return res

# Input: A list representing a formula as well as a list representing a collection of sets
# Output: A list representing the formula where all terms of form m(Vx) become mVx (thus eliminating function application and creating a constant)
def replaceMeasuresWithVars(formula, sets):
    tmp = formula
    token = tmp[0]
    if isinstance(token, list):
        return replaceMeasuresWithVars(token, sets)
    if token == ARIT_OP_MEASURE:
        tmp = introduceNewArithVars(tmp)
        return tmp
    if token in ARIT_PREDS.union(BIN_LOG_OPS, {ARIT_OP_PLUS}):
        terms = tmp[1]
        left_term = terms[0]
        right_term = terms[1]
        if replaceMeasuresWithVars(left_term, sets) != None:
            left_term = replaceMeasuresWithVars(left_term, sets)
        if replaceMeasuresWithVars(right_term, sets) != None:
            right_term = replaceMeasuresWithVars(right_term, sets)
        return [token, [left_term, right_term]]
    else:
        return formula

#print(replaceMeasuresWithVars(['leq', [['m', ['U']], [0]]], ["x1"]))

# Input: A list containing the measureoperator "m" as well as a Vennregion. The form is: ["m", ["Vx"]]
# Output: A list containing a constant representing the measure from before. The form is: ["mx"]
def introduceNewArithVars(measureOfVennRegion):
    res = measureOfVennRegion
    vennRegion = res[1]
    if vennRegion[0] == SET_CONST_EMPTY:
        return [0]
    if vennRegion[0] == SET_CONST_UNIVERSE:
        return [ARIT_OP_MEASURE + vennRegion[0]]
    elif vennRegion[0][0] == "V":
        vennRegionIndex = vennRegion[0][1:]
        return [ARIT_OP_MEASURE + vennRegionIndex]
    else:
        raise ValueError("Die Eingabe muss ein Term sein, der das Maß einer Vennregion angibt. Stattdessen ist sie: \n\n" + str(measureOfVennRegion))

# print(introduceNewArithVars(["m", ["V11"]]))

# Input: A list representing a formula of type set
# Output: A list representing the same formula only converted to arithmetical type
# Rewrites a comparison of two sets to a comparison of sets with the empty set
def rewriteSetEquality(formula):
    tmp = flattenUnneccessaryListLevels(formula)
    token = tmp[0]
    if token in BIN_LOG_OPS:
        left_term = tmp[1][0]
        right_term = tmp[1][1]
        return [token, [rewriteSetEquality(left_term), rewriteSetEquality(right_term)]]
    if token in {SET_PRED_EQ, SET_PRED_NEQ}:
        left_term = tmp[1][0]
        right_term = tmp[1][1]
        if right_term == [SET_CONST_EMPTY]:
            if left_term[0][0:] != SET_CONST_EMPTY:
                left_term = [ARIT_OP_CONST + left_term[0][1:]]
            if left_term[0][0:] == SET_CONST_EMPTY:
                left_term = [0]
            right_term = [0]
        tmp[1][0] = left_term
        tmp[1][1] = right_term
        if token == SET_PRED_EQ:
            tmp[0] = ARIT_PRED_EQ
        elif token == SET_PRED_NEQ:
            tmp[0] = ARIT_PRED_NEQ
    return tmp

# print(rewriteSetEquality(["setequals", [["V110"], ["V011"]]]))

# Input: A list representing a formula, as well as a list representing a collection of sets
# Output: A list representing the same formula after the algorithm of atomic set decomposition
# to bundle everything together
def main(formula, sets):
#    start_time = time.time()
    res = formula
    for i in range(len(formula)):
        if detectTypeOfFormula(formula[i], sets) == SET_FORMULA_STRING:
            res[i] = setFormulasMain(formula[i], sets)
            continue
        if detectTypeOfFormula(formula[i], sets) == ARIT_FORMULA_STRING:
            res[i] = purifyArithFormula(formula[i], sets)
            continue
    res = connectSubformulas(res, LOG_OP_AND)
#    print("In total:--- %s seconds ---" % (time.time() - start_time))
    return res

# set1 = ["neg", ["union", ["x2", "x1"]]]
# set2 = ["union", [["intersect", ["x1", "x3"]], "x2"]]
# testRegions = createVennRepresentation([set2, set1], ["x1", "x2", "x3"])
# print(testRegions)
# testFormula = ["subset", testRegions, "setequals", testRegions]
# print(testFormula)
# testSimplifiedRepresentaion = simplifyVennRepresentations(testFormula)
# print(testSimplifiedRepresentaion)
#print(setFormulaToEqualitiesWithEmptyset([SET_PRED_SUB, [['V0000', 'V0001', 'V1111'],
#['V1110', 'V1010', 'V0000', 'V0101']]],
#["x1", "x2", "x3", "x4"]))
# print(vennRepToEqualityWithEmptyset(["V1100", "V1111", "V0000", "V1010"], False))
# print(connectSubformulas(["V1100", "V1111", "V0000", "V1010"], "and"))
# print(connectSubformulas(vennRepToEqualityWithEmptyset(["V1100", "V1111", "V0000", "V1010"]), "and")
# print(simplifyMeasures(["m", ["V1110", "V0000", "V1111", "V0101", "V1001"]]))
# print(unifyListToVennRepresentation(['V1110', 'V0000', 'V1111', 'V0101']))
# testMain = setFormulasMain([["subset", [set2, set1]], ["equals", [set2, set1]]], ["x1", "x2", "x3"])
# print(testMain)
# for i in range(len(testMain)):
#    print(str(i) + ": " + str(testMain[i]))
# testArith = [["arithequals", [["m", ["x1"]], ["m", ["x2"]]]]]
# print("Resultat: " + str(setFormulasMain(testArith[0], ["x1", "x2"])))
# print("testArith: " + str(aritIntroduceVennRepsAndSumOfMeasures(testArith, ["x1", "x2", "x3"])))
# flat = flattenUnneccessaryListLevels(aritIntroduceVennRepsAndSumOfMeasures(testArith, ["x1", "x2", "x3"]))
# print("Flat: " + str(flat))
# totallyFlat = list(flattenWholeList(flat));
# print("Totally Flat: " + str(totallyFlat))
# M1M2 = findM1M2(totallyFlat)
# print("M1M2: " + str(M1M2))
# print("addedM1M2: " + str(addM1M2(flat, ["x1", "x2", "x3"])))
# purifyTest = purifyArithFormula(testArith, ["x1", "x2", "x3"])
# print("purified arithmetical formula: " + str(purifyTest))

# x1 setequals (x2 union x3); m(x1) + m(x2) arithequals m(x2)
testAll = [["arithequals", [["+", [["m", ["x1"]], ["m", ["x2"]]]], ["m", ["union", ["x1", "x2"]]]]],
           ["setequals", ["x1", ["union", ["x2", "x3"]]]]]

# , ["setequals", ["x1", ["union", ["x2", "x3"]]]]
# mainTest = main(testAll, ["x1", "x2", "x3"])
# print(mainTest)

# the following functions are there to make it easier for the user to input testformulas

# the user enters a term of sort set
def enterSetTerm():
    res = input(
        "Please enter either an atomic set like U, emptyset or xn, where n is a natural number or enter one of the words union, intersect or neg: ")
    if res in {SET_CONST_EMPTY, SET_CONST_UNIVERSE}:
        return [res]
    if res[0] == "x":
        return [res]
    if res == SET_OP_UN or res == SET_OP_IN:
        return [res, [enterSetTerm(), enterSetTerm()]]
    if res == SET_OP_COM:
        return [res, [enterSetTerm()]]
    if res not in SET_OPS.union({SET_CONST_EMPTY, SET_CONST_UNIVERSE}) and res[0] != "x":
        raise ValueError("You have to enter a set like U, emptyset or xn (n a natural numnber) or a set operation like union, intersect or neg")
    return res

# the user enters a formula of type set
def enterSetFormula():
    res = input("Please enter one of the words subsetequals, subset or setequals: \n")
    if res not in SET_PREDS:
        raise ValueError("You have to enter subsetequals, subset or setequals for a setformula")
    return [res, [enterSetTerm(), enterSetTerm()]]

# the user enters an arithmetical term
def enterArithTerm():
    res = input(
        "Please enter one of the symbols + or m: \n")
#    if res[0] == ARIT_OP_CONST:
#        return [res]
    if res == ARIT_OP_MEASURE:
        setTerm = enterSetTerm()
        res = [res, [setTerm]]
        flattenUnneccessaryListLevels(res)
        return res
    if res == ARIT_OP_PLUS:
        return [res, [enterArithTerm(), enterArithTerm()]]
    if res not in {ARIT_OP_MEASURE, ARIT_OP_PLUS}:
        raise ValueError("You have to enter +, denoting a sum, or m, denoting a measure of a set")

# the user enters an arithmetical formula
def enterArithFormula():
    res = input("Please enter one of the words arithequals or leq: \n")
    if res not in {"leq", "arithequals"}:
        raise ValueError("You have to input arithequals or leq for arithmetical formulas")
    return [res, [enterArithTerm(), enterArithTerm()]]

# the user enters any arithmetical formula or any formula of type set by first deciding what he wants to enter.
def enterFormula():
    numberOfFormulas = input(
        "Please enter a natural number greater or equal to 1. This number determines how many formulas you want to enter: \n")
    if not numberOfFormulas.isdigit():
        raise ValueError("You have to enter a natural number for the number of formulas")
    if int(numberOfFormulas) <= 0:
        raise ValueError("The number of formulas has to be greater or equal to 1")
    res = []
    for i in range(int(numberOfFormulas)):
        query = input(
            "Please enter the letter A to enter a arithmetic formula or the letter S to enter a set formula: \n")
        if query.lower() == "a":
            res.append(enterArithFormula())
        if query.lower() == "s":
            res.append(enterSetFormula())
        if query not in {"s", "S", "a", "A"}:
            raise ValueError("You have to enter a or s to announce a arithmetical formula or a set formula")
    print("Your formula looks like this:\n" + str(res))
    return res

# ask the user if he wants to be guided or not. If not, then he can enter via commandline or via a file
def getUserInput():
    query = input(
        "If you want to be guided through the process of entering a formula, please press Y/y. If not, please press N/n \n: ")
    if query.lower() == "y":
        numberOfSets = input(
            "Please enter a natural number n greater or equal to 1. This will determine the maximum index of all sets of form xj you will use from now on. Please don't use an index greater than this: \n")
        sets = []
        for i in range(int(numberOfSets)):
            sets.append("x" + str(i + 1))
        tmp = enterFormula()
        formula = copy.deepcopy(tmp)
        return [main(tmp, sets), formula]
    if query.lower() == "n":
        return decideTypeOfInput()
    if query not in {"n", "N", "y", "Y"}:
        raise ValueError("You have to enter y for yes or n for no")

# bundles all user inputs together
def displayResult():
    res = getUserInput()
    formula = res[1]
    res = res[0]
    res = flattenUnneccessaryListLevels(res)
    toGraphBool = input("If you want your resulting formula to be displayed as a graph, press Y/y. If not, press N/n: \n")
    if toGraphBool not in {"n", "N", "y", "Y"}:
        raise ValueError("You have to enter y for yes or n for no")
    if toGraphBool.lower() == "y":
        imagetitle = input("Please enter the title of the image: \n")
        printmodes = set()
        PLAIN_BOOL = input("Do you wish for a graph that only contains the result in graph form? [Y/N]\n")
        if PLAIN_BOOL.lower() == "y":
            printmodes.add(PRINT_RESULT)
        RESULT_BOOL = input("Do you wish for a graph that containts a node representing the result in list form? [Y/N]\n")
        if RESULT_BOOL.lower() == "y":
            printmodes.add(PRINT_ATOMDECOMP)
        INPUT_BOOL = input("Do you wish for a graph that contains a node representing the orgininal input formula? [Y/N]\n")
        if INPUT_BOOL.lower() == "y":
            printmodes.add(PRINT_INPUTFORMULA)
        printGraph(formula, res, Node(copy.deepcopy(formula)), printmodes, imagetitle)
    redlog_bool = input("Do you want the result to be printed to a redlogfile? [Y/N]\n")
    if redlog_bool.lower() == "y":
        name = input("Please enter the name of your redlog file:\n")
        printFormulaToRedlogFile([res], name)
        print("Redlogfile got created!")
    print("The result of the atomic decomposition looks like this: \n" + str(res))

def displayResultFromConstantInput(inputfile):
    filename = inputfile
    filepath = "Tests/" + str(filename)
    with open(filepath, "r") as file:
        content = [i.strip() for i in file.readlines() if len(i.strip()) > 0]
    sets = ast.literal_eval(content[-1])
    formula = ast.literal_eval(content[0])
    res =  main(formula, sets)
#    res = flattenUnneccessaryListLevels(res)
#    toGraphBool = input("If you want your resulting formula to be displayed as a graph, press Y/y. If not, press N/n: \n")
#    if toGraphBool not in {"n", "N", "y", "Y"}:
#        raise ValueError("You have to enter y for yes or n for no")
#    if toGraphBool.lower() == "y":
#        testgraph = nestedListToGraph(res)
#        imagetitle = input("Please enter the title of the image: \n")
#        UniqueDotExporter(testgraph).to_picture(PICTURE_PATH + imagetitle + ".png")
#    print("The result of the atomic decomposition looks like this: \n" + str(res))

# decides whether a file or the command line should server as the input
def decideTypeOfInput():
    query = input(
        "Please press F to enter your formula from a file or press C to enter your formula in the console: \n")
    if query.lower() == "f":
        return getFileInput()
    if query.lower() == "c":
        formulaInput = input("Please enter a list of all formulas: \n")
        setInput = input("Please enter a list of all sets included in your formulas: \n")
        formulaInput = ast.literal_eval(formulaInput)
        setInput = ast.literal_eval(setInput)
        return [formulaInput, main(formulaInput, setInput)]

# reads a file and runs the main method with it's contents. The contents have to be of the following form
# The first n lines contain the formula. The (n+1)st line is empty. The (n+2)nd line contains the sets considered.
def getFileInput():
    filename = input(
        "Please enter the name of the file your formula is contained in. Also make sure that your formula is seperated from your sets by one empty line and that your sets are all on a single line: \n")
    filepath = "Tests/" + str(filename)
    with open(filepath, "r") as file:
        content = [i.strip() for i in file.readlines() if len(i.strip()) > 0]
    sets = ast.literal_eval(content[-1])
    formula = ast.literal_eval(content[0])
    return [formula, main(formula, sets)]


def printFormulaToRedlogFile(formula, name):
    if CREATE_REDLOG_FILES_BOOL:
        redlogfilepath = REDLOG_PATH + name + ".txt"
        formula_as_string = listToString(formula[0])
        content = setupRedlogFile(formula_as_string)
        writeInFile(redlogfilepath, content)

# only recommended to turn this on iff changes occured to the tests
PRINT_TESTS_TO_GRAPHS_BOOL = True
CREATE_REDLOG_FILES_BOOL = True
ONLY_RESULT_BOOL = True
WITH_ATOM_DECOMP_BOOL = True
WITH_INPUTS_BOOL = True

def executeAllTests():
    # filename = input(
        # "Please enter the name of the file your formula is contained in. Also make sure that your formula is seperated from your sets by one empty line and that your sets are all on a single line: \n")
    for i in range(1, NUMBER_OF_TESTS + 1):
        try:
            filepath = "Tests/test" + str(i) + ".txt"
    # file = open(filepath, "r")
            with open(filepath, "r") as file:
                content = [i.strip() for i in file.readlines() if len(i.strip()) > 0]
            formula = ast.literal_eval(content[0])
            inputformula = copy.deepcopy(formula)
            inputnode = []
            if WITH_INPUTS_BOOL:
                inputnode = Node(inputformula)
            sets = ast.literal_eval(content[-1])
            print("Test " + str(i) + ": \n")
            print("Formulas: " + str(formula))
            print("Sets: "+ str(sets))
            output = main(formula, sets)
            name = "RedlogTest" + str(i)
            printFormulaToRedlogFile(output, name)
            print("Output: " + str(output) + "\n")
            print("________________________________________________________________________________________________\n")
            printmodes = setupPrintmodes()
            printGraph(formula, output, inputnode, printmodes, "test" + str(i))
        except Exception as e:
            print("This test does not work yet, because of: " + str(e) + "\n")
            print("________________________________________________________________________________________________\n")
            pass

def setupPrintmodes():
    if PRINT_TESTS_TO_GRAPHS_BOOL:
        # for the current tests there is only one single formula in each output. So this suffices
        printmodes = set()
        if ONLY_RESULT_BOOL:
            printmodes.add(PRINT_RESULT)

# In case one wishes for the output in listform to be on top as a node:
        if WITH_ATOM_DECOMP_BOOL:
            printmodes.add(PRINT_ATOMDECOMP)

        if WITH_INPUTS_BOOL:
            printmodes.add(PRINT_INPUTFORMULA)
    return printmodes

def printGraph(formula, output, inputnode, printmodes, name):
    # for the current tests there is only one single formula in each output. So this suffices
    if PRINT_RESULT in printmodes:
        outputgraph_or = nestedListToGraph(output)
        UniqueDotExporter(outputgraph_or).to_picture(PICTURE_PATH + name + ".png")
        print("Printed a graph with only the result in it")
# In case one wishes for the output in listform to be on top as a node:
    if PRINT_ATOMDECOMP in printmodes:
        outputgraph_ad = nestedListToGraph(output)
        rootnode_ad = Node(output, children = {outputgraph_ad})
        UniqueDotExporter(rootnode_ad).to_picture(PICTURE_PATH_WITH_DECOMP + name + ".png")
        print("Printed a graph with the result in listform")
    if PRINT_INPUTFORMULA in printmodes:
        outputgraph_wi = nestedListToGraph(output)
        rootnode_wi = Node(output, parent = inputnode, children = {outputgraph_wi})
        UniqueDotExporter(inputnode).to_picture(PICTURE_PATH_WITH_FORMULAS + name + ".png")
        print("Printed a graph with input formula and result in listform")
def findCombinations(iterable):
    res = sum([list(map(list, combinations(iterable, i))) for i in range(len(iterable) + 1)], [])
    res = [item for item in res if len(item) == 2]
    return res

def setupAllTest():
    i = 0
    combos = findCombinations({SET_CONST_EMPTY, SET_CONST_UNIVERSE, "x1"})
    # setting up tests with set-formulas
    for setpred in SET_PREDS:
        for sets in combos:
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[setpred, [[sets[0]], [sets[1]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[setpred, [[sets[1]], [sets[0]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[setpred, [[sets[0]], [[SET_OP_COM, ["x1"]]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[setpred, [[SET_OP_COM, ["x1"]], [sets[0]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
    # setting up tests with arithmetical formulas
    for aritpred in ARIT_PREDS:
        for sets in combos:
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[aritpred, [[ARIT_OP_MEASURE, [sets[0]]], [ARIT_OP_MEASURE, [sets[1]]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
            i = i + 1
            testname = "Tests/Test{testnumber}.txt".format(testnumber = i)
            content = str([[aritpred, [[ARIT_OP_MEASURE, [sets[1]]], [ARIT_OP_MEASURE, [sets[0]]]]]]) + "\n\n[\'x1\']"
            writeInFile(testname, content)
    return

def writeInFile(filename, content):
    file = open(filename, "w+")
    file.write(content)
    file.close()
    return

def listToGraph(in_list):
    tmp_list = flattenUnneccessaryListLevels(in_list)
    if len(tmp_list) > 0:
        if tmp_list[0] in BIN_PREDS_OPS:
            return appendGraphs(str(tmp_list[0]), tmp_list[1][0], tmp_list[1][1])
        if isinstance(tmp_list, str):
            return Node(tmp_list)
        root = Node(str(tmp_list[0]))
        tmp = root
        remaining_nodes = tmp_list[1:]
        for entry in remaining_nodes:
            append_node = Node(str(entry), parent=tmp)
            tmp = append_node
        return root
    else:
        raise ValueError("No graph can be created from an empty list")

def appendGraphs(rootcontent, in_list_1, in_list_2):
    if in_list_1 == []:
        in_list_1 = [SET_CONST_EMPTY]
    if in_list_2 == []:
        in_list_2 = [SET_CONST_EMPTY]
    graph1 = listToGraph(in_list_1)
    graph2 = listToGraph(in_list_2)
    root = Node(rootcontent, children=(graph1, graph2))
    return root

def nestedListToGraph(in_list):
    rootcontent = in_list[0]
    if rootcontent in BIN_PREDS_OPS:
        left_graph = in_list[1][0]
        right_graph = in_list[1][1]
        left_graph = listToGraph(left_graph)
        right_graph = listToGraph(right_graph)
        root = Node(rootcontent, children=(left_graph, right_graph))
    return root

def listToString(in_list):
    tmp_list = flattenUnneccessaryListLevels(in_list)
    token = tmp_list[0]
    optionalNegation = ""
    optionalBracketLeft = ""
    optionalBracketRight = ""
    if token in BIN_PREDS_OPS:
        if token == ARIT_PRED_EQ:
            token = "="
        if token == ARIT_PRED_LEQ:
            token = "<="
        if token == ARIT_PRED_NEQ:
            token = "="
            optionalNegation = "not"
            optionalBracketLeft = "("
            optionalBracketRight = ")"
        if token == LOG_OP_IMPL:
            token = "impl"
        res = " " + str(token) + " "
        left_part = tmp_list[1][0]
        right_part = tmp_list[1][1]
        return "(" + optionalNegation + optionalBracketLeft + listToString(left_part) + "\n" + res + "\n" +  listToString(right_part) + optionalBracketRight + ")"
#        return "(" + optionalNegation + optionalBracketLeft + listToString(left_part) + res +  listToString(right_part) + optionalBracketRight + ")"
    return str(token)

test = listToString(['and', [['arithequals', [['+', [['+', [['m111'], ['+', [['m110'], ['+', [['m100'], ['m101']]]]]]], ['+', [['m111'], ['+', [['m110'], ['+', [['m010'], ['m011']]]]]]]]], ['+', [['m100'], ['+', [['m101'], ['+', [['m010'], ['+', [['m011'], ['+', [['m111'], ['m110']]]]]]]]]]]]], ['and', [['and', [['and', [['and', [['and', [['and', [['leq', [[0], ['m010']]], ['leq', [[0], ['m011']]]]], ['leq', [[0], ['m100']]]]], ['leq', [[0], ['m101']]]]], ['leq', [[0], ['m110']]]]], ['leq', [[0], ['m111']]]]], ['and', [['and', [['and', [['and', [['and', [['implies', [['arithequals', [['c010'], [0]]], ['arithequals', [['m010'], [0]]]]], ['implies', [['arithequals', [['c011'], [0]]], ['arithequals', [['m011'], [0]]]]]]], ['implies', [['arithequals', [['c100'], [0]]], ['arithequals', [['m100'], [0]]]]]]], ['implies', [['arithequals', [['c101'], [0]]], ['arithequals', [['m101'], [0]]]]]]], ['implies', [['arithequals', [['c110'], [0]]], ['arithequals', [['m110'], [0]]]]]]], ['implies', [['arithequals', [['c111'], [0]]], ['arithequals', [['m111'], [0]]]]]]]]]]])

def getVarsFromString(in_str):
    listOfWords = re.sub("[^\w]", " ",  in_str).split()
    allvars = [var for var in listOfWords if var.startswith("m") or var.startswith("c")]
    allvars = set(allvars)
    return allvars;

def setupRedlogFile(in_str):
    allvars = "vars := " + str(getVarsFromString(in_str)).replace("'", "")
    remainingFile =  """load_package redlog;\nrlset OFSF;\noff rlverbose;\non rlnzden;\n\n""" + allvars + ";"  """\n
    formula := """ + in_str + ";\n"+ "query := (rlqe ex(vars, formula));\n\nend;".replace("'", "")
    return remainingFile

def check_for_balanced_parantheses(expression):
    """
    Finds out how balanced an expression is.
    With a string containing only brackets.

    >>> is_matched('[]()()(((([])))')
    False
    >>> is_matched('[](){{{[]}}}')
    True
    """
    opening = tuple('({[')
    closing = tuple(')}]')
    mapping = dict(zip(opening, closing))
    queue = []

    for letter in expression:
        if letter in opening:
            queue.append(mapping[letter])
        elif letter in closing:
            if not queue or letter != queue.pop():
                return False
    return not queue

# print(getVarsFromString("((m1 <= (m0 + m1)) and ((0 <= m1) and ((not(c1 = 0)) impl (m1 = 0))))"))

# setupRedlogFile("((m1 <= (m0 + m1)) and ((0 <= m1) and ((not(c1 = 0)) impl (m1 = 0))))")

# print(listToString(['and', [['leq', [['m1'], ['+', [['m0'], ['m1']]]]], ['and', [['leq', [[0], ['m1']]], ['implies', [[ARIT_PRED_NEQ, [['c1'], [0]]], ['arithequals', [['m1'], [0]]]]]]]]]))

#graph = nestedListToGraph(['and', [['leq', [['m1'], ['+', [['m0'], ['m1']]]]], ['and', [['leq', [[0], ['m1']]], ['implies', [['arithequals', [['c1'], [0]]], ['arithequals', [['m1'], [0]]]]]]]]])
#UniqueDotExporter(graph).to_picture(PICTURE_PATH + "nestedTest.png")
#
#appendedGraphs = appendGraphs("Hi", [1,2,3], [])
#DotExporter(appendedGraphs).to_picture(PICTURE_PATH + "appended.png")

# DotExporter(testListToGraph([1, 2, 3, 4, 5])).to_picture("root.png")
# setupAllTest()

# just a boolean to decide whether every test should be executed
testAllBool = False
if testAllBool:
    executeAllTests()

#testExampleFromPaper = [["subsetequals", [["x1"], ["x2"]]], [arithequals, [["m", ["x1"]], ["m", ["intersect", [["x1"], ["neg", ["x2"]]]]]]]]
#result = main(testExampleFromPaper, ["x1", "x2"])
#print(result)

#testBiggerFormula = main( [['leq', [['+', [['+', [['m', ['x1']], ['m', ['x2']]]], ['m', ['x3']]]], ["+", [['m', ['x1']], ["m", ["x2"]]]]]]], ["x1", "x2", "x3"])
#print(testBiggerFormula)
#
#graph = nestedListToGraph(testBiggerFormula[0])
#UniqueDotExporter(graph).to_picture(PICTURE_PATH + "biggerFormula.png")
#
#testBiggerSetFormula = main([["setequals", [["union", [["x2"], ["neg", ["x2"]]]], ["x2"]]]] , ["x1", "x2", "x3", "x4", "x5"])
#print(testBiggerSetFormula)
#
#graph = nestedListToGraph(testBiggerSetFormula[0])
#UniqueDotExporter(graph).to_picture(PICTURE_PATH + "biggerFormula.png")

# print(str(BIN_PREDS_OPS))

# print(main([[SET_PRED_SUB, [["x1"], ["x1"]]]], ["x1"]))

# print(main([["arithequals", [["+", [["m", ["x1"]], ["m", ["x2"]]]], ["m", ["union", ["x1", "x2"]]]]], ["setequals", ["x1", ["union", ["x2", "x3"]]]]], ["x1", "x2", "x3"]))
def benchmarkTest(name, attempts):
    start_time = time.time()
    for i in range(attempts + 1):
        displayResultFromConstantInput(name)
    executionTime = (time.time() - start_time)
    print("In total for all test runs:--- %s seconds ---" % executionTime)
    print("On average:--- %s seconds ---" % (executionTime/attempts))

benchmarkTest("BenchmarkTestConjunction1000.txt", 100)

def appendNTimes(n):
    res = []
    for i in range(n):
        res.append(["leq", [["m", ["x1"]], ["m", ["x1"]]]])
    print(str(res))

#appendNTimes(1000)

#displayResult()

# [['subset', [['neg', [['union', [['x1'], ['intersect', [['x2'], ['x3']]]]]]], ['union', [['x2'], ['x3']]]]], ['leq', [['+', [['m', ['union', [['x1'], ['x3']]]], ['m', ['x2']]]], ['+', [['+', [['m', ['x1']], ['m', ['intersect', [['x2'], ['x3']]]]]], ['m', ['x1']]]]]]]

# print(check_for_balanced_parantheses("(((c000 = 0) and ((((not(c111 = 0)) or (not(c110 = 0))) or (not(c101 = 0))) or (not(c011 = 0)))) and ((((m100 + (m101 + (m001 + (m011 + (m111 + m110))))) + (m111 + (m110 + (m010 + m011)))) <= (((m111 + (m110 + (m100 + m101))) + (m011 + m111)) + (m111 + (m110 + (m100 + m101))))) and ((((((((0 <= m001) and (0 <= m010)) and (0 <= m011)) and (0 <= m100)) and (0 <= m101)) and (0 <= m110)) and (0 <= m111)) and ((((((((c001 = 0) impl (m001 = 0)) and ((c010 = 0) impl (m010 = 0))) and ((c011 = 0) impl (m011 = 0))) and ((c100 = 0) impl (m100 = 0))) and ((c101 = 0) impl (m101 = 0))) and ((c110 = 0) impl (m110 = 0))) and ((c111 = 0) impl (m111 = 0))))));"))