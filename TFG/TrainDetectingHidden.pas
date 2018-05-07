unit TrainDetectingHidden;

interface

    procedure TrainDetectingHidden();

implementation

    procedure TrainDetectingHidden();
    begin
        while GetSkillValue('Detecting Hidden') < 100.0 do
	begin
	    UseSkill('Detecting Hidden');
	    WaitJournalLineSystem(Now, 'nothing', 3000);
	    Wait(100);
	end;
    end;
end.
