unit TrainAnatomy;

interface

  procedure TrainAnatomy();

implementation

  procedure TrainAnatomy();
  begin
    while GetSkillValue('Anatomy') < 100.0 do
    begin
        UseSkill('Anatomy');
        WaitTargetSelf;
        wait(2000);
    end;
  end;

end.
