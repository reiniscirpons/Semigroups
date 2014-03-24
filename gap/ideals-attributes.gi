############################################################################# 
## 
#W  ideals-attributes.gi
#Y  Copyright (C) 2013-14                                 James D. Mitchell
## 
##  Licensing information can be found in the README file of this package. 
## 
############################################################################# 
##

InstallMethod(MaximalDClasses, "for an acting semigroup ideal",
[IsActingSemigroup and IsSemigroupIdeal],
function(I)
  local data, pos, partial, classes, out, i;

   data:=SemigroupData(I);
   data!.stopper:=Length(GeneratorsOfSemigroupIdeal(I));
   Enumerate(data, infinity, ReturnFalse);
   #install the generators, and their descendants
   data!.stopper:=false; 
   
   pos:=[1..data!.genspos-1]; # the D-classes of the generators in positions
                              # [1..n-1] in data!.dorbit
   
   partial:=data!.poset;
   classes:=data!.dorbit;
   out:=[];
   for i in pos do 
     if not ForAny([1..Length(partial)], j-> j<>i and i in partial[j]) then 
      Add(out, classes[i]);
    fi;
  od;

  return out;
end);

# 

InstallMethod(SmallIdealGeneratingSet, "for an acting semigroup ideal",
[IsActingSemigroup and IsSemigroupIdeal],
function(I)
  local max, out;

  out := [];
  if Length(GeneratorsOfSemigroupIdeal(I)) = 1 then
    return GeneratorsOfSemigroupIdeal(I);
  else
    for max in MaximalDClasses(I) do
      Add(out, Representative(max));
    od;
  fi;

  return out;
end);

#JDM: is there a better method?

InstallMethod(InversesOfSemigroupElementNC, "for an acting semigroup ideal",
[IsActingSemigroup and IsSemigroupIdeal, IsAssociativeElement],
function(I, x)
  return InversesOfSemigroupElementNC(SupersemigroupOfIdeal(I), x);
end);

#

InstallMethod(IsomorphismTransformationSemigroup, 
"for a semigroup ideal",
[IsSemigroupIdeal and HasGeneratorsOfSemigroupIdeal],
function(I)
  local iso, inv, J;

  iso:=IsomorphismTransformationSemigroup(Parent(I));
  inv:=InverseGeneralMapping(iso);
  J:=SemigroupIdeal(Range(iso), Images(iso, GeneratorsOfSemigroupIdeal(I)));

  return MagmaIsomorphismByFunctionsNC(I, J, x-> x^iso, x-> x^inv);
end);

