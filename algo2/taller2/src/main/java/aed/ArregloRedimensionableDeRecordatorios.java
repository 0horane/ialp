package aed;

class ArregloRedimensionableDeRecordatorios {
    private Recordatorio[] recordatorios;

    /*private void copiar(Integer desdeFuente, Integer cantidad, ArregloRedimensionableDeRecordatorios fuente, Integer aPartirDe){
        for (Integer i = 0;i<cantidad;i++){
            recordatorios[aPartirDe+i] = fuente.obtener(desdeFuente+i);
        }
    }*/

    public ArregloRedimensionableDeRecordatorios() {
        recordatorios = new Recordatorio[0];
    }

    public int longitud() {
        return recordatorios.length;
    }

    public void agregarAtras(Recordatorio i) { // se podria guardar en atributo longitud y expandir solo cuando es necesario, y expandir por mas que uno cuando se expande (duplicar longitud).
        Recordatorio[] nuevoRecordatorios = new Recordatorio[recordatorios.length+1];
        for (int ii = 0; ii < recordatorios.length;ii++){
            nuevoRecordatorios[ii] = recordatorios[ii]; // .clone(); no es necesaria, si la lista vieja se borra igua;
        }
        nuevoRecordatorios[recordatorios.length] = i;
        recordatorios = nuevoRecordatorios;
    }

    public Recordatorio obtener(int i) {
        return recordatorios[i];
    }

    public void quitarAtras() { // se podria guardar en atributo longitud y no reducir tamaño. En ese caso tmabien habría que hacer indice[longitud]=null para asegrarse que el GC haga su trabajo
        Recordatorio[] nuevoRecordatorios = new Recordatorio[recordatorios.length-1];
        for (int ii = 0; ii < recordatorios.length-1;ii++){
            nuevoRecordatorios[ii] = recordatorios[ii]; // .clone(); no es necesaria, si la lista vieja se borra igua;
        }
        recordatorios = nuevoRecordatorios;
    }

    public void modificarPosicion(int indice, Recordatorio valor) {
        recordatorios[indice] = valor;
    }

    public ArregloRedimensionableDeRecordatorios(ArregloRedimensionableDeRecordatorios vector) {
        recordatorios = new Recordatorio[vector.longitud()];
        for (int i=0;i<vector.longitud();i++){
            //Supongo que no tenemos permitido usar .clone() asi que lo implemente yo en Recordatorio.java
            //this.agregarAtras(vector.obtener(i).clone()); // no funca si creo el vector primero con longitud > 0
            recordatorios[i]=vector.obtener(i).clone();
        }
    }
    // se realiza un new para el arreglo, y luego un new por cada recordatorio. 
    // cada recordatorio también tiene un new para clonar la fecha. Entonces se reserva memoria 
    // 1+2*n veces donde n es la longitud de el arreglo original

    public ArregloRedimensionableDeRecordatorios copiar() {
        return new ArregloRedimensionableDeRecordatorios(this);
    } // se aloca 1 vez mas que el anterior.

}
