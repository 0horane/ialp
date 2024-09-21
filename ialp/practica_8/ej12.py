from queue import LifoQueue
def evaluar_expresion(s:str)->float:
    stack: LifoQueue[float] = LifoQueue()
    for exp in split(s, " "):
        if   exp == "+": stack.put(stack.get() + stack.get())
        elif exp == "-": stack.put(-stack.get() + stack.get())
        elif exp == "*": stack.put(stack.get() * stack.get())
        elif exp == "/": stack.put(1/stack.get() * stack.get())
        else: stack.put(float(exp))
    return stack.get()


# implementacion manual de .split que me imaginoque no podemos usar
def split(test:str, char:str)->list[str]:
    test += char
    sofar:str = ""
    res:list[str] = []
    for item in test:
        if item == char:
            if sofar != "":
                res.append(sofar)
            sofar = ""
        else:
            sofar += item
    return res
