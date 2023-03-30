declare Acc Accumulate in
Acc={NewCell 0}
fun {Accumulate N}
   Acc:=@Acc+N
   @Acc
end

%% Test
{Browse {Accumulate 5}}
{Browse {Accumulate 100}}
{Browse {Accumulate 45}}
