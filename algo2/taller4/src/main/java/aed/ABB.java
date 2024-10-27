package aed;

import java.util.*;

// Todos los tipos de datos "Comparables" tienen el método compareTo()
// elem1.compareTo(elem2) devuelve un entero. Si es mayor a 0, entonces elem1 > elem2
public class ABB<T extends Comparable<T>> implements Conjunto<T> {
    // Agregar atributos privados del Conjunto
    Nodo root;

    private class Nodo {
        Nodo right;
        Nodo left;
        Nodo parent;
        T data;
        
        public Nodo(T data, Nodo parent){
            this.data = data;
            this.parent = parent;
        }
    }

    public ABB() {
        //root = null;
    }

    public int cardinal() {
        return cardinal(root);
    }

    private int cardinal(Nodo nodo){
        if (nodo == null){
            return 0;
        } else {
            return cardinal(nodo.right) + cardinal(nodo.left) + 1;
        }
    }

    private Nodo nodoMinimo(){
        Nodo min = root;
        if (min == null) return min;
        while (min.left != null){
            min = min.left;
        }
        return min;
    }

    public T minimo(){ //error si root==null
        return nodoMinimo().data;
    }

    public T maximo(){ //error si root==null
        Nodo min = root;
        while (min.right != null){
            min = min.right;
        }
        return min.data;
    }

    private Nodo findNode(T val){
        Nodo cnode = root;
        Nodo pnode = root;

        while (true) {
            if (cnode == null){
                break;
            }
            if (val.equals(cnode.data)){
                return cnode;
            } else if (val.compareTo(cnode.data) > 0){
                pnode = cnode;
                cnode = cnode.right;
            } else if (val.compareTo(cnode.data) < 0){
                pnode = cnode;
                cnode = cnode.left;
            }

        }
        return pnode; // null iff pnode == root
    }


    public void insertar(T elem){
        Nodo parent = findNode(elem);
        Nodo oldchild;
        Nodo newNode = new Nodo(elem, parent);
        if (parent == null){
            root = newNode;
            return;
        }
        if (parent.data.equals(elem)) return;

        if (elem.compareTo(parent.data) > 0){
            oldchild = parent.right;
            parent.right = newNode;
        } else { // elem < parent.data, == is impossible 
            oldchild = parent.left;
            parent.left = newNode;
        }
        if (oldchild == null ){

        } else {
            oldchild.parent = newNode;
            if (elem.compareTo(oldchild.data) > 0){
                newNode.left = oldchild;
            } else { //elem < parent.data, == is impossible
                newNode.right = oldchild;
            }
        }
    }

    public boolean pertenece(T elem){
        Nodo resn = findNode(elem);
        if (resn == null) return false;
        return resn.data.equals(elem);
    }

    protected Nodo siguienteNodo(Nodo cnode){
        if (cnode == null) return null;
        if (cnode.right != null){
            cnode = cnode.right;
            while ( cnode.left != null){ //cnode.right != null ||
                cnode = cnode.left ; //!= null ? cnode.left : cnode.right
            }
            return cnode;
        } else {
            Nodo lastNode;
            do {
                if (cnode.parent == null) return null;
                lastNode = cnode;
                cnode = cnode.parent;
            } while (cnode.right == lastNode);
            
            return cnode;
        }
        
    }

    public void eliminar(T elem){
        Nodo elimNode = findNode(elem);
        if (elimNode == null ) return;

        eliminarNodo(elimNode);
    }

    private void eliminarNodo(Nodo elimNode){
        if (elimNode.right == null && elimNode.left == null){
            if (elimNode.parent == null) 
                root = null;
            else if (elimNode.parent.right == elimNode) 
               elimNode.parent.right = null;
            else if (elimNode.parent.left == elimNode) 
                elimNode.parent.left = null;
        } 
        else if (elimNode.right == null && elimNode.left != null){
            elimNode.left.parent = elimNode.parent;
            if (elimNode.parent == null){
                root = elimNode.left;
            }
            else if (elimNode.parent.right == elimNode) 
                elimNode.parent.right = elimNode.left;
            else if (elimNode.parent.left == elimNode) 
                elimNode.parent.left = elimNode.left;

        } 
        else if (elimNode.left == null && elimNode.right != null){
            elimNode.right.parent = elimNode.parent;
            if (elimNode.parent == null){
                root = elimNode.right;
            }
            else if (elimNode.parent.right == elimNode) 
                elimNode.parent.right = elimNode.right;
            else if (elimNode.parent.left == elimNode) 
                elimNode.parent.left = elimNode.right;
        }/*  else { //este era el peor algoritmo, era mejor otro
            Nodo suc = siguienteNodo(elimNode);
            Nodo newChild = elimNode.right;
            newChild.parent = elimNode.parent;
            if (elimNode.parent != null) {
                if (elimNode.parent.right == elimNode){
                    elimNode.parent.right = newChild;
                }
                if (elimNode.parent.left == elimNode){
                    elimNode.parent.left = newChild;
                }
            } else {
                root = newChild;
            }
            suc.left = elimNode.left;
            suc.left.parent = suc;
            
        }*/
            else {
                Nodo suc = siguienteNodo(elimNode);
                elimNode.data = suc.data;
                eliminarNodo(suc);
        }
    }

    public String toString(){
        Nodo cnode = nodoMinimo();
        String res = "{";
        while (cnode != null){
            res += cnode.data.toString();
            cnode = siguienteNodo(cnode);
            res += (cnode == null) ? "" : ",";
        }
        return res + "}";
    }

    private String toDbString(Nodo init, int depth){
        String dpt = String.join("", Collections.nCopies(depth, " "));
        if (init == null){
            return dpt+"null";
        } else {
            return dpt + init.data.toString() + "(\n" + toDbString(init.left, depth+1)+",\n"+toDbString(init.right,depth+1)+"\n"+dpt+")/"+init.data.toString() ;
        }
    }

    private class ABB_Iterador implements Iterador<T> {
        private Nodo _actual;

        public ABB_Iterador(){
            _actual = nodoMinimo();
        }

        public boolean haySiguiente() {            
            return siguienteNodo(_actual) != null;
        }
    
        public T siguiente() {
            T res = _actual.data; 
            _actual = siguienteNodo(_actual);
            return res;
        }
    }

    public Iterador<T> iterador() {
        return new ABB_Iterador();
    }

}
