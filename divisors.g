# Here I will put functions to explore things about Feng-Rao distances of
# Arf numerical semigroups

# This function just gives the set of divisors
divisors := function(s,n)
        return Filtered(Intersection([0..n],s), z -> n-z in s);
end;

# This function gives the set of divisors of several elements
divisorsOfMany := function(s, lst)
        return Union(List(lst, x -> divisors(s,x)));
end;

# This only works for n>=c
secondFengRao := function(s, n)
        local m, lst;
        m:= MultiplicityOfNumericalSemigroup(s);
        lst := List(Intersection([n..n+m],s), i -> List(Intersection([i+1..i+m],s), j-> Length(divisorsOfMany(s,[i,j]))));
        return Minimum(List([1..Length(lst)],x-> Minimum(lst[x])));
end;


# Some things for Arf numerical semigroups

lastGenerators := function(s)
        local gener, len;
        gener := MinimalGeneratingSystemOfNumericalSemigroup(s);
        len := Length(gener);
        return [gener[len-1],gener[len]];
end;

fromSeqToSemigroup := function(l)
        local gen;
        gen := List([1..Length(l)],x->Sum(l{[x..Length(l)]}));
        return NumericalSemigroupBySmallElements(Union([0],Reversed(gen)));
end;

fromSemigroupToSeq := function(s)
        local sml, lst;
        sml := SmallElementsOfNumericalSemigroup(s);
        lst :=List([2..Length(sml)],x -> sml[x]-sml[x-1]);
        return Reversed(lst);
end;

previousSemigroup := function(s)
        local lst;
        lst := fromSemigroupToSeq(s);
        return fromSeqToSemigroup(lst{[1..Length(lst)-1]});
end;


checkConj := function(s)
        local ss, c, m;
        ss := previousSemigroup(s);
        c := ConductorOfNumericalSemigroup(s);
        m := MultiplicityOfNumericalSemigroup(s);
        return ForAll([c+m..2*c+3],x -> secondFengRao(s, x)=secondFengRao(ss,x-2*m) + 3);
end;
