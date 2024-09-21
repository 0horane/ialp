package aed;

class Funciones {
    int cuadrado(int x) {
        return x*x;
    }

    double distancia(double x, double y) {
        return Math.sqrt(x*x + y*y);
    }

    boolean esPar(int n) {
        return n % 2 == 0;
    }

    boolean esBisiesto(int n) {
        return (n % 4 == 0 && ! (n % 100 == 0) ) || (n % 400 == 0);
    }

    int factorialIterativo(int n) {
        int res = 1;
        while (n > 0){
            res *= n;
            n -= 1;
        }
        return res;
    }

    int factorialRecursivo(int n) {
        if (n == 0){
            return 1;
        } else {
            return n * factorialRecursivo(n-1);
        }
    }

    boolean esPrimo(int n) { // podria ser mas rapido con un arreglo
        if (n == 2) 
            return true;
        else if (n < 2)
            return false;
        double upperBound = Math.sqrt(n);
        for (int m = 2;m <= upperBound; m++){
            if (n % m ==0)
                return false;
        }
        return true;
    }

    int sumatoria(int[] numeros) {
        int sum = 0;
        for (int i=0;i<numeros.length;i++){
            sum += numeros[i];
        }
        return sum;
    }

    int busqueda(int[] numeros, int buscado) {
        for (int i = 0; i < numeros.length; i++){
            if (numeros[i] == buscado)
                return i; 
        }
        return 0;
    }

    boolean tienePrimo(int[] numeros) {
        for (int i = 0; i < numeros.length; i++){
            if (esPrimo( numeros[i])){
                return true;
            } 
        }
        return false;
    }

    boolean todosPares(int[] numeros) {
        for (int i = 0; i < numeros.length; i++){
            if (numeros[i] % 2 != 0){
                return false;
            } 
        }
        return true;
    }

    boolean esPrefijo(String s1, String s2) {
        if (s2.length() < s1.length())
            return false;
        for (int i = 0; i < s1.length(); i++){
            if (s1.charAt(i) != s2.charAt(i))
                return false;
        }
        return true;
    }

    boolean esSufijo(String s1, String s2) {
        String rs1 = ""; 
        String rs2 = ""; 
        for (int i = s1.length() - 1; i >= 0; i--){
            rs1 += s1.charAt(i);
        }
        for (int i = s2.length() - 1; i >= 0; i--){
            rs2 += s2.charAt(i);
        }
        return esPrefijo(rs1, rs2);
        
    }
}
