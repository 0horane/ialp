type Texto = [Char]
type Nombre = Texto
type Telefono = Texto
type Contacto = (Nombre, Telefono)
type ContactosTel = [Contacto]

enLosContactos :: Nombre -> ContactosTel -> Bool
enLosContactos _ [] = False
enLosContactos persona ((contacto, _):contactos) 
    | persona == contacto = True
    | otherwise = enLosContactos persona contactos

agregarContacto :: Contacto -> ContactosTel -> ContactosTel
agregarContacto persona contactos
    | enLosContactos (fst persona) contactos = contactos
    | otherwise = persona:contactos

eliminarContacto :: Nombre -> ContactosTel -> ContactosTel
eliminarContacto _ [] = []
eliminarContacto persona (contacto:contactos)
    | persona == fst contacto = contactos
    | otherwise = contacto:eliminarContacto persona contactos



