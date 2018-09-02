Program AutoLumber_SW;

Uses
  Sysutils,
  Constants,
  BankUtils,
  TSP;
  {$Include 'all.inc'}

const
  bankX = 1657;                           
  bankY = 1609;                           
  storageContainerType = $09B0;
  Hatchet1 = $0F43;   
  Hatchet2 = $0F43;   
  unloadWeight = 100;

var
  treeTiles : array of TFoundTile;
  currentTree : Integer;

function SearchTree(minX, minY, maxX, maxY: Integer; allTreeTiles : array of TFoundTile) : array of TFoundTile;
  var
    i, j, nTilesBefore, nNewTiles : Integer;
    newTreeTiles : TFoundTilesArray;
begin
  AddToSystemJournal('Searching for tree tiles within (' + IntToStr(minX) + ', ' + IntToStr(minY) + ') and (' + IntToStr(maxX) + ', ' + IntToStr(maxY) + ') ...');
  for i:= Low(treeTileTypes) to High(treeTileTypes) do
  begin
    nNewTiles := GetStaticTilesArray(minX, minY, maxX, maxY, 1, treeTileTypes[i], newTreeTiles);
    if nNewTiles > 0 then
    begin
      nTilesBefore := Length(allTreeTiles);
      SetArrayLength(allTreeTiles, Length(allTreeTiles) + nNewTiles);
      for j := 0 to (nNewTiles - 1) do
      begin
        allTreeTiles[nTilesBefore + j] := newTreeTiles[j];
      end;
    end;
  end;
  AddToSystemJournal('Tree tiles found: ' + IntToStr(Length(allTreeTiles)));
  Result := allTreeTiles;
end;

function ClearDuplicate(tiles: array of TFoundTile) : array of TFoundTile;
  var
    i, j: Integer;
begin

  for i := 1 to (High(tiles) - 1) do
  begin
    j := i + 1
    while j <= High(tiles) do
    begin
      if (tiles[i].x = tiles[j].x) and (tiles[i].y = tiles[j].y) then
        begin
          tiles[j] := tiles[High(tiles)];
          SetArrayLength(tiles, Length(tiles) - 1);
        end
      else 
        j := j + 1;
    end;
  end;
end;

procedure UnloadAndRestock();
  begin
    AddToSystemJournal('Going to bank to unload and restock hatchets...');
    NewMoveXY(bankX, bankY, true, 1, true);
    StoreItemsAtBankContainer(logPileTypes, storageContainerType);
    RestockItemFromBankContainer(Hatchet1, 5, storageContainerType);
    AddToSystemJournal('Done unloading/restocking.');
  end;

function HarvestTree(tile : TFoundTile) : Boolean;
  var
  q, m1, m2, m3, m4, m5, m6, m7, m8, mSucc, CountFizzle, NextTree : integer;
  ctime : TDateTime;

  begin

    NewMoveXY(tile.x, tile.y, true, 1, true);

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
      If TargetPresent then TargetToTile(tile.tile, tile.x, tile.y, tile.z);
      q := 0;
      repeat
        wait(100);
        q := q + 1;
        checksave;
        m1 := InJournalBetweenTimes('moved', ctime, Now);
        m2 := InJournalBetweenTimes('could not', ctime, Now);
        m3 := InJournalBetweenTimes('hack', ctime, Now);
        m4 := InJournalBetweenTimes('You decide not to chop wood', ctime, Now);
        m5 := InJournalBetweenTimes('There is nothing', ctime, Now);
        m6 := InJournalBetweenTimes('appears immune', ctime, Now);
        m7 := InJournalBetweenTimes('Try chopping', ctime, Now);
        m8 := InJournalBetweenTimes('reach this', ctime, Now);
        mSucc := InJournalBetweenTimes('put', ctime, Now);
      until (m1<>-1) or (m2<>-1) or (m3<>-1) or (m4<>-1) or (m5<>-1) or (m6<>-1) or (m7<>-1) or (m8<>-1) or Dead or (q > 150) or (mSucc <> -1);
      if (m2<>-1) or (m3<>-1) or (m4<>-1) then CountFizzle := CountFizzle + 1;
      if Dead or (Weight > unloadWeight) then begin Result := false; exit; end;
      if (q > 150) then NextTree := NextTree + 1;
    until (m5<>-1) OR (m6<>-1) OR (m7<>-1) OR (m8<>-1) OR (CountFizzle = 10) OR (NextTree > 3);
    if NextTree >= 3 then NextTree := 0;
  end;


Begin
  treeTiles := SearchTree(1519, 1542, 1676, 1790, treeTiles);
  DrawTour(treeTiles);
  //treeTiles := SearchTree(1560, 1623, 1614, 1675, treeTiles);
  AddToSystemJournal('Total trees tiles found: ' + IntToStr(Length(treeTiles)));
  AddToSystemJournal('Tour length before sorting:' + IntToStr(Round(TourLength(treeTiles))));
  GreedySort(treeTiles);
  DrawTour(treeTiles);
  AddToSystemJournal('Tour length after greedy sorting:' + IntToStr(Round(TourLength(treeTiles))));
  twoOpt(treeTiles)
  DrawTour(treeTiles);
  AddToSystemJournal('Tour length after 2Opt sorting:' + IntToStr(Round(TourLength(treeTiles))));

  currentTree := 0;
  while True do
  begin
    //if Dead then Ressurrect();
    if (Weight() >= unloadWeight) or (FindType(Hatchet1, Backpack()) = 0) then UnloadAndRestock();
    while (not Dead) and (Weight() < unloadWeight) do
    begin
      HarvestTree(treeTiles[currentTree]);
      currentTree := (currentTree + 1) mod Length(treeTiles);
    end;
  end;
End.
