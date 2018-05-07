program TrainFishing;

uses
    Constants;

var
    groundRawFishSteaks: Cardinal;

begin

    while (GetSkillValue('Fishing') < 70.0) and (FindType(rawFishSteakType, Ground()) > 0) do
    begin
        
        groundRawFishSteaks := FindItem();

	while FindType(rawFishSteakType, BackPack()) = 0 do
        begin
	    MoveItem(groundRawFishSteaks, 2000, BackPack(), 0, 0, 0);
	    Wait(2000);
	end;

	while (GetSkillValue('Fishing') < 70.0) and (FindType(rawFishSteakType, BackPack()) > 0) do
	begin
	    if TargetPresent() then CancelTarget();
	    UseObject(FindType(fryPanType, BackPack()));
	    WaitMenu('Barbecue', 'fish steak');
	    WaitJournalLineSystem(Now, 'fail|put', 5000);
	    Wait(200);
	end;

	while FindType(fishSteakType, BackPack()) > 0 do
	begin
		DropHere(FindItem);
		Wait(2000);
	end;

    end;
end.
