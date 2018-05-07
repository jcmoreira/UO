unit TrainEvaluatingIntelligence;

interface

  procedure TrainEvaluatingIntelligence();

implementation

  procedure TrainEvaluatingIntelligence();
  begin
    while GetSkillValue('Evaluating Intelligence') < 100.0 do
    begin
        UseSkill('Evaluating Intelligence');
        WaitTargetSelf;
        Wait(2000);
    end;
  end;

end.
