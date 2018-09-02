program TrainCartography;

uses
   Constants;

var
   groundMapRoll : Cardinal;

begin
  while (GetSkillValue('Cartography') < 70.0) and (FindType(mapRollType, Ground) > 0) do
  begin
	
	AddToDebugJournal('Found' + IntToStr(FindQuantity) + ' logs nearby');
	groundMapRoll := FindItem;

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
		Wait(200);
	end;

	while FindType(scrollsType, BackPack) > 0 do
	begin
		AddToDebugJournal('Found' + IntToStr(FindQuantity) + ' training maps in the backpack. Droping ...');
		DropHere(FindItem);
		Wait(2000);
		AddToDebugJournal('Training Maps Dropped.');
	end;
  end;
end.
