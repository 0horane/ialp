def invertir_lineas(nombre_archivo:str):
    # supongo que no se puede usar .reverse o slicing.
    file = open(nombre_archivo, 'r')
    out = open("reverso.txt", 'w')
    lines: list[str] = file.readlines()
    for i in range(len(lines)-1,-1,-1):
        out.write(lines[i])
    file.close()
    out.close()
            