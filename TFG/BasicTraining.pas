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
    TrainSpiritSpeak,
    TrainStealth,
    TrainTasteIdentification,
    TrainTracking;

begin

    TrainAnatomy;
    //TrainAnimalLore();
    TrainArmsLore(pickaxeType);
    TrainDetectingHidden();
    TrainEvaluatingIntelligence();
    TrainHiding();
    TrainItemIdentification(pickaxeType);
    //TrainMusicianship(luteType);
    TrainStealth();
    //TrainTasteIdentification(oneSausageType);
    TrainTracking;
    
end.
