program TrainBowcraft;

uses
    Constants;
var
  groundLogs : Cardinal;
begin

  while (GetSkillValue('Bowcraft') < 70.0) and (FindType(logPileType, Ground) > 0) do
  begin

    AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' logs nearby.');
    groundLogs := FindItem;

    while FindType(logPileType, BackPack) = 0 do
    begin
      MoveItem(groundLogs, 1000, BackPack, 0, 0, 0);
      Wait(2000);
    end;

    while (GetSkillValue('Bowcraft') < 70.0) and (FindType(logPileType, BackPack) > 0) do
    begin
        if TargetPresent then CancelTarget;
        UseObject(FindTypeEx(daggerType, $0000, Backpack, false));
        WaitTargetType(logPileType);
        WaitMenu('What do you want', 'Shafts');
        WaitMenu('Shafts', '1 Shafts');
        WaitJournalLineSystem(Now, 'put the shafts', 6000);
        wait(200);
    end;

    while FindType(shaftsType, BackPack) > 0 do
    begin
      AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' in the backpack. Droping ...');
      DropHere(FindItem);
      Wait(2000);
      AddToDebugJournal('Scrolls dropped.');
    end;
  end;
end.
