(****)
Program Fishing;
(*****)
uses
    Constants;
(****)
const
   yMin = 1800;
   yMax = 3000;
var
   yOffset: Cardinal;

procedure Move();
var 
    yInicial: Cardinal;
begin
    yInicial := GetY(Self);

    if ((yInicial <= yMin) or (yInicial >= yMax)) then
    begin
        UOSay('Turn Around');
	yOffset := yOffset * -1;
    end;

    while GetY(Self) = yInicial do
    begin
        UOSay('Forward');
	Wait(250);
    end;

    UOSay('Stop');

end;

procedure FishTile(x: Integer; y: Integer);
var
    option, tries: Cardinal;
begin

    AddToDebugJournal('   Fishing(' + IntToStr(x) + ', ' + IntToStr(y) + ', -3) ...');

    tries := 0;

    repeat
        if TargetPresent() then CancelTarget();
	Disarm();
	UseObject(FindType(fishingPoleType, BackPack()));
	WaitTargetXYZ(x, y, GetZ(Self) - 3);
	tries := tries + 1;
	WaitJournalLineSystem(Now(), 'elsewhere|no fish|try|fail|put', 10000);
        option := FoundedParamId;
	AddToDebugJournal('    ' + Journal(LineIndex()));
    until ((option <= 2) or (tries > 2));

end;

procedure FishAround();
var
  x, y, xIdx : Integer;
begin
    
    x := GetX(Self);
    y := GetY(Self);
    xIdx := -4;

    AddToDebugJournal('  Starting to fish around (' + IntToStr(x) + ', ' + IntToStr(y) + ') ...');

    while (xIdx <= 4) do
    begin
        FishTile(x + xIdx, y + yOffset);
	xIdx := xIdx + 1;
    end;
    AddToDebugJournal('  Done fishing around (' + IntToStr(x) + ', ' + IntToStr(y) + ').');

end;

procedure StoreFish();
var
    i: Integer;
    item, storageContainer: Cardinal;
begin
    for i:= Low(fishTypes) to High(fishTypes) do
    begin
        while FindType(fishTypes[i], BackPack) > 0 do
	begin
	    item := FindItem;
	    storageContainer := FindType(shipContainerType, Ground);
	    MoveItem(item, 100, storageContainer, 0, 0, 0);
	    Wait(1000);
	end;
    end;
end;

begin

    yOffset := -3;

    while not Dead() do
    begin
	StoreFish();
        FishAround();
        Move();
    end;

end.
