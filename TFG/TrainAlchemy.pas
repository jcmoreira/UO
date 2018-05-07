program TrainAlchemy;

uses
    Constants;
var
  groundBottles, groundNightshades : Cardinal;
begin

  while (GetSkillValue('Alchemy') < 70.0)
    and (FindTypeEx(bottleType, emptyBottleColor, Ground, false) > 0)
    and (FindType(nightshadeType, Ground) > 0) do
  begin

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

     while FindTypeEx(bottleType, lesserPoisonBottleColor, BackPack, false) > 0 do
     begin
       AddToDebugJournal('Found ' + IntToStr(FindQuantity) + ' lesser poison potions in the backpack. Droping ...');
       DropHere(FindItem);
       Wait(2000);
       AddToDebugJournal('Potions dropped.');
     end;
 end;
end.
