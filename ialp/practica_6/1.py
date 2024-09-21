import math


def imprimir_hola_mundo():
    print("¡Hola Mundo!")


def imprimir_un_verso():
    print("Hola Mundo \n Hola Mundo \n Hola Mundo \n Hola Mundo \n ")

def raizDe2() -> float:
    return math.floor(math.sqrt(2),4)
        
def factorial_de_dos() -> float:
    return 2

def perimetro() -> float:
    return 2*math.pi    

def imprimir_saludo(nombre: str):
    print("Hola "+nombre)

def raiz_cuadrada_de(numero: float) -> float:
    return math.sqrt(numero)

def fahrenheit_a_celcius(temp_far: float) -> float:
    return (temp_far-32)*5/9

def imprimir_dos_veces(estribillo: str):
    print(estribillo*2)

def es_multiplo_de(n: int, m: int) -> bool:
    return n % m == 0

def es_par(numero:int)->bool:
    return numero % 2 ==0

def alguno_es_0(numero1:float, numero2:float) -> bool:
    return numero1 == 0 or numero2 == 0

def ambos_son_0(numero1:float, numero2:float) -> bool:
    return numero1 == 0 and numero2 == 0

def es_nombre_largo(nombre:str) -> bool:
    return 3 <= len(nombre) and len(nombre) <= 8

def es_bisiesto(año:int)->bool:
    return año % 400 == 0 or (año % 4 == 0 and año % 100 != 0)

def peso_pino(altMetros:float)->float:
    return 3*100 * min(3, altMetros) + max(0,altMetros-3)*2*100

def es_peso_util(peso: float) -> bool:
    return 400 <= peso <= 1000

def sirve_pino2(peso:float)->bool:
    return 400 <= (3*100 * min(3, altMetros) + max(0,altMetros-3)*2*100) <= 1000


def sirve_pino(altura:float)->bool:
    return es_peso_util(peso_pino(altura))



def devolver_el_doble_si_es_par(numero:int)->int:
    if numero % 2 == 0:
        return numero*2
    else:
        return numero
    
def devolver_el_doble_si_es_par2(numero:int)->int:
    return (((numero+1) % 2)+1)*numero
        

def devolver_valor_si_es_par_sino_el_que_sigue(numero: int) -> int:
    if numero % 2 == 0:
        return numero*2
    else:
        return numero+1


def devolver_valor_si_es_par_sino_el_que_sigue2(numero: int) -> int:
    if numero % 2 == 0:
        return numero*2
    return numero+1

def devolver_valor_si_es_par_sino_el_que_sigue2(numero: int) -> int:
    if numero % 2 == 0:
        return numero*2
    if numero % 2 == 1:
        return numero+1
    

"""
problema devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(in numero:Z):Z {
    requiere:{true}
    asegura{res =numero*3 <-> existe un k ∈ Z tal que numero = 9 × k}
    asegura{res =numero*2 <-> existe un k ∈ Z tal que numero = 3 × k y no existe un l ∈ Z tal que numero = 9 × k}
    asegura{res ∈ {numero, numero*2,  numero*3}}
}



"""
def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero:int)->int:
    if numero % 9 == 0:
        return numero*3
    elif numero % 3 == 0:
        return numero*2
    else:
        return numero*3
    
def lindo_nombre(nombre: str):
    if len(nombre)>=5:
        print ("Tu nombre tiene muchas letras") 
    else :
        print ("Tu nombre tiene menos de 5 caractere") 

def elRango(numero:float):
    if numero<=5:
        print("Menor a 5")
    elif numero>20:
        print("Mayor a 20")
    elif 10 >= numero >= 20:
        print("Entre 10 y 20")

def detector_pala(sexo:str, edad:int):
    if edad<18 or edad >= 65 or (edad >=60 and sexo == "F"):
        print("Andá de vacaciones")
    else:
        print("Te toca trabajar")

def uno_a_diez():
    num=1
    while num<=10:
        print (num)
        num+=1

def pares_diez_a_cuarenta():
    num = 10
    while num<=40:
        print (num)
        num+=2


def eco10():
    num = 0
    while num<10:
        print ("eco")

def despegue(inicio:int):
    while inicio>=1:
        print (inicio)
        inicio-=1
    print("Despegue")

def viaje_de_tiempo(partida:int, llegada:int):
    while partida!=llegada:
        partida-=1
        print("Viajó un año al pasado, estamos en el año:",partida)

def viaje_a_aristoteles(partida:int, ):
    while abs(partida - (-384)) >=10:
        if 0 < partida <= 20:
            partida -= 1 # no hubo un año 0
        partida-=20
        print("Viajó un año al pasado, estamos en el año:",partida)



def uno_a_diez_range():
    for num in range(1,11):
        print (num)

def pares_diez_a_cuarenta_range():
    for num in range(10,41,2):
        print (num)


def eco10_range():
    for x in range(0,10):
        print ("eco")

def despegue_range(inicio:int):
    for inicio in range(inicio, 0, -1):
        print (inicio)
    print("Despegue")

def viaje_de_tiempo_range(partida:int, llegada:int):
    for partida in range(partida-1, llegada-1, -1):
        print("Viajó un año al pasado, estamos en el año:",partida)

def viaje_a_aristoteles_range(partida:int ):
    for partida in range(partida, -384-11, -20 ):
        if partida <=0:
            print("Viajó un año al pasado, estamos en el año:",partida-1)
        else:
            print("Viajó un año al pasado, estamos en el año:",partida)
            

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g
g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

"""
problema rt(in x:Z, in g:Z):Z {
    requiere:{true}
    asegura{res = (x+g+1)}
}
problema rt(in x:Z, inout g:Z):Z {
    requiere:{true}
    asegura{res = (x+g+1)}
    asegura{g = g+1}
}
"""