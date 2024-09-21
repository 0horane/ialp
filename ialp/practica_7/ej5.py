import ej1

def pertenece_a_cada_uno_version_1(s:list[list[int]], e:int, res:list[bool] ):
    while len(res)!=0:
        res.pop()
    for x in s:
        res.append(ej1.pertenece(x,e))

# la version 2 cambia en que no permite que despues al final de la lista tenga items cualqueiras. en el 1 si era posible. la implementacion del 1 siempre es verdad si la 2 es verdad, porque si n==m entonces n>=m.  1 fuerza a 2


def es_matriz(s:list[list[int]]):
    flag:bool=true 
    flag &= len(s) > 0
    for item in s:
        flag &= len(item) > 0
    return flag



def filas_ordenadas(s:list[list[int]], res:list[bool] ):
    while len(res)!=0:
        res.pop()
    for x in s:
        res.append(ej1.ordenados(x))

import numpy as np


# require: potencia>=2, tamanio>=1
def matrizAzarTamanioAPotencia(tamanio:int, potencia:int) -> list[list[int]]:
    matrix:list[list[int]] = np.random.randint(2,3,(tamanio, tamanio))

    # evita tener que hacer una copia profunda
    # .todo esto seria mas facil si se pudiera hacer slicing 
    matrixmult:list[list[int]] = mult(matrix, matrix) 
    
    for x in range(potencia-2):
        matrixmult = mult(matrixmult, matrix)
    return matrixmult

def mult(a:list[list[int]], b:list[list[int]]) -> list[list[int]]:
    rmat:list[list[int]] = [] # = np.zeros((len(a), len(b[0])))
    for y in range (0,len(a)):
        rmat.append([0]*len(b[0]))

    #xa = yb

    for xb in range(0,len(b[0])):
        for ya in range(0,len(a)):
            for xayb in range(0,len(b)):
                rmat[ya][xb] += a[ya][xayb] * b[xayb][xb]
    return rmat
    
