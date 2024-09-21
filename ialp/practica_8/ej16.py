from queue import Queue
import random
def armar_secuencia_de_bingo()->Queue[int]:
    listanumeros:list[int] = [] # mas simplemente se deberia hacer list(range(100)) o un [x for x in range(100)]
    for x in range(100):
        listanumeros.append(x)
    cola:Queue[int] = Queue()
    while len(listanumeros)>0:
        cola.put(listanumeros.pop(random.randint(0,len(listanumeros)-1)))
    return cola

def jugar_carton_de_bingo(carton:list[int], bolillero:Queue[int]) -> int:
    return maxmanual(aplicarindice(carton, bolillero))

# preguntar por pop en medio de lista
# preguntar por for in rango



# esto es una terrible solucion que no utiliza como se debe a la cola. rehacer bien despues
def indice(x:int, lista:Queue[int]):
    i:int=0
    res:int
    cola2:Queue[int] = Queue()
    while not lista.empty():
        i += 1
        num:int = lista.get()
        cola2.put(num)
        if num == x:
            res = i
    while not cola2.empty():
        lista.put(cola2.get())
    return res
    

def aplicarindice(nros:list[int], indices:Queue[int])->list[int]:
    res:list[int] = []
    for item in nros:
        res.append(indice(item, indices))
    return res

def maxmanual(nums:list[int]):
    maxa:int = nums[0]
    for item in nums:
        if item > maxa:
            maxa = item
    return maxa