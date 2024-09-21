from ej12 import split

def la_palabra_mas_frecuente(nombre_archivo:str)->str:
    res:dict = dict()
    file = open(nombre_archivo, 'r', encoding='utf8')
    for line in split(file.read(), "\n"):
        for word in split(line, " "):
            if word in res.keys():
                res[word] += 1
            else:
                res[word] = 1
    maxpalabra:str
    maxfrecuencia:int = 0
    for key,val in res.items():
        if val > maxfrecuencia:
            maxfrecuencia = val
            maxpalabra = key
    print(res)
    return maxpalabra

