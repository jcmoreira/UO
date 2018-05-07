program TrainInscription;

uses
    Constants;
var
    groundScrolls, groundReagents : Cardinal;

begin

    while (GetSkillValue('Inscription') < 70.0)
      and (FindType(scrollsType, Ground) > 0)
      and (FindType(sulfurousAshType, Ground) > 0) do
      begin

	while (FindType(scrollsType, BackPack) = 0) do
	begin
	   groundScrolls := FindType(scrollsType, Ground);
	   MoveItem(groundScrolls, 200, BackPack, 0, 0, 0);
	   Wait(2000);
	end;

	while (FindType(sulfurousAshType, BackPack) = 0) do
	begin
	    groundReagents := FindType(sulfurousAshType, Ground);
	    MoveItem(groundReagents, 200, BackPack, 0, 0, 0);
	    Wait(2000);
	end;

	while (GetSkillValue('Inscription') < 70.0)
	  and (FindType(scrollsType, BackPack) > 0)
	  and (FindType(sulfurousAshType, BackPack) > 0) do
	  begin

              while (Mana < 10) do
              begin
	         UseSkill('Meditation');
		 WaitJournalLineSystem(Now, 'perdeu|stop|peace', 120000);
              end;

              UseObject(FindType(scrollsType, BackPack));
	      WaitMenu('Spell Circle 1', 'Magic Arrow');
	      WaitJournalLineSystem(Now, 'put|fail', 6000);
	      Wait(200);
	  end;

	while FindType($1F32, BackPack) > 0 do
	begin
	   MoveItem(FindItem, 100, $40131F2E, 0, 0, 0);
	   Wait(1000);
	end;

      end;
end.
