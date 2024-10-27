package aed;

import java.util.*;

public class ListaEnlazada<T> implements Secuencia<T> {
    // Completar atributos privados
    private class Nodo {
        public Nodo(T dato){
            this.dato = dato; 
        }

        public Nodo siguNodo;
        public Nodo prevNodo;
        public T dato;
    }
    private Nodo primerNodo;
    private Nodo ultimoNodo;

    public ListaEnlazada() {
                // :D
    }

    public int longitud() {
        Nodo nodoActual = primerNodo;
        int len = 0;
        while (nodoActual != null){
            len++;
            nodoActual = nodoActual.siguNodo;
        }
        return len;
    }

    public void agregarAdelante(T elem) {
        Nodo nuevoPrimerNodo = new Nodo(elem);
        if (primerNodo == null) {
            primerNodo = nuevoPrimerNodo;
            ultimoNodo = nuevoPrimerNodo;
            return;
        }
        primerNodo.prevNodo = nuevoPrimerNodo;
        nuevoPrimerNodo.siguNodo = primerNodo;
        primerNodo = nuevoPrimerNodo;
    }

    public void agregarAtras(T elem) {
        Nodo nuevoUltimoNodo = new Nodo(elem);
        if (primerNodo == null) {
            primerNodo = nuevoUltimoNodo;
            ultimoNodo = nuevoUltimoNodo;
            return;
        }
        ultimoNodo.siguNodo = nuevoUltimoNodo;
        nuevoUltimoNodo.prevNodo = ultimoNodo;
        ultimoNodo = nuevoUltimoNodo;


    }

    private Nodo nodoN(int i) {
        int recorrido = 0;
        Nodo nodoActual = primerNodo;
        while (nodoActual != null){
            if (recorrido == i){
                return nodoActual;
            }
            recorrido++;
            nodoActual = nodoActual.siguNodo;
        }

        return null;
    }

    public T obtener(int i) {
        Nodo res = nodoN(i);
        if (res==null){
            return null;
        } else {
            return res.dato;
        }
    }

    public void eliminar(int i) {
        
        Nodo nodoActual = nodoN(i);
        if (nodoActual.prevNodo != null){
            nodoActual.prevNodo.siguNodo = nodoActual.siguNodo;
        }
        if (nodoActual.siguNodo != null){
            nodoActual.siguNodo.prevNodo = nodoActual.prevNodo;            
        }
        if (nodoActual == primerNodo){
            primerNodo = primerNodo.siguNodo;
        }
        if (nodoActual == ultimoNodo){
            ultimoNodo = nodoActual.prevNodo;
        }

    }

    public void modificarPosicion(int indice, T elem) {
        nodoN(indice).dato = elem;
    }

    //copia por referencia cada elemento (si T no es primitivo), aunque los nodos son diferentes. supongo que es lo pedido, es ambiguo. 
    public ListaEnlazada(ListaEnlazada<T> lista) {
        for (int i=0;i<lista.longitud();i++){
            agregarAtras(lista.obtener(i));
        }
    }
    
    @Override
    public String toString() {
        String res = "[";
        int longitud = longitud();
        for (int i=0;i<longitud;i++){
            res += (obtener(i).toString());
            if (i != longitud-1){
                res += ", ";
            }
        }
        return res + "]";
    }
    

    private class ListaIterador implements Iterador<T> {
    	private Nodo nodoActual;
        private boolean isAtStart;

        public ListaIterador(ListaEnlazada<T> lista){
            nodoActual = lista.primerNodo;
            isAtStart = true; 
        }

        public boolean haySiguiente() {
            if (isAtStart){
                return nodoActual != null;
            }
	        return nodoActual.siguNodo != null;
        }
        
        public boolean hayAnterior() {
            return !isAtStart;
        }

        public T siguiente() {
            if (isAtStart){
                isAtStart = false;
                return nodoActual.dato;
            }
            nodoActual = nodoActual.siguNodo;
            return nodoActual.dato;
        }
        

        public T anterior() {
            T dato = nodoActual.dato;
            if (nodoActual.prevNodo == null){
                isAtStart = true;
            } else {
                nodoActual = nodoActual.prevNodo;
            }
            
            return dato;
        }
    }

    public Iterador<T> iterador() {
	    return new ListaIterador(this);
    }

}
