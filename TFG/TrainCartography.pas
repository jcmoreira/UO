program TrainCartography;

uses
   Constants;

var
   groundMapRoll, trashBarrel : Cardinal;

begin

  trashBarrel := $40027D66;  

  while (GetSkillValue('Cartography') < 70.0) and (FindType(mapRollType, Ground) > 0) do
  begin
  
	groundMapRoll := FindItem; 
    
    MoveItems(Backpack, scrollsType, $0000, trashBarrel, 0,0,0, 1000);
    UseObject(trashBarrel);

	while FindType(mapRollType, BackPack) = 0 do
	begin
		MoveItem(groundMapRoll, 1, BackPack, 0, 0, 0);
		Wait(2000);
	end;

    while (GetSkillValue('Cartography') < 70.0) and (FindType(mapRollType, BackPack) > 0) do
	begin	
		if TargetPresent then CancelTarget;
		UseObject(FindItem());
        WaitJournalLineSystem(Now, 'put|fail', 6000);
	end;
  end;
end.
