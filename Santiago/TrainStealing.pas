program TrainStealing;

var
  i : Integer;
  playersList : TCardinalDynArray;
  targetPlayer : Cardinal;
  targetPlayerName : String;
begin
  FindDistance := 1;

  FindType($0190, Ground());
  playersList := GetFoundItems();

  AddToSystemJournal('Found ' + IntToStr(Length(playersList)) + ' players within 1 tile.');

  for i:= 0 to Length(playersList) - 1 do
  begin
    if not(Self = playersList[i]) then targetPlayer := playersList[i];
  end;

  targetPlayerName := GetName(targetPlayer);

  AddToSystemJournal('Selected player ' + targetPlayerName + ' (' + IntToHex(targetPlayer, 4) + ')');
  
  while(GetSkillValue('Stealing') < 100.0) do
  begin
    AddToSystemJournal('Stealing ' + targetPlayerName + ' ...');
    UseSkill('Stealing');
    WaitTargetObject(targetPlayer);
    WaitJournalLineSystem(Now, 'falhou|lost|fail|heavy', 4000);
    Wait(100);
  end;

end.
