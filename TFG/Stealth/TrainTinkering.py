from py_stealth import *
from Constants import *
from datetime import datetime

storageContainer = 0x1111

while GetSkillValue('Tinkering') and FindType(INGOT_TYPE, Ground()):
    groundIngots = FindItem()

    MoveItems(Backpack(), SPRINGS_TYPE, 0x0000, storageContainer, 0,0,0, 1000, 1000)
    MoveItems(Backpack(), CLOCK_PARTS_TYPE, 0x0000, storageContainer, 0, 0, 0, 1000, 1000)

    while FindType(INGOT_TYPE, Backpack()) < 3:
        MoveItem(groundIngots, 1000, Backpack(), 0, 0, 0)
        Wait(2000)

    while GetSkillValue('Tinkering') <= 32.1 and FindType(INGOT_TYPE, Backpack()) > 0 and FindFullQuantity() >= 3:
        UseObject(FindType(TINKER_TOOLS_TYPE, Backpack()))
        WaitMenu('Tinkering', 'Parts')
        WaitMenu('Parts', 'springs')
        WaitJournalLineSystem(datetime.now(), 'put', 3000)

    while 32.1 < GetSkillValue('Tinkering') < 70.0 and FindType(INGOT_TYPE, Backpack()) > 0 and FindFullQuantity() >= 3:
        UseObject(FindType(TINKER_TOOLS_TYPE, Backpack()))
        WaitMenu('Tinkering', 'Parts')
        WaitMenu('Parts', 'clock parts')
        WaitJournalLineSystem(datetime.now(), 'put', 3000)
