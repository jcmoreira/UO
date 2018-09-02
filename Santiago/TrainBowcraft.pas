program TrainBowcraft;

uses
    Constants;
var
  groundLogs, storageContainer: Cardinal;
begin

  storageContainer := $400B574D;

  while (GetSkillValue('Bowcraft') < 70.0) and (FindType(logPileType, Ground) > 0) do
  begin
    MoveItems(Backpack, shaftsType, $0000, storageContainer, 0,0,0, 1000);

    FindType(logPileType, Ground)
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

  end;
end.
