program TrainTaming;

uses
    Constants;
begin
  while (GetSkillValue('Animal Taming') < 70.0)
    and (FindTypeEx(tameHarpType, tameHarpColor, Ground, true) > 0)do
  begin
     UseObject(FindItem);
     WaitTargetObject($000E25DF);
     WaitJournalLine(Now, 'mestre|falhou', 6000);
     UOSay('all release');
   end;
end.
