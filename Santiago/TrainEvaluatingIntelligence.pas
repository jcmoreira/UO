unit TrainEvaluatingIntelligence;

interface

  procedure TrainEvaluatingIntelligence();

implementation

  procedure TrainEvaluatingIntelligence();
  begin
    Ignore(Self());

    while (GetSkillValue('Evaluating Intelligence') < 100.0)
      and (FindType($0190, Ground()) > 0) do
    begin
        UseSkill('Evaluating Intelligence');
        WaitTargetObject(FindItem());
        WaitJournalLineSystem(Now, 'cannot|looks|far', 6000);
    end;
  end;

end.
