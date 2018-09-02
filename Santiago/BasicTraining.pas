program BasicTraining;

  uses
    Constants,
    TrainAnatomy,
    TrainAnimalLore,
    TrainArmsLore,
    TrainDetectingHidden,
    TrainEvaluatingIntelligence,
    TrainHiding,
    TrainItemIdentification, 
    TrainMusicianship,
    TrainPeacemaking,
    TrainSpiritSpeak,
    TrainStealth,
    TrainTasteIdentification,
    TrainTracking;

begin

    TrainAnatomy;
    //TrainAnimalLore();
    TrainArmsLore($1B76);
    TrainDetectingHidden();
    TrainEvaluatingIntelligence();
    TrainHiding();
    TrainItemIdentification($1B76);
    //TrainMusicianship(luteType);
    TrainPeacemaking($0EB3);
    TrainStealth();
    TrainTasteIdentification($09EA);
    TrainTracking();
    
end.
