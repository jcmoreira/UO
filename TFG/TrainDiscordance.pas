program TrainDiscordance;

var
  i : Integer;
  pigsList : TCardinalDynArray;
  targetPig : Cardinal;
begin
  FindDistance := 4;

  FindType($00CB, Ground());
  pigsList := GetFoundItems();

  AddToSystemJournal('Found ' + IntToStr(Length(pigsList)) + ' players within 4 tiles.');

  targetPig := pigsList[i];

  if (FindCount() = 0) then
  begin
    AddToSystemJournal('No pigs found');
  end;
  
  while(GetSkillValue('Discordance') < 100.0) do
  begin
    AddToSystemJournal('Using Discordance ...');
    UseSkill('Discordance');
    WaitTargetObject(targetPig);
    WaitJournalLineSystem(Now, 'falhou|lost|fail|heavy', 2000);
    Wait(100);
  end;

end.
