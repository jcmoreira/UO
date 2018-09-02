unit TrainAnimalLore;

interface

  procedure TrainAnimalLore();

implementation

  procedure TrainAnimalLore();
  begin
    while GetSkillValue('Animal Lore') < 100.0 do
    begin
        UseSkill('Animal Lore');
        WaitTargetSelf;
        wait(2000);
    end;
  end;

end.
