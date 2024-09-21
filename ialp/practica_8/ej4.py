def agregar_frase_al_final(nombre_archivo:str, frase:str):
    file = open(nombre_archivo, "a")
    file.write(frase+"\n")
    file.close()
    

    