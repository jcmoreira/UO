program TrainTailoring;

uses
    Constants;
var
  groundCloth : Cardinal;
begin

  while (GetSkillValue('Tailoring') < 70.0) and (FindType(foldedClothType, Ground) > 0) do
  begin

    AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' logs nearby.');
    groundCloth := FindItem;
    while (FindType(foldedClothType, BackPack) = 0) or (FindQuantity() < 5) do
    begin
      MoveItem(groundCloth, 1000, BackPack, 0, 0, 0);
      Wait(2000);
    end;

    while (GetSkillValue('Tailoring') < 70.0) and (FindType(foldedClothType, BackPack) > 0) and (FindQuantity() > 4) do
    begin
        if TargetPresent then CancelTarget;
        UseObject(FindTypeEx(sewingKitType, $0000, Backpack, false));
        WaitTargetType(foldedClothType);
        WaitMenu('Cloth', 'Cloth Box');
        WaitJournalLineSystem(Now, 'put', 10000);
        wait(200);
    end;

    while FindTypeEx(clothBoxType, clothBoxColor, BackPack, false) > 0 do
    begin
      AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' in the backpack. Droping ...');
      DropHere(FindItem);
      Wait(2000);
      AddToDebugJournal('Scrolls dropped.');
    end;
  end;
end.
