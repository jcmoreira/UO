program TrainAlchemy;

uses
    Constants;
var
  groundBottles, groundNightshades, storageContainer : Cardinal;

begin

  storageContainer := $400B574D;

  while (GetSkillValue('Alchemy') < 70.0)
    and (FindTypeEx(bottleType, emptyBottleColor, Ground, false) > 0)
    and (FindType(nightshadeType, Ground) > 0) do
  begin

    MoveItems(Backpack, bottleType, lesserPoisonBottleColor, storageContainer, 0,0,0, 1000);

    while FindTypeEx(bottleType, emptyBottleColor, BackPack, false) = 0 do
    begin
      groundBottles := FindTypeEx(bottleType, emptyBottleColor, Ground, false);
      MoveItem(groundBottles, 500, BackPack, 0, 0, 0);
      Wait(2000);
    end;

    while FindType(nightshadeType, BackPack) = 0 do
    begin
      groundNightshades := FindType(nightshadeType, Ground);
      MoveItem(groundNightshades, 500, BackPack, 0, 0, 0);
      Wait(2000);
    end;

    while (GetSkillValue('Alchemy') < 70.0)
      and (FindTypeEx(bottleType, emptyBottleColor, BackPack, false) > 0)
      and (FindType(nightshadeType, BackPack) > 0)
    do
    begin
      UseObject(FindItem);
      WaitMenu('Alchemy Menu', 'Lesser Poison');
      WaitJournalLine(Now, 'put|failed', 6000);
      wait(200);
    end;
 end;
end.
