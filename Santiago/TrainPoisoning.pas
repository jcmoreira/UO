program TrainPoisoning;

uses
    Constants;
var
  groundPoisonBottles, groundAntidoteClothBox : Cardinal;
begin

  while (GetSkillValue('Poisoning') < 70.0)
    and (FindTypeEx(bottleType, lesserPoisonBottleColor, Ground, false) > 0)
    and (FindTypeEx(clothBoxType, antidoteClothBoxColor, Ground, false) > 0) do
  begin

      while FindTypeEx(bottleType, lesserPoisonBottleColor, BackPack, false) = 0 do
      begin
        groundPoisonBottles := FindTypeEx(bottleType, lesserPoisonBottleColor, Ground, false);
        MoveItem(groundPoisonBottles, 250, BackPack, 0, 0, 0);
        Wait(2000);
      end;

      while FindTypeEx(clothBoxType, antidoteClothBoxColor, BackPack, false) = 0 do
      begin
        groundAntidoteClothBox := FindTypeEx(clothBoxType, antidoteClothBoxColor, Ground, false);
        MoveItem(groundAntidoteClothBox, 250, BackPack, 0, 0, 0);
        Wait(2000);
      end;

   while (GetSkillValue('Poisoning') < 70.0)
       and (FindTypeEx(bottleType, lesserPoisonBottleColor, BackPack, false) > 0)
       and (FindTypeEx(clothBoxType, antidoteClothBoxColor, BackPack, false) > 0)
       do
   begin
     UseSkill('Poisoning');
     WaitTargetObject($4008837D);
     WaitJournalLine(Now, 'want to use', 6000);
     WaitTargetObject(FindTypeEx(bottleType, lesserPoisonBottleColor, BackPack, false));
     WaitJournalLine(Now, 'sucesso|falhou', 6000);
     wait(200);

     UseObject(FindTypeEx(clothBoxType, antidoteClothBoxColor, BackPack, false));
     WaitTargetObject($4008837D);
     WaitJournalLine(Now, 'clean|not', 6000);
   end;
 end;
end.
