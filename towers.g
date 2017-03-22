torre:=function(q,n)
  local s, i, l, b, a, lambda, lt;
  l:=[1];
  b:=[q-1];
  a:=q;
  lambda:=[1,q-1];
  if n=1 then return NumericalSemigroup(1); fi;
  for i in [2..n] do
    if (i mod 2=0) then
        Add(lambda,0);
        Add(b,a*b[i-1]);
    else
        Add(lambda,lambda[i-1]*a);
        Add(b,lambda[i+1]+b[i-1]*a);
    fi;
  od;
  l:=Union([0],a*[1..b[1]],[a*b[1]..a*b[1]+a-1]);
  for i in [2..n] do
    l:=Union(a*l ,[(a*b[i])..(a*b[i])+a^i]);
  od;
  s:=NumericalSemigroupBySmallElementsNC(Intersection(l, [0..a*b[n]]));
  return s;
end;
