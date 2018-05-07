program TrainSnooping;

var
  i : Integer;
  playersList : TCardinalDynArray;
  targetPlayer, targetBackPack : Cardinal;
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
  
  targetBackPack := FindType($0E75, targetPlayer);
  AddToSystemJournal('Found ' + targetPlayerName + '`s backPack (' + IntToHex(targetBackPack, 8) + ')');

  while(GetSkillValue('Snooping') < 100.0) do
  begin
    AddToSystemJournal('Snooping ' + targetPlayerName + '`s backpack ...');
    UseObject(targetBackPack);
    WaitJournalLineSystem(Now, 'falhou|lost|failed', 4000);
    Wait(100);
  end;
end.
