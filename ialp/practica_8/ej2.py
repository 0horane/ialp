def clonar_sin_comentarios(nombre_archivo:int):
    file = open(nombre_archivo, 'r')
    file2 = open(f"clonado_{nombre_archivo}", 'w')
    for line in file.readlines():
         for char in line:
             if char == "\t" or char == " ":
                 pass
             elif char == "#":
                 break
             else: # siempre se cumple pq toda linea termina en \n
                 file2.write(line)
                 break
    file.close()
    file2.close()
                 
    