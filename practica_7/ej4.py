def generarEstudiantes()->list[str]:
    estudiantes:list[str]=[]
    while len(estudiantes)==0 or estudiantes[-1]!="listo":
        estudiantes.append(input())
    estudiantes.pop()
    return estudiantes

def historialMonedero()->list[str]:
    cambios:list[tuple[str, int]]=[]
    accion:str=input()
        estudiantes.append(input())
    estudiantes.pop()
    return estudiantes