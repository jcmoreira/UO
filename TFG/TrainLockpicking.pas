Program TrainLockpicking;
Uses
   Constants;

var
   door: Cardinal;

begin

   door := $401279A8;

   while GetSkillValue('Lockpicking') < 100.0 do
   begin
      if TargetPresent() then CancelTarget();
      UseObject(FindType($14FB, Backpack));
      WaitTargetObject(door);
      WaitJournalLineSystem(Now(), 'unable to pick the lock', 5000);
   end;
end.	
