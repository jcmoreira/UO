unit TrainItemIdentification;

interface

  procedure TrainItemIdentification(itemType: Cardinal);

implementation

  procedure TrainItemIdentification(itemType: Cardinal);
  begin
    while (GetSkillValue('Item Identification') < 100.0) 
      and (FindType(itemType, Backpack) > 0) do
    begin
        UseSkill('Item Identification');
        WaitTargetObject(FindItem);
        WaitJournalLineSystem(Now, 'think|estimate', 4000);
    end;
  end;

end.
