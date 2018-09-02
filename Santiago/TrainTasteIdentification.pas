unit TrainTasteIdentification;

interface

  procedure TrainTasteIdentification(foodId: Cardinal);

implementation

  procedure TrainTasteIdentification(foodId: Cardinal);
  begin
    while (GetSkillValue('Taste Identification') < 100.0) 
      and (FindType(foodId, Backpack) > 0) 
    do
    begin
      UseSkill('Taste Identification');
      WaitTargetType(foodId);
      WaitJournalLineSystem(Now, 'fail|tastes', 10000);
    end;
  end;
end.
