Program AutoLumber_SW;

Uses
  Sysutils,
  Constants,
  BankUtils;
  {$Include 'all.inc'}

const
  Sunduk = $40044DE1;                            

  xTileSunduk = 1657;                           
  yTileSunduk = 1609;                           
  storageContainerType = $09B0;
  MyMaxWeight = 100;  
  Hatchet1 = $0F43;   
  Hatchet2 = $0F43;   

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
  Regs : array [1..3] of Cardinal;
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
    ChopTiles[1].x := 1611;
    ChopTiles[1].y := 1744;

    ChopTiles[2].x := 1634; 
    ChopTiles[2].y := 1682;
    
    ChopTiles[3].x := 1657;  
    ChopTiles[3].y := 1609;

    ChopTiles[4].x := 1640;
    ChopTiles[4].y := 1543;
  end;

procedure InitSystem;
  begin
    SetRunUnmountTimer(RunSpeed);
    SetArrayLength(ChopTilesArray, 1);
  end;

procedure InitReg;
  begin
    Regs[1] := $0F85;      // Ginseng
    Regs[2] := $0F88;      // Nightshade
    Regs[3] := $0F86;      // Mandrake Roots
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
    AddToSystemJournal('??????? ????????: ' + IntToStr(iTempFoundTilesArrayCount));
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
      AddToSystemJournal('????? ?????????? ??????????, ???????? ????????:' + IntToStr(Length(ChopTilesArray)));
  end;

function sqr(a:LongInt):LongInt;
  begin
    result:=a*a;
  end;

function vector_length(c_2:TFoundTile):LongInt;
  begin
    result:=Round(sqrt(sqr(GetX(self)-c_2.X)+sqr(GetY(self)-c_2.Y)));
  end;

procedure QuickSort(A: array of TFoundTile; l,r: integer);
  var
  i, j: Integer;
  x, y: TFoundTile;

  begin
    i := l;
    j := r;
    x := A[((l + r) div 2)];
    repeat
      while vector_length(A[i]) < vector_length(x) do inc(i);
      while vector_length(x) < vector_length(A[j]) do dec(j);
      if not (i>j) then
        begin
          y:= A[i];
          A[i]:= A[j];
          A[j]:= y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if l < j then QuickSort(ChopTilesArray, l,j);
    if i < r then QuickSort(ChopTilesArray, i,r);
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
      UOSay('guards');
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
  InitReg;
  MarkTrees;

  repeat
    for i:= 0 to Length(ChopTilesArray) - 1 do
      begin
        NewMoveXY(ChopTilesArray[i].x, ChopTilesArray[i].y, false, 1, false);
        if not LumbCurTree(ChopTilesArray[i].tile, ChopTilesArray[i].x, ChopTilesArray[i].y, ChopTilesArray[i].z) then UnloadOrDead;
      end;
  until Dead;
End.
