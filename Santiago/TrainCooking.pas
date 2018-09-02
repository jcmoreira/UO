program TrainCooking;

uses
    Constants;

var
    groundRawFishSteaks, storageContainer: Cardinal;

begin

  storageContainer := $400B574D;

  while (GetSkillValue('Cooking') < 70.0) 
    and (FindType(rawFishSteakType, Ground()) > 0) do
  begin
    
    groundRawFishSteaks := FindItem();
    
    MoveItems(Backpack, fishSteakType, $0000, storageContainer, 0,0,0, 1000);

    while FindType(rawFishSteakType, BackPack()) = 0 do
    begin
      MoveItem(groundRawFishSteaks, 2000, BackPack(), 0, 0, 0);
      Wait(2000);
    end;

    while (GetSkillValue('Cooking') < 70.0) 
      and (FindType(rawFishSteakType, BackPack()) > 0) do
    begin
      if TargetPresent() then CancelTarget();
      UseObject(FindType(fryPanType, BackPack()));
      WaitMenu('Barbecue', 'fish steak');
      WaitJournalLineSystem(Now, 'fail|put', 5000);
      Wait(200);
    end;
  end;
end.
