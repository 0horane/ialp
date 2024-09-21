from queue import Queue

def cantidad_elementos(p:Queue[int])->int:
    store:Queue[int] = Queue()
    res:int=0
    while not p.empty():
        res+=1
        store.put(p.get())
    while not store.empty():
        p.put(store.get())
    return res
    
    # es identico