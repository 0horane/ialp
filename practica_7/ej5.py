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
matrix:list[list[int]] = np.random.randint(1,5,(3, 3))


def mult(a:list[list[int]], b:list[list[int]]):
    rmat:list[list[int]] = []
    for y in 