def nulificarPar(x:list[int]):
    i:int=0
    while i<len(x):
        if i % 2 == 0:
            x[i]=0
        i+=1

# no nos permite usar copy ni slicing
def nulificarParCopy(x:list[int])->list[int]:
    i:int=0
    res:list[int]=[]
    while i<len(x):
        if i % 2 == 0:
            res.append(0)
        else:
            res.append(x[i])
        i+=1
    return res

def remVocales(s:str)->str:
    res:str=""
    vocales:str="aeiou"
    for char in s:
        if not char in vocales:
            res+=char
    return res
        

    
def reemplaza_vocales(s:str)->str:
    res:str=""
    vocales:str="aeiou"
    for char in s:
        if char in vocales:
            res+="_"
        else: 
            res+=char
    return res

def dar_vuelta_str(s:str)->str:
    res = ""
    for x in range(len(s)-1, -1, -1):
        res += s[x]
    return res

def eliminar_repetidos(s:str)->str:
    res = ""
    for char in s:
        if not char in res:
            res += s[x]
    return res