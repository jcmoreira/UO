unit TrainTracking;

interface

  procedure TrainTracking();

implementation

  procedure TrainTracking();
  begin
    while GetSkillValue('Tracking') < 100.0 do
    begin
      UseSkill('Tracking');
	  WaitMenu('Tracking', 'Monsters');
      WaitJournalLineSystem(Now, 'evidence|signs', 6000);
	if MenuPresent then CloseMenu;
    end;
  end;

end.
