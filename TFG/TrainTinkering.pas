program TrainTinkering;

uses
    Constants;
var
    groundIngots: Cardinal;
begin

    while (GetSkillValue('Tinkering') < 70.0) and (FindType(ingotType, Ground()) >=3) do
    begin
        groundIngots := FindItem();

        while FindType(ingotType, BackPack) < 3 do
        begin
	    MoveItem(groundIngots, 1000, BackPack, 0, 0, 0);
	    Wait(2000);
        end;

	while (GetSkillValue('Tinkering') <= 32.1) and (FindType(ingotType, BackPack) >= 3) do
        begin
            UseObject(FindType(tinkersToolsType, Backpack));
            WaitMenu('Tinkering', 'Parts');
            WaitMenu('Parts', 'springs');
            WaitJournalLineSystem(Now, 'put', 3000);
            wait(200)
        end;

	while (GetSkillValue('Tinkering') > 32.1) and (GetSkillValue('Tinkering') < 70.0) and (FindType(ingotType, BackPack) >= 3) do
        begin
            UseObject(FindType(tinkersToolsType, Backpack));
            WaitMenu('Tinkering', 'Parts');
            WaitMenu('Parts', 'clock parts');
            WaitJournalLineSystem(Now, 'put', 3000);
            Wait(200)
        end;

	while FindType(springsType, BackPack) > 0 do
	begin
	    DropHere(FindItem);
	    Wait(2000);
	end;

	while FindType(clockPartsType, BackPack) > 0 do
	begin
	    DropHere(FindItem);
	    Wait(2000);
	end;
    end;
end.
