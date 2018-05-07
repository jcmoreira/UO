Program HealSelf;
begin

    while (Life < MaxHP) do
    begin
        UseObject(FindType($0E21, BackPack));
        WaitTargetSelf();
        WaitJournalLineSystem(Now, 'put', 7000);
        WaitJournalLineSystem(Now, 'put', 7000);
    end;

end.