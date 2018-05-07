unit TrainItemIdentification;

interface

  procedure TrainItemIdentification(itemId: Cardinal);

implementation

  procedure TrainItemIdentification(itemId: Cardinal);
  begin
    while GetSkillValue('Item Identification') < 100.0 do
    begin
        UseSkill('Item Identification');
        WaitTargetType(itemId);
        WaitJournalLineSystem(Now, 'cant|estimate', 3000);
        Wait(100);
    end;
  end;

end.
