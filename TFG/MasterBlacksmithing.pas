program MasterBlacksmithing;

uses
    Constants;
var
    groundIngots, storageContainer: Cardinal;

begin

    storageContainer := $40027D66;
    UseObject(storageContainer);
    MoveItems(Backpack, $1413, $0590, storageContainer, 0,0,0, 1000);
    MoveItems(Backpack, $1412, $0590, storageContainer, 0,0,0, 1000);
    UseObject(storageContainer);
    
    while (GetSkillValue('Blacksmithing') < 100.0) and (FindTypeEx(ingotType, $0590, Ground(), False) > 0) do
    begin
        
        UseObject(storageContainer);

        MoveItems(Backpack, $1413, $0590, storageContainer, 0,0,0, 1000);
        MoveItems(Backpack, $1412, $0590, storageContainer, 0,0,0, 1000);

	FindTypeEx(ingotType, $0590, Ground(), False)
        groundIngots := FindItem();

	while (FindTypeEx(ingotType, $0590, Backpack(), False) <= 0) or (FindFullQuantity < 10) do
        begin
	    MoveItem(groundIngots, 600, BackPack, 0, 0, 0);
	    Wait(2000);
        end;

	while (GetSkillValue('Blacksmithing') < 100.0) and (FindTypeEx(ingotType, $0590, Backpack, False) > 0 ) and (FindFullQuantity >= 10) do
        begin
            UseObject(FindTypeEx(ingotType, $0590, Backpack, False));
            WaitMenu('Blacksmithing', 'Colored Armor');
            WaitMenu('Old copper Armor', 'Old Copper Platemail Gorget');
            WaitJournalLineSystem(Now, 'put', 3000);
            wait(200)
        end;
    end;
end.
