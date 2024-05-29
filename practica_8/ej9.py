from queue import LifoQueue

def cantidad_elementos(p:LifoQueue[int])->int:
    store:LifoQueue[int] = LifoQueue()
    res:int=0
    while not p.empty():
        res+=1
        store.put(p.get())
    while not store.empty():
        p.put(store.get())
    return res
    
        