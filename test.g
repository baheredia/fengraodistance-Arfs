arfs := ArfNumericalSemigroupClosure(RandomNumericalSemigroup(100,500,1000));;
se := SmallElementsOfNumericalSemigroup(arfs);;
conductor := ConductorOfNumericalSemigroup(arfs);;
m := 2*conductor-1;;
fengRaoDistance(ars,m,2);;
time;
FR2Arf(se);;
time;
