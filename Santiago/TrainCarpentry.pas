program TrainCarpentry;

uses
    Constants;
var
  aux: Integer;
  groundLogs, storageContainer: Cardinal;
begin

  storageContainer := $4002BDFC;

  while (GetSkillValue('Carpentry') < 100.0) and (FindType(logPileType, Ground) > 0) do
  begin  
  
    groundLogs := FindItem;
  
   MoveItems(Backpack, scrollsType, $0000, storageContainer, 0,0,0, 1000);   
   
    while FindType(logPileType, BackPack) = 0 do
    begin
      MoveItem(groundLogs, 500, BackPack, 0, 0, 0);
      Wait(2000);
    end;
    
    while (GetSkillValue('Carpentry') < 100.0) and (FindType(logPileType, BackPack) > 0) do
    begin
      AddToSystemJournal('A');
      for aux := 0 to (GetGumpsCount - 1) do
        if IsGumpCanBeClosed(aux) then CloseSimpleGump(aux); 
      
      
      AddToSystemJournal('B ' + IntToStr(FindType(sawType, Backpack())));
      aux := GetGumpsCount;  
      UseObject(FindType(sawType, Backpack()));
      
      AddToSystemJournal('C ' + IntToStr(aux));
      while aux = GetGumpsCount do 
      begin 
        Wait(50);
        AddToSystemJournal(IntToStr(GetGumpsCount));
      end;
        
      NumGumpButton(GetGumpsCount-1, 1000006);       
      
      AddToSystemJournal('D');
      while aux = GetGumpsCount do Wait(50);
      NumGumpButton(GetGumpsCount-1, 701);
      AddToSystemJournal('E');
      WaitJournalLineSystem(Now, 'put', 12000);
      AddToSystemJournal('F');
    end;
  end;
end.
