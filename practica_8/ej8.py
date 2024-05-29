from queue import LifoQueue
from random import randint
def generar_nros_al_azar(cantidad:int, desde:int,hasta:int) -> LifoQueue[int]:
    res:LifoQueue[int] = LifoQueue()
    for x in range(cantidad):
        res.put(randint(desde, hasta))
    return res
        
