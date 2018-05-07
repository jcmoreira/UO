unit Constants;

interface

  const
    pickaxeType = $0E85;
    ingotType = $1BEF;
    oneOrePileType = $19B7;
    twoOresPileType = $19BA;
    threeOresPileType = $19B8;
    fourOresPileType = $19B9;
    oneSausageType = $09C0;
    luteType = $0EB3;
    logPileType = $1BDD;
    tinkerToolsType = $1EBC;
    sawType = $1034;
    scrollsType = $0E34;
    bottleType = $0F0E;
    emptyBottleColor = $0000;
    lesserPoisonBottleColor = $0049;
    nightshadeType = $0F88;
    daggerType = $0F51;
    shaftsType = $1BD4;
    foldedClothType = $175D;
    sewingKitType = $0F9D;
    clothBoxType = $1422;
    clothBoxColor = $0041;
    antidoteClothBoxColor = $009B;
    tameHarpType = $0EB2;
    tameHarpColor = $0185;
    tinkersToolsType = $1EBC;
    springsType = $105D;  
    clockPartsType = $104F;

    ceramicColor = $00F2;

    starSapphireType = $0F0F;
    emeraldType = $0F10;
    sapphireType = $0F11;
    rubyType = $0F13;
    citrineType = $0F15;
    amethystType = $0F16;
    tourmalineType = $0F18;
    diamondType = $0F26;

    mapRollType = $14ED;

    fishingPoleType = $0DBF;
    greenFishType = $09CC;
    brownFishType = $09CD;
    purpleFishType = $09CE;
    yellowFishType = $09CF;

    shipContainerType = $3EAE;

    rawFishSteakType = $097A;
    fishSteakType = $097B;
    fryPanType = $097F;

    sulfurousAshType = $0F8C;

    bloodyBandageType = $0E20;
    cleanBandageType = $0E21;
    magicArrowScrollsType = $1F32;

  var
    orePileTypes: array of Cardinal;
    logPileTypes: array of Cardinal;
    gemStoneTypes: array of Cardinal;
    fishTypes: array of Cardinal;

implementation

initialization
  begin
    SetLength(orePileTypes, 4);
    orePileTypes[0] := oneOrePileType;
    orePileTypes[1] := twoOresPileType;
    orePileTypes[2] := threeOresPileType;
    orePileTypes[3] := fourOresPileType;

    SetLength(logPileTypes, 1);
    logPileTypes[0] := logPileType;

    SetLength(gemStoneTypes, 8);
    gemStoneTypes[0] := amethystType;
    gemStoneTypes[1] := citrineType;
    gemStoneTypes[2] := diamondType;
    gemStoneTypes[3] := emeraldType;
    gemStoneTypes[4] := rubyType;
    gemStoneTypes[5] := sapphireType;
    gemStoneTypes[6] := starSapphireType;
    gemStoneTypes[7] := tourmalineType;

    SetLength(fishTypes, 4);
    fishTypes[0] := greenFishType;
    fishTypes[1] := brownFishType;
    fishTypes[2] := purpleFishType;
    fishTypes[3] := yellowFishType;
  end;
end.
