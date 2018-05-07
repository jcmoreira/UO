program TrainPeacemaking;

begin
  while GetSkillValue('Peacemaking') < 100.0  do
  begin
    UseSkill('Peacemaking');
    Wait(2100);
  end;
end.
