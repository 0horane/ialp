from queue import Queue

def mayor_elemento(p:Queue[int])->int:
    store:Queue[int] = Queue()
    res:int=0
    while not p.empty():
        item:int = p.get()
        if item>res:
            res = item
        store.put(item)
    while not store.empty():
        p.put(store.get())
    return res
    
## Tambien se puede hacer usando la funcion del ejercicio anterior 
## y ir volviendo a poner los elementos en la misma cola