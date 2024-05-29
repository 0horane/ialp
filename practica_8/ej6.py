def listar_palabras_de_archivo(nombre_archivo:str)->list[str]:
    file = open(nombre_archivo, "br")
    palabras: list[str] = []
    palabra:str = "" # preguntar por with
    for byt in file.read(): 
        if isValidChar(chr(byt)):
            palabra += chr(byt)
        else:
            if len(palabra) >= 5:
                palabras.append(palabra)
            palabra = ""
    if len(palabra) >= 5:
        palabras.append(palabra)
    file.close()
    return palabras

def isValidChar(char:str)->bool:
    return "0" <= char <= "9" or "A" <= char <= "Z" or "a" <= char <= "z" or char == " " or char == "_"
           
