unit TrainArmsLore;

interface

  procedure TrainArmsLore(itemType: Cardinal);

implementation

  procedure TrainArmsLore(itemType: Cardinal);
  begin
    while (GetSkillValue('Arms Lore') < 100.0) 
      and (FindType(itemType, Backpack) > 0) do
    begin
      UseSkill('Arms Lore');
      WaitTargetObject(FindItem);
      WaitJournalLineSystem(Now, 'uncertain|item', 6000);
    end;
  end;

end.
