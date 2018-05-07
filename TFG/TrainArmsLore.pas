unit TrainArmsLore;

interface

  procedure TrainArmsLore(itemId: Cardinal);

implementation

  procedure TrainArmsLore(itemId: Cardinal);
  begin
    while GetSkillValue('Arms Lore') < 100.0 do
    begin
        UseSkill('Arms Lore');
        WaitTargetType(itemId);
        Wait(2000);
    end;
  end;

end.
