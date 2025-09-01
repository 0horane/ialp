import numpy as np

def esCuadrada(A):
    if len(A) == 0:
        return True
    return len(A) == len(A[0])


#supongo que se puede usar copy, si no lo implemento despues a mano
def triangSup(A):
    res = A.copy()
    for i,row in enumerate(A):
        for j,col in enumerate(row):
            if i >= j:
                res[i][j] = 0
    return res

def triangInf(A):
    res = A.copy()
    for i,row in enumerate(A):
        for j,col in enumerate(row):
            if i <= j:
                res[i][j] = 0
    return res

def diagonal(A):
    res = A.copy()
    for i,row in enumerate(A):
        for j,col in enumerate(row):
            if i != j:
                res[i][j] = 0
    return res

def traza(mat):
    tr = 0
    for i, row in enumerate(mat):
        for j, elem in enumerate(row):
            if i == j:
                tr += elem
    return tr

def transpuesta(A):
    if len(A) == 0:
        return []
    
    res = [[] for col in A[0]]
    for i, row in enumerate(A):
        for j, elem in enumerate(row):
            res[j].append(elem)
    return np.array(res)

def esSimetrica(A):
    if not esCuadrada(A):
        return False

    for i, row in enumerate(A):
        for j, elem in enumerate(row):
            if A[i][j] != A[j][i]:
                return False
    return True


def calcularAx(A,x):
    res = []
    for row in A:
        res.append(0)
        for a1, x1 in zip(row,x):
            res[-1] += a1 * x1
            
    return np.array(res)

# asignacion de indice de np array no se comporta como el de python!
def intercambiarFilas(A,i,j):
    filai = A[i].copy()
    A[i] = A[j]
    A[j] = filai


def sumar_fila_multiplo(A,i,j,s):
    A[i] = A[i] + A[j] * s
    
# sum de py permitido?? probablemente no?
def sumL(A):
    res = 0
    for elem in A:
        res += elem 
    return res

def esDiagonalmenteDominante(A):
    if len(A) == 0:
        return True # supongo?
    
    for i,row in enumerate(A[:len(A[0])]):
        if not 2*A[i][i] - sumL(row) > 0:
            return False
    return True

def matrizCirculante(v):
    v = v.copy()
    res = []
    for i in range(len(v)):
        res.append(v.copy())
        v.insert(0,v.pop())
    return np.array(res)

    
def matrizVandermonde(v):
    res = []
    for i in range(len(v)):
        row = []
        for elem in v:
            row.append(elem**i)
        res.append(row)
    return np.array(res)

# TODO graficar, no estoy en notebook
def numeroAureo(n):
    mat = np.array([[1,1],[1,0]])
    seed = np.array([1,0])
    for i in range(n):
        seed = calcularAx(mat, seed)

    return seed[0]/seed[1]


# seria mas prolijo llenar la matriz primero y indexar
def matrizFiboncacci(n):
    res = []
    mat = np.array([[1,1],[1,0]])
    seed = np.array([1,0])
    for i in range(n):
        res.append([])
        for row in res:
            row.append(seed[1])
        seed = calcularAx(mat, seed)
    for i in range(1,n):
        for row in res[i:]:
            row.append(seed[1])
        seed = calcularAx(mat, seed)
    return np.array(res)

# also not ideal, bleh
def matrizHilbert(n):
    res = []
    for i in range(n):
        res.append([])
        for row in res:
            row.append(1/(i+1))
    for i in range(1,n):
        for row in res[i:]:
            row.append(1/(i+n))
    return np.array(res)

#TODO 17 y 18


def tests():
    print("Test 1")
    ones2_3 = np.ones(6).reshape(2,3)
    ones3_3 = np.ones(9).reshape(3,3)
    arange2_3 = np.arange(6).reshape(2,3)
    assert not esCuadrada(ones2_3)
    assert esCuadrada(ones3_3)
    print("Test 2")
    print(triangSup(ones3_3))
    print(triangSup(arange2_3))
    print("Test 3")
    print(triangInf(ones3_3))
    print(triangInf(arange2_3))
    print("Test 4: Diag")
    print(diagonal(ones3_3))
    print("Test 5: Traza")
    print(traza(ones3_3))
    print(traza(arange2_3))
    print("Test 6: transpuesta")
    print(transpuesta(ones3_3))
    print(transpuesta(arange2_3))
    print("Test 7: sim")
    print(esSimetrica(ones3_3))
    print(esSimetrica(arange2_3))
    print("Test 8: Ax")
    print(calcularAx(np.eye(3), [1,2,3]))
    print(calcularAx(np.eye(3)*2, [1,2,3]))
    print(calcularAx(np.array([[0,1],[1,1]]), [1,2]))
    print("Test 9: int")
    print(arange2_3)
    intercambiarFilas(arange2_3,0,1)
    print(arange2_3)
    intercambiarFilas(arange2_3,0,1)

    print("Test 10: fiula multiplo")
    print(arange2_3, 0,1,2)
    sumar_fila_multiplo(arange2_3,0,1,2)
    print(arange2_3)
    sumar_fila_multiplo(arange2_3,0,1,-2)
    
    print("Test 11: diagdom")
    ddm = np.eye(2)
    print(ddm,esDiagonalmenteDominante(ddm))
    ddm[0][1]+=0.5
    print(ddm,esDiagonalmenteDominante(ddm))
    ddm[0][1]+=0.5
    print(ddm,esDiagonalmenteDominante(ddm))
    print(arange2_3,esDiagonalmenteDominante(arange2_3))
    print(transpuesta(arange2_3),esDiagonalmenteDominante(transpuesta(arange2_3)))
    
    print("Test 12: Circula ")
    print(matrizCirculante([1,2,3,4,5]))
    
    print("Test 13: vandermonde")
    print(matrizVandermonde([1,2,3,4,5]))

    print("Test 14: aureo")
    print(numeroAureo(20))

    print("Test 15: matfib")
    print(matrizFiboncacci(6))
    
    print("Test 16: mathil")
    print(matrizHilbert(5))


tests()