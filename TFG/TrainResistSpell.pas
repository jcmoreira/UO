program TrainCarpentry;

uses
  Constants;
var
  i: Integer;
  groundScrolls, groundBandages: Cardinal;
  playersList: TCardinalDynArray;
  targetPlayer: Cardinal;
  targetPlayerName: String;
begin

  FindDistance := 3;

  while (FindType($0190, Ground) > 0) and (FindType(cleanBandageType, Ground) > 0) and (FindType(magicArrowScrollsType, Ground) > 0) do
  begin
	  
    FindType($0190, Ground);
    playersList := GetFoundItems();
    AddToSystemJournal('Found ' + IntToStr(Length(playersList)) + ' players within 1 tile.');
    for i:= 0 to Length(playersList) - 1 do
    begin
      if not(Self = playersList[i]) then targetPlayer := playersList[i];
    end;
    targetPlayerName := GetName(targetPlayer);
    AddToSystemJournal('Selected player ' + targetPlayerName + ' (' + IntToHex(targetPlayer, 4) + ')');
    
    groundBandages := FindType(cleanBandageType, Ground);
    AddToSystemJournal('Found ' + IntToStr(FindQuantity) + ' bandages in the ground');
    while FindType(cleanBandageType, BackPack) = 0 do
    begin
      MoveItem(groundBandages, 10, BackPack, 0, 0, 0);
      Wait(2000);
    end;
    
    groundScrolls := FindType(magicArrowScrollsType, Ground);
    AddToSystemJournal('Found ' + IntToStr(FindQuantity) + ' scrolls in the ground');
    while FindType(magicArrowScrollsType, BackPack) = 0 do
    begin
      MoveItem(groundScrolls, 10, BackPack, 0, 0, 0);
      Wait(2000);
    end;
    
    while (FindType(cleanBandageType, BackPack) > 0) and (FindType(magicArrowScrollsType, BackPack) > 0) do
    begin

      AddToSystemJournal('Casting spell.');
      while (Mana() > 50) and (GetHP(targetPlayer) > 50) and (FindType(magicArrowScrollsType, BackPack) > 0) do
      begin
        UseObject(FindItem);
	WaitTargetObject(targetPlayer);
        AddToSystemJournal('Casting ...');
	Wait(2500);
      end;
      AddToSystemJournal('Done Casting!');
      
      AddToSystemJournal('Checking Mana.');
      while Mana() < MaxMana() do 
      begin
        UseSkill('Meditation');
        AddToSystemJournal('Meditating ...');
	WaitJournalLineSystem(Now, 'perdeu|stop|peace', 120000);
      end;
      AddToSystemJournal('Done Meditating !');

      AddToSystemJournal('Checking target health.');
      while (GetHP(targetPlayer) < GetMaxHP(targetPlayer)) and (FindType(cleanBandageType, BackPack) > 0) do
      begin
        UseObject(FindItem);
	WaitTargetObject(targetPlayer);
        AddToSystemJournal('Healing target ...');
	Wait(7000);
      end;
      AddToSystemJournal('Done healing target !');

      while FindType(bloodyBandageType, BackPack) > 0 do
      begin
        AddToSystemJournal('Found ' + IntToStr(FindQuantity) + ' bloody bandages in the backpack. Droping ...');
        DropHere(FindItem);
        Wait(2000);
        AddToSystemJournal('Bloody bandages dropped.');
      end;
    end;
    
  end;
end.
