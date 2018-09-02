program TrainTinkering;

uses
    Constants;
var
    groundIngots, storageContainer: Cardinal;

begin

    storageContainer := $400B574D;

    while (GetSkillValue('Tinkering') < 70.0) and (FindType(ingotType, Ground()) > 0) do
    begin
        MoveItems(Backpack, springsType, $0000, storageContainer, 0,0,0, 1000);
        MoveItems(Backpack, clockPartsType, $0000, storageContainer, 0,0,0, 1000);

        FindType(ingotType, Ground);
        groundIngots := FindItem();

	while (FindType(ingotType, BackPack) <= 0) or (FindFullQuantity < 3) do
        begin
	    MoveItem(groundIngots, 600, BackPack, 0, 0, 0);
	    Wait(2000);
        end;

	while (GetSkillValue('Tinkering') <= 32.1) and (FindType(ingotType, BackPack) > 0 ) and (FindFullQuantity >= 3) do
        begin
            UseObject(FindType(tinkersToolsType, Backpack));
            WaitMenu('Tinkering', 'Parts');
            WaitMenu('Parts', 'springs');
            WaitJournalLineSystem(Now, 'put', 3000);
            wait(200)
        end;

	while (GetSkillValue('Tinkering') > 32.1) and (GetSkillValue('Tinkering') < 70.0) and (FindType(ingotType, BackPack) > 0) and (FindFullQuantity >= 3)do
        begin
            UseObject(FindType(tinkersToolsType, Backpack));
            WaitMenu('Tinkering', 'Parts');
            WaitMenu('Parts', 'clock parts');
            WaitJournalLineSystem(Now, 'put', 3000);
            Wait(200)
        end;

    end;
end.
