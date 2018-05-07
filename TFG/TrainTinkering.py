 from stealth import *

while GetSkillValue('Tinkering') and (FindType(ingotType, Ground()):
    groundIngots = FindItem();

    while FindType(ingotType, Backpack()) < 3:
        MoveItem(groundIngots, 1000, Backpack(), 0, 0, 0)
        Wait(2000)

        while GetSkillValue('Tinkering') <= 32.1 and FindType(ingotType, Backpack()) >= 3:
            UseObject(FindType(tinkerToolsType, Backpack()))
            WaitMenu('Tinkering', 'Parts')
            WaitMenu('Parts', 'springs')
            WaitJournalLineSystem(Now, 'put', 3000)
            Wait(200)

        while GetSkillValue('Tinkering') > 32.1 and GetSkillValue('Tinkering') < 70.0 and FindType(ingotType, Backpack()) >= 3:
            UseObject(FindType(tinkerToolsType, Backpack()))
            WaitMenu('Tinkering', 'Parts')
            WaitMenu('Parts', 'clock parts')
            WaitJournalLineSystem(Now, 'put', 3000)
            Wait(200)

        while FindType(springsType, Backpack()) > 0:
            DropHere(FindItem())
            Wait(2000)

        while FindType(clockPartsType, Backpack()) > 0:
            DropHere(FindItem())
            Wait(2000)
