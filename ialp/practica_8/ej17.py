from queue import Queue
import random
def n_pacientes_urgentes(c:Queue[(int,str,str)])->int:
    pacientes:Queue[tuple[int,str,str]] = Queue()
    res:int = 0
    while not c.empty():
        paciente: tuple[int,str,str] = c.get()
        pacientes.put(paciente)
        if paciente[0] < 4:
            res += 1
    while not pacientes.empty():
        c.put(pacientes.get())
    return res


