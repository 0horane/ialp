import ej1

def aprobado(notas:list[int])->int:
    res:int=1
    promedio:float = ej1.suma_total(notas)/len(notas)
    if promedio<7:
        res=2
    if promedio <4 or min(notas)<4:
        res=3
    return res
