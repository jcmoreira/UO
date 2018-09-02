unit TrainHiding;

interface

  procedure TrainHiding();

implementation

  procedure TrainHiding();
  begin
    while GetSkillValue('Hiding') < 100.0 do
    begin
      UseSkill('Hiding');
      WaitJournalLineSystem(Now, 'hide|hidden', 3000);
    end;
  end;

end.
