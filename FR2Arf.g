FR2Arf:=function(SE)
  local r, m, i, d1,d2, disc, e, E, k;

  r:=Length(SE);
  m:=List([1..r-1], i-> SE[i+1]-SE[i]);
  Sort(m);
  e:=m[1];
  E:=e;
  d1:=List([1..e],_->2);
  d2:=List([1..e-1],_->3);
  Add(d2,4);
  disc:=List([1..e],_->0);

  k:=2;
  if (m[1]>2) then
    while (k<r) do
      e:=m[k];
      if (e>E) then
        disc:=Concatenation([0],disc);
        d1:=Concatenation([2],d1);
        d2:=Concatenation([5],d2);
        disc:=Concatenation(List([1..e-1],_->0),disc);
        d1:=Concatenation(List([1..e-1],_->2),d1);
        d2:=Concatenation(List([1..e-1],_->3),d2);
        for i in [e+1..Length(disc)] do
          disc[i]:=0;
          d1[i]:=d1[i]+2;
          d2[i]:=d2[i]+3;
        od;
        E:=e;
      else
        disc:=Concatenation(List([1..e],_->0),disc);
        d1:=Concatenation(List([1..e],_->0),d1);
        d2:=Concatenation(List([1..e],_->0),d2);
        for i in [1..Length(disc)-e] do
          d1[i]:=d1[i+e];
        od;
        for i in [Length(disc)-e+1..Length(disc)] do
          d1[i]:=d1[i-1]+1;
        od;
        for i in [e+1..Length(disc)] do
          if (d1[i]=d2[i]) then
            disc[i]:=1;
          else
            disc[i]:=0;
          fi;
        od;
        for i in Reversed([e+1..Length(disc)]) do
          d1[i]:=d1[i-e];
        od;
        for i in [1..e] do
          d1[i]:=0;
        od;
        for i in [1..Length(disc)] do
          d1[i]:=d1[i]+2;
          d2[i]:=d2[i]+3-disc[i];
        od;
        d2[e]:=d2[e]+1;
      fi;
      k:=k+1;
    od;
  else
    while (k<r) do
      e:=m[k];
      if e=2 then
        disc:=Concatenation([0,0],disc);
        d1:=Concatenation([0,0],d1);
        d2:=Concatenation([0,0],d2);
        for i in [1..Length(disc)-e] do
          d1[i]:=d1[i+e];
        od;
        for i in [Length(disc)-e+1.. Length(disc)] do
          d1[i]:=d1[i-1]+1;
        od;
        for i in [e+1..Length(disc)] do
          if d1[i]=d2[i] then
            disc[i]:=1;
          else
            disc[i]:=0;
          fi;
        od;
        for i in Reversed([Length(disc)..e+1]) do
          d1[i]:=d1[i-e];
        od;
        for i in [1..e] do
          d1[i]:=0;
        od;
        for i in [1..Length(disc)] do
          d1[i]:=d1[i]+2;
          d2[i]:=d2[i]+3-disc[i];
        od;
        d2[e-1]:=d2[e-1]+1;
        d2[e]:=d2[e]+1;
      elif (e>E) then
        disc:=Concatenation([0,0],disc);
        d1:=Concatenation([2,2],d1);
        if k=2 then
          d2:=Concatenation([4,5],d1);
        else
          d2:=Concatenation([5,5],d1);
        fi;
        disc:=Concatenation(List([2..e-1],_->0),disc);
        d1:=Concatenation(List([2..e-1],_->2),d1);
        d2:=Concatenation(List([2..e-1],_->3),d2);
        for i in [e+1..Length(disc)] do
          disc[i]:=0;
          d1[i]:=d1[i]+2;
          d2[i]:=d2[i]+3;
        od;
        E:=e;
      else
        disc:=Concatenation(List([0..e-1],_->0),disc);
        d1:=Concatenation(List([0..e-1],_->0),d1);
        d2:=Concatenation(List([0..e-1],_->0),d2);
        for i in [1..Length(disc)-e] do
          d1[i]:=d1[i+e];
        od;
        for i in [Length(disc)-e+1.. Length(disc)] do
          d1[i]:=d1[i-1]+1;
        od;
        for i in [e+1..Length(disc)] do
          if d1[i]=d2[i] then
            disc[i]:=1;
          else
            disc[i]:=0;
          fi;
        od;
        for i in Reversed([Length(disc)..e+1]) do
          d1[i]:=d1[i-e];
        od;
        for i in [1..e] do
          d1[i]:=0;
        od;
        for i in [1..Length(disc)] do
          d1[i]:=d1[i]+2;
          d2[i]:=d2[i]+3-disc[i];
        od;
        d2[e-1]:=d2[e-1]+1;
        d2[e]:=d2[e]+1;
      fi;
      k:=k+1;
    od;
  fi;
  return [d1,d2];
end;
