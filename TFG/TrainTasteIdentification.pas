unit TrainTasteIdentification;

interface

  procedure TrainTasteIdentification(foodId: Cardinal);

implementation

  procedure TrainTasteIdentification(foodId: Cardinal);
  begin
    while GetSkillValue('Taste Identification') < 100.0 do
    begin
        UseSkill('Taste Identification');
        WaitTargetType(foodId);
        wait(2000);
    end;
  end;

end.
