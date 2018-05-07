unit TrainStealth;

interface

  procedure TrainStealth();

implementation

  procedure TrainStealth();
  begin
    while GetSkillValue('Stealth') < 100.0 do
    begin
	while not Hidden() do
	begin
            UseSkill('Hiding');
	    WaitJournalLineSystem(Now, 'fail|well', 3500)
            Wait(200);
	end;
	UseSkill('Stealth');
	WaitJournalLineSystem(Now, 'begin', 4000);
    end;
  end;

end.
