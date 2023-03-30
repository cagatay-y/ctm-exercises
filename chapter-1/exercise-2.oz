% (a)
declare Comb MulRange in

fun {Comb N K}
   {MulRange N (N-K+1)} div {MulRange K 1}
end

fun {MulRange N M}
   if N < M then
      1
   else
      N * {MulRange N-1 M}
   end
end

%% Test
{Browse {Comb 0 0}}
{Browse {Comb 20 0}}

for I in 0..10 do
   for J in 0..I do
      {Show {Comb I J}}
   end
end

% (b)
declare Comb2 in
fun {Comb2 N K}
   if K > (N div 2) then
      {Comb N (N-K)}
   else
      {Comb N K}
   end
end

%% Test
for I in 0..10 do
   for J in 0..I do
      {Show {Comb2 I J}}
   end
end
