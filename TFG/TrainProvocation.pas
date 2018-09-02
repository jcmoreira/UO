program TrainPeacemaking;
var
   startTime: TDateTime;
   var animal1, animal2: Cardinal;
begin

   animal1 := $00053DA2;
   animal2 := $00054BB6;

  while GetSkillValue('Provocation') < 100.0  do
  begin
    startTime := Now();	  
    UseSkill('Provocation');
    WaitTargetObject(animal1);
    WaitTargetObject(animal2);
    WaitJournalLine(startTime, 'provocou|provocando', 5000);
  end;
end.
