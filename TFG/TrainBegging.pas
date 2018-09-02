program TrainBegging;

uses 
  TrainStealth;

var
  i : Integer;
  pigsList : TCardinalDynArray;
  targetPig : Cardinal;
begin

  TrainStealth();

  FindDistance := 4;

  FindType($00E7, Ground());
  pigsList := GetFoundItems();

  AddToSystemJournal('Found ' + IntToStr(Length(pigsList)) + ' pigs within 4 tiles.');

  targetPig := pigsList[i];

  if (FindCount() = 0) then
  begin
    AddToSystemJournal('No pigs found');
  end;
  
  while(GetSkillValue('Begging') < 100.0) do
  begin
    AddToSystemJournal('Using Begging ...');
    UseSkill('Begging');
    WaitTargetObject(targetPig);
    Wait(3000);
  end;

end.
