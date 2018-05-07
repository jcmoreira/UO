unit TrainMusicianship;

interface

  procedure TrainMusicianship(instrumentId: Cardinal);

implementation

  procedure TrainMusicianship(instrumentId: Cardinal);
  begin
    while (GetSkillValue('Musicianship') < 100.0) and (FindType(instrumentId, BackPack()) > 0 ) do
    begin
        UseObject(FindItem());
        WaitJournalLineSystem(Now, 'play', 2000);
        Wait(100);
    end;
  end;

end.
