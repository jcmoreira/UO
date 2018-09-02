unit TrainAnatomy;

interface

  procedure TrainAnatomy();

implementation

  procedure TrainAnatomy();
  begin
    Ignore(Self());

    while (GetSkillValue('Anatomy') < 100.0) 
      and (FindType($0190, Ground()) > 0) do
    begin
        UseSkill('Anatomy');
        WaitTargetObject(FindItem());
	    WaitJournalLineSystem(Now, 'think|looks|far', 6000);
    end;
  end;

end.
