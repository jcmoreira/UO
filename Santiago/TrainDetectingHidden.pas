unit TrainDetectingHidden;

interface

    procedure TrainDetectingHidden();

implementation

    procedure TrainDetectingHidden();
    begin
        while GetSkillValue('Detecting Hidden') < 100.0 do
	begin
	  UseSkill('Detecting Hidden');
	  WaitJournalLineSystem(Now, 'find|nothing', 3000);
	end;
    end;
end.
