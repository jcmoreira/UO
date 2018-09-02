Program Mine;

Uses
  Sysutils,
  Constants,
  BankUtils,
  TSP;
  {$Include 'all.inc'}

const
  Sunduk = $40044DE1;
  xTileSunduk = 2505;
  yTileSunduk = 542;
  storageContainerType = $09AA;
  MyMaxWeight = 250;
  Hatchet1 = $0EC2;
  Hatchet2 = $0EC2;

  iTTileCount = 39;
  iCTileCount = 4;

  Msg1 = 'moved';
  Msg2 = 'could not';
  Msg3 = 'hack';
  Msg4 = 'You decide not to chop wood';
  Msg5 = 'There is nothing';
  Msg6 = 'appears immune';
  Msg7 = 'Try chopping';
  Msg8 = 'reach this';
  MsgSuccess = 'put';


  RunSpeed = 250;
  iRadiusSearch = 30; 
  Logs = $1BDD;
  WoodType = $0F90;

type
  ChopTile = Record
    x, y : Integer;
  end;

var
  FoundTilesArray : TFoundTilesArray;
  TempFoundTilesArray, ChopTilesArray : array of TFoundTile;
  TreeTile:array [0..iTTileCount] of word;
  ChopTiles : array[1..iCTileCount] of ChopTile;
  ctime : TDateTime;
  i : Integer;

procedure InitTTilesArray;
  begin
   TreeTile[0]:=3274;
   TreeTile[1]:=3275;
   TreeTile[2]:=3277;
   TreeTile[3]:=3280;

   TreeTile[4]:=3283;
   TreeTile[5]:=3286;
   TreeTile[6]:=3288;
   TreeTile[7]:=3290;

   TreeTile[8]:=3293;
   TreeTile[9]:=3296;
   TreeTile[10]:=3299;
   TreeTile[11]:=3302;

   TreeTile[12]:=3320;
   TreeTile[13]:=3323;
   TreeTile[14]:=3326;
   TreeTile[15]:=3329;

   TreeTile[16]:=3393;
   TreeTile[17]:=3394;
   TreeTile[18]:=3395;
   TreeTile[19]:=3396;

   TreeTile[20]:=3415;
   TreeTile[21]:=3416;
   TreeTile[22]:=3417;
   TreeTile[23]:=3418;

   TreeTile[24]:=3419;
   TreeTile[25]:=3438;
   TreeTile[26]:=3439;
   TreeTile[27]:=3440;

   TreeTile[28]:=3441;
   TreeTile[29]:=3442;
   TreeTile[30]:=3460;
   TreeTile[31]:=3461;

   TreeTile[32]:=3462;
   TreeTile[33]:=3476;
   TreeTile[34]:=3478;
   TreeTile[35]:=3480;

   TreeTile[36]:=3482;
   TreeTile[37]:=3484;
   TreeTile[38]:=3492;
   TreeTile[39]:=3496;
  end;

procedure InitCTilesArray;
  begin
    ChopTiles[1].x := 2390;  
    ChopTiles[1].y := 3081;

    ChopTiles[2].x := 2357;  
    ChopTiles[2].y := 3044;

    ChopTiles[3].x := 2331;  
    ChopTiles[3].y := 3096;

    ChopTiles[4].x := 2369;
    ChopTiles[4].y := 3120;
  end;

procedure InitSystem;
  begin
    SetRunUnmountTimer(RunSpeed);
    SetArrayLength(ChopTilesArray, 1);
  end;

procedure SearchTree;
  var
  i, j : Integer;
  iFoundTilesArrayCount : word;
  iTempFoundTilesArrayCount : Integer;

  begin
    for i:= 0 to iTTileCount do
      begin
        iFoundTilesArrayCount := GetStaticTilesArray((GetX(Self) - iRadiusSearch), (GetY(Self) - iRadiusSearch), (GetX(Self) + iRadiusSearch), (GetY(Self) + iRadiusSearch), 1, TreeTile[i], FoundTilesArray);
        if iFoundTilesArrayCount > 0 then
          begin
            SetArrayLength(TempFoundTilesArray, Length(TempFoundTilesArray) + iFoundTilesArrayCount);
            for j := 0 to iFoundTilesArrayCount - 1 do
              begin
                TempFoundTilesArray[iTempFoundTilesArrayCount + j] := FoundTilesArray[j];
              end;
            iTempFoundTilesArrayCount := iTempFoundTilesArrayCount + iFoundTilesArrayCount;
          end;
      end;
  end;

