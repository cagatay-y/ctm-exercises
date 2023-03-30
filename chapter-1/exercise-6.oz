declare GenericPascal ShiftLeft ShiftRight OpLists in
fun {GenericPascal Op N}
   if N == 1 then
      [1]
   else UpperRow in
      UpperRow = {GenericPascal Op N-1}
      {OpLists Op {ShiftLeft UpperRow} {ShiftRight UpperRow}}
   end
end

fun {OpLists Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
	 {Op H1 H2} | {OpLists Op T1 T2}
      end
   else
      nil
   end
end

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else
      [0]
   end
end

fun {ShiftRight L}
   0|L
end

declare Add Sub Mul Mul1 in
fun {Add A B}
   A+B
end

fun {Sub A B}
   A-B
end

fun {Mul A B}
   A*B
end

fun {Mul1 X Y} (X+1)*(Y+1) end

%% Test
for Op in [Add Sub Mul Mul1] do
   for I in 1..10 do
      {Show {GenericPascal Op I}}
   end
end
