(********************************************)
(*************** HEADER    ******************)
(********************************************)
Program Mining;
(*************** Units     ******************)
Uses
  Sysutils,
  Constants,
  BankUtils;
(*************** Structures******************)
(*************** Constants ******************)
const
    mine_X = 2580;
    mine_Y = 450;
    bank_X = 2505;
    bank_Y = 542;
    storageContainerType = $09AA;
(*************** Variables ******************)
var
    pickaxe: Cardinal;
(*************** Methods   ******************)
procedure Setup();
begin
    AddToDebugJournal('Setting Up ...');
    Disarm();
    Wait(1000);
    pickaxe := FindType(pickaxeType, Backpack);
    AddToDebugJournal('Done.');
end;

function CheckWeight(): Boolean;
begin
    Result := Weight < (MaxWeight - 30);
end;

procedure MineTile(x: Integer; y: Integer);
var
    startTime: TDateTime;
    option: Cardinal;
begin
    AddToDebugJournal('  Mining (' + IntToStr(x) + ', ' + IntToStr(y) + ') ...');
    repeat
        if TargetPresent then CancelTarget;
        Disarm();  
        UseObject(FindType(pickaxeType,Backpack));
        WaitTargetXYZ(x, y, GetZ(Self))
        startTime := Now();
        WaitJournalLineSystem(startTime, 'line|elsewhere|nothing|close|decide|away|rocks|put', 10000);
        option := FoundedParamId;
        AddToDebugJournal('    ' + Journal(LineIndex()));
    until option <= 5;
end;

procedure MineAround();
var
    x, y, x_idx, y_idx : Integer;
begin                                                          
    x := GetX(Self);
    y := GetY(Self);
    x_idx := -2;
    y_idx := -2;
    AddToDebugJournal('  Starting to Mine around (' + IntToStr(x) + ', ' + IntToStr(y) + ') ...');
    while (x_idx < 3) do
    begin
        while (y_idx < 3) and (CheckWeight()) do
        begin
            MineTile(x + x_idx, y + y_idx);
            y_idx := y_idx + 1;
        end;
        x_idx := x_idx + 1;
        y_idx := -2;
    end;
    AddToDebugJournal('  Done Mining around (' + IntToStr(x) + ', ' + IntToStr(y) + ').');
end;

procedure Move();
var
    new_x, new_y: Integer;
begin
    AddToDebugJournal('  Relocating randomly ...');
    repeat
        new_x := GetX(Self) + (2 * RandomRange(-2, 2));
        new_y := GetY(Self) + (2 * RandomRange(-2, 2));
    until (new_x <> GetX(Self)) or (new_y <> GetY(Self))
    MoveXY(new_x, new_y, True, 1, True);
    AddToDebugJournal('  Done relocating to (' + IntToStr(GetX(Self)) + ', ' + IntToStr(GetY(Self)) + ').');
end;

procedure Mine();
begin
    AddToDebugJournal('Starting to Mine ...');
    while CheckWeight() do
    begin
        Move();
        MineAround();
    end;
    AddToDebugJournal('Done Mining ...');
end;

procedure GoToMine();
begin
    AddToDebugJournal('Going to the mine ...');
    MoveXY(mine_X, mine_Y, True, 3, True);
    AddToDebugJournal('Arrived at the mine (' + IntToStr(GetX(Self)) + ', ' + IntToStr(GetY(Self)) + ')');
end;

procedure GoToBank();
begin
    AddToDebugJournal('Going to the bank ...');
    MoveXY(bank_X, bank_Y, True, 1, True);
    AddToDebugJournal('Arrived at the bank (' + IntToStr(GetX(Self)) + ', ' + IntToStr(GetY(Self)) + ')');
end;

procedure StoreOres();
begin
    StoreItemsAtBankContainer(orePileTypes, storageContainerType);
    StoreItemsAtBankContainer(gemStoneTypes, storageContainerType);
end;

begin
    Setup();
    repeat
        GoToBank();
        StoreOres();
        GoToMine();
        Mine();
    until Dead;
end.
