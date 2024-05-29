def agregar_frase_al_principio(nombre_archivo:str, frase:str):
    file = open(nombre_archivo, "r")
    lines:list[str] = file.readlines()
    file.close()
    file = open(nombre_archivo, "w")
    file.write(frase+"\n")
    file.writelines(lines)
    file.close()