procedure ClearDuplicate;
  var
  i, j : Integer;

  begin
    ChopTilesArray[Length(ChopTilesArray) - 1] := TempFoundTilesArray[0];
    for i:=1 to Length(TempFoundTilesArray) - 1 do
      begin
        for j:=0 to Length(ChopTilesArray) - 1 do
          if (ChopTilesArray[j] = TempFoundTilesArray[i]) then
            break;
        if j > Length(ChopTilesArray) - 1 then
          begin
            SetArrayLength(ChopTilesArray, Length(ChopTilesArray) + 1);
            ChopTilesArray[Length(ChopTilesArray) - 1] := TempFoundTilesArray[i];
          end;
      end;
  end;

procedure MarkTrees;
  begin
    for i:= 1 to iCTileCount do
      begin
        NewMoveXY(ChopTiles[i].x, ChopTiles[i].y, False, 1, False);
        SearchTree;
        AddToSystemJournal('????? ??????? ????????: ' + IntToStr(Length(TempFoundTilesArray)));
        ClearDuplicate;
      end;
    QuickSort(ChopTilesArray, 0, Length(ChopTilesArray) - 1);
  end;

procedure UnloadOrDead;
  begin
    NewMoveXY(xTileSunduk, yTileSunduk, false, 1, false);
    if not Dead then begin StoreItemsAtBankContainer(logPileTypes, storageContainerType); end
    else begin AddToSystemJournal('???????? ?????.'); SetARStatus(False); Disconnect; end;
  end;

function LumbCurTree(tile,x,y,z : Integer) : Boolean;
  var
  q, m1, m2, m3, m4, m5, m6, m7, m8, mSucc, CountFizzle, NextTree : integer;

  begin
    Result := true;
    CountFizzle := 0;
    repeat
      if WarMode = true then SetWarMode(false);
      if TargetPresent then CancelTarget;
      ctime := Now;
      if Dead then begin Result := false; exit; end;
      if UseType(Hatchet1,$FFFF) = 0 then
        begin
          if UseType(Hatchet2,$FFFF) = 0 then
            begin
              Result := false;
              exit;
            end;
        end;
      WaitForTarget(5000);
      If TargetPresent then TargetToTile(tile, x, y, z);
      q := 0;
      repeat
        wait(100);
        q := q + 1;
        checksave;
        m1 := InJournalBetweenTimes(Msg1, ctime, Now);
        m2 := InJournalBetweenTimes(Msg2, ctime, Now);
        m3 := InJournalBetweenTimes(Msg3, ctime, Now);
        m4 := InJournalBetweenTimes(Msg4, ctime, Now);
        m5 := InJournalBetweenTimes(Msg5, ctime, Now);
        m6 := InJournalBetweenTimes(Msg6, ctime, Now);
        m7 := InJournalBetweenTimes(Msg7, ctime, Now);
        m8 := InJournalBetweenTimes(Msg8, ctime, Now);
        mSucc := InJournalBetweenTimes(MsgSuccess, ctime, Now);
      until (m1<>-1) or (m2<>-1) or (m3<>-1) or (m4<>-1) or (m5<>-1) or (m6<>-1) or (m7<>-1) or (m8<>-1) or Dead or (q > 150) or (mSucc <> -1);
      if (m2<>-1) or (m3<>-1) or (m4<>-1) then CountFizzle := CountFizzle + 1;
      if Dead or (Weight > MyMaxWeight) then begin Result := false; exit; end;
      if (q > 150) then NextTree := NextTree + 1;
    until (m5<>-1) OR (m6<>-1) OR (m7<>-1) OR (m8<>-1) OR (CountFizzle = 10) OR (NextTree > 3);
    if NextTree >= 3 then NextTree := 0;
  end;
Begin
  InitTTilesArray;
  InitCTilesArray;
  InitSystem;
  MarkTrees;

  repeat
    for i:= 0 to Length(ChopTilesArray) - 1 do
      begin
        NewMoveXY(ChopTilesArray[i].x, ChopTilesArray[i].y, false, 1, false);
        if not LumbCurTree(ChopTilesArray[i].tile, ChopTilesArray[i].x, ChopTilesArray[i].y, ChopTilesArray[i].z) then UnloadOrDead;
      end;
  until Dead;
End.
