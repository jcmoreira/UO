from py_stealth import *
from Constants import *
from datetime import datetime
import random

mine_X = 2580
mine_Y = 450
bank_X = 2505
bank_Y = 542

def check_weight():
    return Weight() < (MaxWeight() - 30)


def mine_tile(x, y):
    option = 0

    while option <= 1:
        if TargetPresent():
            CancelTarget()
        Disarm()
        UseObject(FindType(PICKAXE_TYPE, Backpack()))
        WaitTargetXYZ(x, y, GetZ(Self()))
        WaitJournalLineSystem(datetime.now(), 'put|rocks|line|elsewhere|nothing|close|decide|away', 10000)
        option = FoundParamID()

def mine_around():
    for x_idx in range(-2, 3):
        for y_idx in range(-2, 3):
            if check_weight():
                mine_tile(GetX(Self()) + x_idx, GetY(Self()) + y_idx)

def move():
    new_x = 0
    new_y = 0

    while new_x == 0 and new_y == 0:
        new_x = GetX(Self()) + (2 * random.randint(-2, 2))
        new_y = GetY(Self()) + (2 * random.randint(-2, 2))

    MoveXY(new_x, new_y, True, 1, True)

def mine():
    while check_weight():
        move()
        mine_around()

def go_to_mine():
    MoveXY(mine_X, mine_Y, True, 3, True)

def go_to_bank():
    MoveXY(bank_X, bank_Y, True, 1, True)

def store_ores():


while not Dead():
    go_to_bank()
    store_ores()
    go_to_mine()
    mine()