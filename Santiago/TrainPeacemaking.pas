unit TrainPeacemaking;

interface

  procedure TrainPeacemaking(instrumentType: Cardinal);

implementation

  procedure TrainPeacemaking(instrumentType: Cardinal);
  begin
    while ((GetSkillValue('Musicianship') < 100.0)
               or (GetSkillValue('Peacemaking') < 100.0))
      and (FindType(instrumentType, Backpack()) > 0) do
    begin
      UseSkill('Peacemaking');
      WaitJournalLineSystem(Now, 'fail|play|poorly', 5000)
    end;
  end;
end.
