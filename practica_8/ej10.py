from queue import LifoQueue

def mayor_elemento(p:LifoQueue[int])->int:
    store:LifoQueue[int] = LifoQueue()
    res:int=0
    while not p.empty():
        item:int = p.get()
        if item>res:
            res = item
        store.put(item)
    while not store.empty():
        p.put(store.get())
    return res
    
        