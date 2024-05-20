import math
def pertenece(s:list[int],e:int)->bool:
    for item in s:
        if item == e:
            return True
    return False

def divide_a_todos(s:list[int],e:int)->bool:
    for item in s:
        if item % e !=0:
            return False
    return True

def suma_total(s:list[int]) -> int:
    suma:int =0
    for item in s:
        suma+=item
    return suma

def ordenados(s:list[int])->bool:
    for x in range(0,len(s)-1):
        if s[x] >= s[x+1]:
            return False
    return True

def algunaMasQue7Letras(s:list[str])->bool:
    for item in s:
        if len(item)>7:
            return True
    return False

def palindromo(s:str)->bool:
    for x in range(math.ceil(len(s)/2)):
        if s[x] != s[len(s)-1-x]:
            return False
    return True

def palindromo2(s:str)->bool:
    for x in range(len(s)):
        if s[x] != s[::-1][x]:
            return False
    return True

# los profes quieren que no pongamos returns en el medio.
def fortaleza(contra:str)->str:
    if len(contra)<5:
        return "ROJO"
    if len(contra)<=8:
        return "AMARILLO"  
    tieneminuscula:bool = False
    tienemayuscula:bool = False
    tienenumero:bool = False
    letra:int=0
    while letra < len(contra) and not (tieneminuscula and tienemayuscula and numero):
        if 'a' <= contra[letra] and contra[letra] <= 'z':
            tieneminuscula = True
        elif 'A' <= contra[letra] and contra[letra] <= 'Z':
            tienemayuscula = True
        elif '0' <= contra[letra] and contra[letra] <= '9':
            tienenumero = True
        letra+=1
    if (tieneminuscula and tienemayuscula and numero):
        return "VERDE"
    else:
        return "AMARILLO"


def saldo_actual(x:tuple[str,int])->int:
    salario:int=0
    for tipo,cant in x:
        if tipo=="I":
            salario+=cant
        elif tipo=="R":
            salario-=cant
    return salario

def vocalesDistintas(s:str)->bool:
    voccontar:list[int]=[0,0,0,0,0]
    vocales:str="aeiou"
    for char in s:
        if char in vocales:
            voccontar[vocales.index(char)]=1
    return suma_total(voccontar)>=3
