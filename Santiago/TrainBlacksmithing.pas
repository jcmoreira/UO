program TrainBlackmmithing;

uses
    Constants;
    
begin

    while GetSkillValue('Blacksmithing') < 70.0 do
    begin
        UseObject(FindTypeEx($1BEF, $0000, Backpack, false));
        WaitMenu('Blacksmithing', 'Shaped Iron');
        WaitJournalLineSystem(Now, 'put', 3000);
        UOsay('vendor sell guards');
        AutoSell($1BD7,  $03BB, 41);
        wait(200)   
    end;

end.