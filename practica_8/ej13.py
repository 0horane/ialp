from queue import Queue
import random
def generar_nros_al_azar(cantidad:int, desde:int, hasta:int)->Queue[int]:
    queue = Queue()
    for x in range(cantidad):
        queue.put(random.randint(desde, hasta))
    return queue

