unit TrainStealth;

interface

  procedure TrainStealth();

implementation

  procedure TrainStealth();
  begin
    while GetSkillValue('Stealth') < 100.0 do
    begin
	  UseSkill('Stealth');
	  WaitJournalLineSystem(Now, 'begin', 5000);
    end;
  end;

end.
