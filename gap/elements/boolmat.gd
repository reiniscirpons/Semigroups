############################################################################
##
#W  boolean.gd
#Y  Copyright (C) 2015                                   James D. Mitchell
##
##  Licensing information can be found in the README file of this package.
##
#############################################################################
##

# This file contains an implementation of boolean matrices.

#############################################################################
## Specializations of declarations for MatrixOverSemiring
#############################################################################

DeclareCategory("IsBooleanMat", IsMatrixOverSemiring);

DeclareCategoryCollections("IsBooleanMat");
DeclareCategoryCollections("IsBooleanMatCollection");

BindGlobal("BooleanMatFamily",
           NewFamily("BooleanMatFamily",
                     IsBooleanMat, CanEasilySortElements,
                     CanEasilySortElements));
BindGlobal("BooleanMatType",
           NewType(BooleanMatFamily,
                   IsBooleanMat));

DeclareGlobalFunction("BooleanMat");
DeclareGlobalFunction("BooleanMatNC");

DeclareOperation("RandomBooleanMat", [IsPosInt]);

#############################################################################
## Declarations specifically for Boolean mats
#############################################################################

DeclareOperation("AsBooleanMat", [IsAssociativeElement, IsPosInt]);
DeclareOperation("AsBooleanMat", [IsAssociativeElement]);

DeclareOperation("NumberBooleanMat", [IsBooleanMat]);
DeclareOperation("BooleanMatNumber", [IsPosInt, IsPosInt]);
DeclareGlobalFunction("NumberBlist");
DeclareGlobalFunction("BlistNumber");

DeclareGlobalFunction("SEMIGROUPS_HashFunctionBooleanMat");
DeclareAttribute("Successors", IsBooleanMat);
DeclareGlobalFunction("BooleanMatBySuccessorsNC");

DeclareProperty("IsRowTrimBooleanMat", IsBooleanMat);
DeclareProperty("IsColTrimBooleanMat", IsBooleanMat);
DeclareProperty("IsTrimBooleanMat", IsBooleanMat);

DeclareGlobalFunction("OnBlist");

DeclareAttribute("SEMIGROUPS_SetBooleanMat", IsBooleanMat);
DeclareAttribute("CanonicalBooleanMat", IsBooleanMat);
DeclareOperation("CanonicalBooleanMat", [IsPermGroup, IsBooleanMat]);
DeclareOperation("CanonicalBooleanMat",
                 [IsPermGroup, IsPermGroup, IsBooleanMat]);
DeclareOperation("CanonicalBooleanMatNC",
                 [IsPermGroup, IsPermGroup, IsBooleanMat]);

DeclareProperty("IsSymmetricBooleanMat", IsBooleanMat);
DeclareProperty("IsAntiSymmetricBooleanMat", IsBooleanMat);
DeclareProperty("IsTransitiveBooleanMat", IsBooleanMat);
DeclareProperty("IsReflexiveBooleanMat", IsBooleanMat);

DeclareProperty("IsTotalBooleanMat", IsBooleanMat);
DeclareProperty("IsOntoBooleanMat", IsBooleanMat);

DeclareSynonymAttr("IsPartialOrderBooleanMat", IsAntiSymmetricBooleanMat and
                   IsTransitiveBooleanMat and IsReflexiveBooleanMat);
DeclareSynonymAttr("IsEquivalenceBooleanMat", IsSymmetricBooleanMat and
                   IsTransitiveBooleanMat and IsReflexiveBooleanMat);