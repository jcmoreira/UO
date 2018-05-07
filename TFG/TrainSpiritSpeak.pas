unit TrainSpiritSpeak;

interface

    procedure TrainSpiritSpeak();

implementation

    procedure TrainSpiritSpeak();
    begin
        while GetSkillValue('Spirit Speak') < 100.0 do
	begin
	    UseSkill('Spirit Speak');
	    WaitJournalLineSystem(Now, 'falhou|establish', 2000);
	    Wait(100);
	end;
    end;
end.

