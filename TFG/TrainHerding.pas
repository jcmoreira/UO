Program TrainHerding;
Uses
   Constants;

var
   shepherdsCrook, pig: Cardinal;

begin

   FindDistance := 5;

   AddToDebugJournal('Searching Shepherds Crook...');
   shepherdsCrook := FindType(shepherdsCrookType, Backpack);
   AddToDebugJournal('Found Shepherds Crook!');

   AddToDebugJournal('Searching Pig...');
   pig := FindType($00E7, Ground);
   AddToDebugJournal('Found Pig! ');


   while GetSkillValue('Herding') < 100.0 do
   begin
      if TargetPresent() then CancelTarget();
      UseObject(shepherdsCrook);
      WaitTargetObject(pig);
      Wait(300);
      WaitTargetXYZ(GetX(pig), GetY(pig), GetZ(pig));
      WaitJournalLineSystem(Now(), 'animal|move', 5000);
   end;
end.	
