unit TrainSpiritSpeak;

interface

    procedure TrainSpiritSpeak();

implementation

    procedure TrainSpiritSpeak();
    begin
        while GetSkillValue('Spirit Speak') < 100.0 do
	begin
	    UseSkill('Spirit Speak');
	    WaitJournalLineSystem(Now, 'falhou|establish|cancelada', 6000);
	end;
    end;
end.

