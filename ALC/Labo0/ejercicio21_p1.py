import numpy as np

def traza(mat):
    tr = 0
    for i, row in enumerate(mat):
        for j, elem in enumerate(row):
            if i == j:
                tr += elem
    return tr

def sumaMat(mat):
    su = 0
    for row in mat:
        for elem in row:
            su += elem
    return su

def posMayorANeg(mat):
    return sumaMat(mat) > 0



def test():
    tm = np.arange(16).reshape(4,4)
    print(tm)
    print(traza(tm))
    print(sumaMat(tm), 15*16/2)
    a_matrix = np.array([[ 0,  -1,  5,  0],
                    [ 0,  0,  0,  0],
                    [ 0,  0, 0, 0],
                    [0, 0, 0, 0]])
    print(posMayorANeg(a_matrix))

test()