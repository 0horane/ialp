import random

def generarEstudiantes()->list[str]:
    estudiantes:list[str]=[]
    while len(estudiantes)==0 or estudiantes[-1]!="listo":
        estudiantes.append(input())
    estudiantes.pop()
    return estudiantes

def historialMonedero()->list[str]:
    cambios:list[tuple[str, int]]=[]
    accion:str=input("Que accion tomar? (C/D/X)")
    while accion !="X":
        cambios.append((accion,input("Que monto?")))
        accion=input("Que accion tomar? (C/D/X)")
    return cambios

def sieteYMedio()-> list[int]:
    sumaacumulada:float = 0
    historial:list[int] = []
    while sumaacumulada < 7.6:
        chocie:str = input("Tu puntaje actual es " + str(sumaacumulada) + ". continuar? (Y/n)")
        if chocie == "n":
            break
        carta:int  = random.randint(1,13)
        while carta == 8 or carta == 9:
            carta  = random.randint(1,13)
        print("La carta es un",carta)
        historial.append(carta)
        valor:float
        if carta >= 10:
            valor = 0.5
        else:
            valor=carta
        sumaacumulada+=valor
        print("El puntaje total es",sumaacumulada)
    
    if sumaacumulada > 7.6:
        print ("Perdiste")
    
    return historial