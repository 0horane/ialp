package aed;

public class Horario {
    private Integer hora;
    private Integer minutos;
    public Horario(int hora, int minutos) {
        this.hora = hora;
        this.minutos = minutos;
    }

    public int hora() {
        // Implementar
        return hora;
    }

    public int minutos() {
        // Implementar
        return minutos;
    }

    @Override
    public String toString() {
        String res = hora.toString()+":";
        //if (minutos < 10)
        //    res += "0"; //esto no iba
        return res + minutos.toString();
    }

    @Override
    public boolean equals(Object otro) {
        if (otro == null) return false;
        if (otro.getClass() != this.getClass()) return false;
        Horario otroHorario = (Horario) otro;
        return otroHorario.hora() == hora() && otroHorario.minutos() == minutos();
    }

}
