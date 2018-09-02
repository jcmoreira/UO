program TrainCarpentry;

uses
    Constants;
var
  groundLogs, storageContainer: Cardinal;
begin

  storageContainer := $400B574D;

  while (GetSkillValue('Carpentry') < 70.0) and (FindType(logPileType, Ground) > 0) do
  begin  
  
    groundLogs := FindItem;
  
   MoveItems(Backpack, scrollsType, $0000, storageContainer, 0,0,0, 1000);   
   
    while FindType(logPileType, BackPack) = 0 do
    begin
      MoveItem(groundLogs, 1000, BackPack, 0, 0, 0);
      Wait(2000);
    end;
    
    while (GetSkillValue('Carpentry') < 70.0) and (FindType(logPileType, BackPack) > 0) do
    begin
        UseObject(FindType(sawType, Backpack()));
        WaitMenu('Carpentry', 'blank scroll');
        WaitMenu('Blank Scrolls', 'blank scroll');
        WaitJournalLineSystem(Now, 'put', 6000);
    end;
  end;
end.
