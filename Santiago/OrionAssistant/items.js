class Item {
   constructor(name, type, color) {
      this.name = name;
      this.type = type;
      this.color = color;	   

}

// ----------- SCROLLS ----------------
// First Circle Scrolls
const clumsyScroll = new Item('Clumsy Scroll', '0x1F2E', '0x0000');
const createFoodScroll = new Item('Create Food Scroll', '0x1F2F', '0x0000');
const feeblemindScroll = new Item('Feeblemind Scroll', '0x1F30', '0x0000');
const healScroll = new Item('Heal Scroll', '0x1F31', '0x0000');
const magicArrowScroll = new Item('Magic Arrow Scroll', '0x1F32', '0x0000');
const nightSightScroll = new Item('Night Sight Scroll', '0x1F33', '0x0000');
const reactiveArmorScroll = new Item('Reactive Armor Scroll', '0x1F2D', '0x0000');
const weakenScroll = new Item('Weaken Scroll', '0x1F34', '0x0000');
const firstCircleScrolls = [clumsyScroll, createFoodScroll, feeblemindScroll, healScroll, magicArrowScroll, nightSightScroll, reactiveArmorScroll, weakenScroll];

// Second Circle Scrolls
const agilityScroll = new Item('Agility Scroll', '0x1F35', '0x0000');
const cunningScroll = new Item('Cunning Scroll', '0x1F36', '0x0000');
const cureScroll = new Item('Cure Scroll', '0x1F37', '0x0000');
const harmScroll = new Item('Harm Scroll', '0x1F38', '0x0000');
const magicTrapScroll = new Item('Magic Trap Scroll', '0x1F39', '0x0000');
const magicUntrapScroll = new Item('Magic Untrap Scroll', '0x1F3A', '0x0000');
const protectionScroll = new Item('Protection Scroll', '0x1F3B', '0x0000');
const strengthScroll = new Item('Strength Scroll', '0x1F3C', '0x0000');
const secondCircleScrolls = [agilityScroll, cunningScroll, cureScroll, harmScroll, magicTrapScroll, magicUntrapScroll, protectionScroll, strengthSctroll];

// Third Circle Scrolls
const blessScroll = new Item('Bless Scroll', '0x1F3D', '0x0000');
const fireballScroll = new Item('Fireball Scroll', '0x1F3E', '0x0000');
const magicLockScroll = new Item('Magic Lock Scroll', '0x1F3F', '0x0000');
const poisonScroll = new Item('Poison Scroll', '0x1F40', '0x0000');
const telekinesisScroll = new Item('Telekinesis Scroll', '0x1F41', '0x0000');
const teleportScroll = new Item('Teleport Scroll', '0x1F42', '0x0000');
const unlockScroll = new Item('Unlock Scroll', '0x1F43', '0x0000');
const wallOfStoneScroll = new Item('Wall of Stone Scroll', '0x1F44444', '0x0000');
const thirdCircleScrolls = [blessScroll, fireballScroll, magicLockScroll, poisonScroll, telekinesisScroll, teleportScroll, unlockScroll, wallOfStoneScroll];

// Fourth Circle Scrolls
const archCureScroll = new Item('Arch Cure Scroll', '0x1F45', '0x0000');
const archProtectionScroll = new Item('Arch Protection Scroll', '0x1F46', '0x0000');
const curseScroll = new Item('Curse Scroll', '0x1F47', '0x0000');
const fireFieldScroll = new Item('Fire Field Scroll', '0x1F48', '0x0000');
const greaterHealScroll = new Item('Greater Heal Scroll', '0x1F49', '0x0000');
const lightningScroll = new Item('Lightning Scroll', '0x1F4A', '0x0000');
const manaDrainScroll = new Item('Mana Drain Scroll', '0x1F4B', '0x0000');
const recallScroll = new Item('Recall Scroll', '0x1F4C', '0x0000');
const fourthCircleScrolls = [archCureScroll, archProtectionScroll, curseScroll, fireFieldScroll, greaterHealScroll, lightningScroll, manaDrainScroll, recallScroll];

// Fifth Circle Scrolls
const bladeSpiritsScroll = new Item('Blade Spirits Scroll', '0x1F4D', '0x0000');
const dispelFieldScroll = new Item('Dispel Field Scroll', '0x1F4E', '0x0000');
const incognitoScroll = new Item('Incognito Scroll', '0x1F4F', '0x0000');
const magicReflectionScroll = new Item('Magic Reflection Scroll', '0x1F50', '0x0000');
const mindBlastScroll = new Item('Mind Blast Scroll', '0x1F51', '0x0000');
const paralyzeScroll = new Item('Paralyze Scroll', '0x1F52', '0x0000');
const poisonFieldScroll = new Item('Poison Field Scroll', '0x1F53', '0x0000');
const summonCreatureScroll = new Item('Summon Creature Scroll', '0x1F54', '0x0000');
const fifthCircleScroll = [bladeSpiritsScroll, dispelFieldScroll, incognitoScroll, magicReflectionScroll, mindBlastScroll, poisonFieldScroll, summonCreatureScroll];

// Sixth Circle Scrolls
const dispelScroll = new Item('Dispel Scroll', '0x1F55', '0x0000');
const energyBoltScroll = new Item('Energy Bolt Scroll', '0x1F56', '0x0000');
const explosionScroll = new Item('Explosion Scroll', '0x1F57', '0x0000');
const invisibilityScroll = new Item('Invisibility Scroll', '0x1F58', '0x0000');
const markScroll = new Item('Mark Scroll', '0x1F59', '0x0000');
const massCurseScroll = new Item('Mass Curse Scroll', '0x1F5A', '0x0000');
const paralyzeFieldScroll = new Item('Paralyze Field Scroll', '0x1F5B', '0x0000');
const revealScroll = new Item('Reveal Scroll', '0x1F5C', '0x0000');
const sixthCircleScroll = [dispelScroll, energyBoltScroll, explosionScroll, invisibilityScroll, markScroll, massCurseScroll, paralyzeFieldScroll, revealScroll];

// Seventh Circle Scrolls
const chainLightningScroll = new Item('Chain Lightning Scroll', '0x1F5D', '0x0000');
const energyFieldScroll = new Item('Energy Field  Scroll', '0x1F5E', '0x0000');
const flameStrikeScroll = new Item('Flame Strike Scroll', '0x1F5F', '0x0000');
const gateTravelScroll = new Item('Gate Travel Scroll', '0x1F60', '0x0000');
const manaVampireScroll = new Item('Mana Vampire Scroll', '0x1F61', '0x0000');
const massDispelScroll = new Item('Mass Dispel Scroll', '0x1F62', '0x0000');
const meteorSwarmScroll = new Item('Meteor Swarm Scroll', '0x1F63', '0x0000');
const polymorphScroll = new Item('Polymorph Scroll', '0x1F64', '0x0000');
const seventhCircle = [chainLIghtningScroll, energyFieldScroll, flameStrikeScroll, gateTravelScroll, manaVampireScroll, massDispelScroll, meteorSwarmScroll, polymorphScroll];

// Eight Circle Scrolls
const earthquakeScroll = new Item('Earthquake Scroll', '0x1F65', '0x0000');
const energyVortexScroll = new Item('Energy Vortex Scroll', '0x1F66', '0x0000');
const ressurrectionScroll = new Item('Ressurrection Scroll', '0x1F67', '0x0000');
const airElementalScroll = new Item('Air Elemental Scroll', '0x1F68', '0x0000');
const summonDaemonScroll = new Item('Summon Daemon Scroll', '0x1F69', '0x0000');
const earthElementalScroll = new Item('Earth Elemental Scroll', '0x1F6A', '0x0000');
const fireElementalScroll = new Item('Fire Elemental Scroll', '0x1F6B', '0x0000');
const waterElementalScroll = new Item('Water Elemental Scroll', '0x1F6C', '0x0000');
const eigthCircle = [earthquakeScroll, energyVortexScroll, ressurrectionScroll, airElementalScroll, summonDaemonScroll, earthElementalScroll, fireElementalScroll, waterElementalScroll];

// -----------------------------------

// ----------- WEAPONS ---------------


const axe = new Item('Axe', '0x0F49', '0x0000');
const bardiche = new Item('Bardiche', '0x0F4D', '0x0000'); 
const battleAxe = new Item('Battle Axe', '0x0F47', '0x0000'); 
const bow = new Item('Bow', '0x13B1', '0x0000'); 
const crossbow = new Item('Crossbow', '0x0F4F', '0x0000');
const executionerAxe = new Item('Executioners Axe', '0x0F45', '0x0000');
const halberd = new Item('Halberd', '0x143E', '0x0000'); 
const katana = new Item('Katana', '0x13FE', '0x0000'); 
const kryss = new Item('Kryss', '0x1400', '0x0000'); 
const largeBattleAxe = new Item('Large Battle Axe', '0x13FA', '0x0000'); 
const pitchfork = new Item('Pitchfork', '0x0E88', '0x0000'); 
const vikingSword = new Item('Viking Sword', '0x13B9', '0x0000'); 
const scimitar= new Item('Scimitar', '0x13B5', '0x0000'); 
const warAxe = new Item('War Axe', '0x13AF', '0x0000'); 
const warFork = new Item('War Fork', '0x1404', '0x0000'); 
const warHammer = new Item('War Hammer', '0x1438', '0x0000'); 
const warMace = new Item('War Mace', '0x1406', '0x0000');
const weapons =[axe, bardiche, battleAxe, bow, crossbow, executionerAxe, halberd, katana, kryss, pitchfork, warAxe, warMace];
