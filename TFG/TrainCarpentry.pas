program TrainCarpentry;

uses
    Constants;
var
  groundLogs : Cardinal;
begin

  while (GetSkillValue('Carpentry') < 70.0) and (FindType(logPileType, Ground) > 0) do
  begin
	  
    AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' logs nearby.');
    groundLogs := FindItem;
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
        Wait(200);
    end;
            
    while FindType(scrollsType, BackPack) > 0 do
    begin
      AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' in the backpack. Droping ...');
      DropHere(FindItem);
      Wait(2000);
      AddToDebugJournal('Scrolls dropped.');
    end;
  end;
end.
