declare S M FasterPascal in
S = {NewStore}
M = {NewCell 0}
fun {FasterPascal N}
   local PN in
      if N =< @M then
	 PN = {Get S N}
      else
	 if N == 1 then
	    PN = [1]
	 else PNM1 in
	    PNM1 = {FasterPascal N-1}
	    PN = {OpLists Add {ShiftLeft PNM1} {ShiftRight PNM1}}
	 end
	 {Put S N PN}
	 M := N
      end
      PN
   end
end

% (c)
declare NewStore2 Get2 Put2
fun {NewStore2}
   {NewCell nil}
end

fun {Get2 S K}
   GetInner in
   fun {GetInner InnerS}
      case InnerS of H|T then
	 case H of N|X then
	    if N == K then
	       X
	    else
	       {GetInner T}
	    end
	 end
	 % Normally an exception should have followed for the case in which the key does not exist but the book has not introduced exceptions yet.
      end
   end
   {GetInner @S}
end

% For some reason requires an extra argument.
% Edit: Should have been a 'proc', not a 'fun'. The expected extra parameter is the variable to save the 'return value' to.
fun {Put2 S N X}
   {Browse S}
   {Browse N}
   {Browse X}
   S := (N|X)|@S
end

% (d)
declare
fun {NewCountingStore}
   S C Get Put Size in
   S = {NewCell nil}
   C = {NewCell 0}

   proc {Put N X}
      S := (N|X)|@S
      C := @C + 1
   end

   fun {Size}
      @C
   end

   fun {Get K}
      GetInner in
      fun {GetInner InnerS}
	 case InnerS of H|T then
	    case H of N|X then
	       if N == K then
		  X
	       else
		  {GetInner T}
	       end
	    end
	    % Again, should have thrown an exception when no more pairs are left to search
	 end
      end
      {GetInner @S}
   end
   store(get:Get put:Put size:Size)
end
