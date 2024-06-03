from queue import LifoQueue

def esta_bien_balanceada(s:str)->bool:
    parentesis:int=0
    balanceada:bool=True
    for char in s:
        if char == "(":
            parentesis += 1
        elif char == ")":
            parentesis -= 1
        if parentesis < 0:
            balanceada = False
    balanceada &= parentesis == 0 
    return balanceada
        
