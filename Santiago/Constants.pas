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

    shepherdsCrookType = $0E81;
    pigType = $00CB;

  var
    orePileTypes: array of Cardinal;
    logPileTypes: array of Cardinal;
    gemStoneTypes: array of Cardinal;
    fishTypes: array of Cardinal;
    treeTileTypes: array of Cardinal;

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

    SetLength(treeTileTypes, 40);
    treeTileTypes[0] := 3274;
    treeTileTypes[1] := 3275;
    treeTileTypes[2] := 3277;
    treeTileTypes[3] := 3280;

    treeTileTypes[4] := 3283;
    treeTileTypes[5] := 3286;
    treeTileTypes[6] := 3288;
    treeTileTypes[7] := 3290;

    treeTileTypes[8] := 3293;
    treeTileTypes[9] := 3296;
    treeTileTypes[10] := 3299;
    treeTileTypes[11] := 3302;
  
    treeTileTypes[12] := 3320;
    treeTileTypes[13] := 3323;
    treeTileTypes[14] := 3326;
    treeTileTypes[15] := 3329;

    treeTileTypes[16] := 3393;
    treeTileTypes[17] := 3394;
    treeTileTypes[18] := 3395;
    treeTileTypes[19] := 3396;

    treeTileTypes[20] := 3415;
    treeTileTypes[21] := 3416;
    treeTileTypes[22] := 3417;
    treeTileTypes[23] := 3418;

    treeTileTypes[24] := 3419;
    treeTileTypes[25] := 3438;
    treeTileTypes[26] := 3439;
    treeTileTypes[27] := 3440;

    treeTileTypes[28] := 3441;
    treeTileTypes[29] := 3442;
    treeTileTypes[30] := 3460;
    treeTileTypes[31] := 3461;

    treeTileTypes[32] := 3462;
    treeTileTypes[33] := 3476;
    treeTileTypes[34] := 3478;
    treeTileTypes[35] := 3480;

    treeTileTypes[36] := 3482;
    treeTileTypes[37] := 3484;
    treeTileTypes[38] := 3492;
    treeTileTypes[39] := 3496;
  end;
end.
