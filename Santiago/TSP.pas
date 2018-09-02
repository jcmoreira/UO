unit TSP;

interface
  procedure GreedySort(tiles: array of TFoundTile);
  procedure QuickSort(tiles: array of TFoundTile; left,right: Integer);

implementation

  function square(x:LongInt) : LongInt;
  begin
    result := x * x;
  end;

  function distanceTo(tile:TFoundTile) : Integer;
  begin
    result := Round(sqrt(square(GetX(self)-tile.X)+square(GetY(self)-tile.Y)));
  end;

  function distanceBetween(tile1, tile2:TFoundTile) : Real;
  begin
    result := sqrt(square(tile1.x - tile2.X) + square(tile1.y - tile2.Y));
  end;

  function TourLength(tiles: array of TFoundTile) : Real;
    var
      i : Integer;
      totalLength : Real;
  begin
    totalLength := 0.0;

    for i := 0 to (Length(tiles) - 2) do
    begin
      totalLength := totalLength + distanceBetween(tiles[i], tiles[i + 1])
    end;

    Result := totalLength + distanceBetween(tiles[Length(tiles) -1], tiles[0]);
  end;

  function DrawLine(x_1, y_1, x_2, y_2: Integer; color : Cardinal) : Cardinal;
  var
    Figure: TMapFigure;
  Begin
    Figure.kind := fkLine;
    Figure.coord := fcWorld;
    Figure.x1 := x_1;
    Figure.y1 := y_1;
    Figure.x2 := x_2;
    Figure.y2 := y_2;
    Figure.brushStyle := bsClear;
    Figure.brushColor := $000000;
    Figure.color := color;
    Figure.text := '';
    Result := AddFigure(Figure);
  End;
  
  function TileToStr(tile : TFoundTile) : String;
  begin
    Result := '(' + IntToStr(tile.X) + ', ' + IntToStr(tile.Y) + ')';
  end;

  function EdgeToStr(startVertex, endVertex : TFoundTile) : String;
  begin
    Result := TileToStr(startVertex) + '->' + TileToStr(endVertex);
  end;

  function DrawTour (tiles: array of TFoundTile) : array of Cardinal;
    var
      i : Integer;
      edges : array of Cardinal;
  begin
    ClearFigures();
    SetArrayLength(edges, Length(tiles));
    for i := 0 to (Length(tiles) - 2) do
    begin
      edges[i] := DrawLine(tiles[i].X, tiles[i].Y, tiles[i + 1].X, tiles[i + 1].Y, $00FF00);
    end;
    edges[Length(tiles) -1] := DrawLine(tiles[Length(tiles) - 1].X, tiles[Length(tiles) - 1].Y, tiles[0].X, tiles[0].Y, $00FF00);
    Result := edges;
  end;

  procedure QuickSort(tiles: array of TFoundTile; left,right: Integer);
    var
      i, j: Integer;
      x, y: TFoundTile;

  begin
    i := left;
    j := right;
    x := tiles[((left + right) div 2)];
    repeat
      while distanceTo(tiles[i]) < distanceTo(x) do inc(i);
      while distanceTo(x) < distanceTo(tiles[j]) do dec(j);
      if not (i>j) then
        begin
          y:= tiles[i];
          tiles[i]:= tiles[j];
          tiles[j]:= y;
          inc(i);
          dec(j);
        end;
    until i>j;
    if left < j then QuickSort(tiles, left,j);
    if i < right then QuickSort(tiles, i,right);
  end;

  procedure GreedySort(tiles: array of TFoundTile);
    var
      i, j, closest : Integer;
      currentDistance, minDistance : Real;
      auxTile : TFoundTile;
  begin
    AddToSystemJournal('Greedy sorting tiles ...');
    for i := 0 to (Length(tiles) - 3) do
    begin
      minDistance := -1.0;
      
      for j := i + 1 to (Length(tiles) - 1) do
      begin
        currentDistance := distanceBetween(tiles[i], tiles[j]);
        if (minDistance < 0.0) or (currentDistance < minDistance) then
        begin
          minDistance := currentDistance;
          closest := j;
        end;
      end;
      
      auxTile := tiles[i + 1];
      tiles[i + 1] := tiles[closest];
      tiles[closest] := auxTile;
    end;
    AddToSystemJournal('Done.');
  end;

  function reverseTour(tiles : array of TFoundTile; startVertex, endVertex : Integer):  array of TFoundTile;
    var
      i,j : Integer;
      aux : TFoundTile;
  begin
    i := startVertex;
    j := endVertex;

    repeat
      aux := tiles[j];
      tiles[j] := tiles[i];
      tiles[i] := aux;

      i := i + 1;
      j := j - 1;
    until j <= i;

    Result := tiles;

  end;

   procedure twoOpt(tiles: array of TFoundTile);
     var
       edge1start, edge2Start, edge1End, edge2End : Integer;
       improved : Boolean;
   begin
    AddToSystemJournal('TwoOpt sorting tiles ...');
    if Length(tiles) <= 3 then Exit;
    repeat
      improved := false;
      for edge1start := 0 to High(tiles) - 2 do
      begin
        for edge2Start := edge1start + 2 to High(tiles) - 1 do
        begin
          edge1End := (edge1start + 1) Mod Length(tiles);
          edge2End := (edge2Start + 1) Mod Length(tiles);
          // AddToSystemJournal('Testing ' + 
          //   IntToStr(edge1Start) + ' -> ' + IntToStr(edge1End) + ' ' + EdgeToStr(tiles[edge1Start], tiles[edge1End]) + 
          //   ' against ' + 
          //   IntToStr(edge2Start) + ' -> ' + IntToStr(edge2End) + ' ' + EdgeToStr(tiles[edge2Start], tiles[edge2End]) + 
          //   ': ' + 
          //   FloatToStr((distanceBetween(tiles[edge1Start], tiles[edge1End]) + distanceBetween(tiles[edge2Start], tiles[edge2End]))) + ' ' + 
          //   FloatToStr(distanceBetween(tiles[edge1Start], tiles[edge2Start]) + distanceBetween(tiles[edge1End], tiles[edge2End])));
          // Wait(250);
          if (distanceBetween(tiles[edge1Start], tiles[edge1End]) + distanceBetween(tiles[edge2Start], tiles[edge2End])) > 
             (distanceBetween(tiles[edge1Start], tiles[edge2Start]) + distanceBetween(tiles[edge1End], tiles[edge2End])) then
          begin
            //AddToSystemJournal('improved!');
            improved := True;
            tiles := reverseTour(tiles, edge1End, edge2Start);
            //DrawTour(tiles);
          end;
          if improved then break;
         end;
        if improved then break;
      end;
    until not improved;
    AddToSystemJournal('Done.');
  end;
end.
