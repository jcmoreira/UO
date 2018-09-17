program TrainTailoring;

uses
    Constants;
var
  groundCloth, storageContainer : Cardinal;
begin

  storageContainer := $400B574D;

  while (GetSkillValue('Tailoring') < 70.0) and (FindType(foldedClothType, Ground) > 0) do
  begin                    
  
    groundCloth := FindItem;                                                            
    
    MoveItems(Backpack, clothBoxType, clothBoxColor, storageContainer, 0,0,0, 1000);
    
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
  end;
end.
