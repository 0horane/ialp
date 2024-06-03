from typing import TypeVar
from ej12 import split

# def inn[T](x:T, ls:list[T]):


T = TypeVar('T')
def inn(i:T,l: list[T]) -> bool: 
    for elem in l:
        if i == elem:
            return True
    return False

def agrupar_por_longitud(filename:str)->dict:
    res:dict[int,int] = dict()
    file = open(filename, 'r', encoding='utf8')
    for line in file.readlines():
        palabras:list[str] = split(line, " ")
        if inn(len(palabras), res.keys()):
            res[len(palabras)] += 1
        else:
            res[len(palabras)] = 1
    return res


