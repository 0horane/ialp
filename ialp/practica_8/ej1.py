def contar_lineas(nombreArchivo:str)->int:
    file = open(nombreArchivo, 'r')
    return len(file.readlines())

def existe_palabra(palabra:str, nombreArchivo:str)-> bool:
    file = open(nombreArchivo, 'r')
    palabraNow:str = ""
    filedata=file.read()
    file.close()
    for i in range(len(filedata)):
        char:str = filedata[i]
        palabraNow += char
        if not palabraNow == nchar(len(palabraNow), palabra):
            palabraNow = ""
        elif palabraNow == palabra:
            return True
    return False
    
def cantidad_apariciones(nombreArchivo:str, palabra:str) -> int:
    pass
    
# imnplementacion manual substr sin slicing
def nchar(n:int, x:str, start=0)->str:
    result:str=""
    for i in range(n): #### enumerate te extraño 
        result += x[start+i]
    return result