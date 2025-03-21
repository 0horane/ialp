package aed;

public class Fecha {
    private Integer dia;
    private Integer mes;
    public Fecha(int dia, int mes) {
        this.dia = dia;
        this.mes = mes;

    }

    public Fecha(Fecha fecha) {
        this.dia = fecha.dia();
        this.mes = fecha.mes();
    }

    public Integer dia() {
        return dia;
    }

    public Integer mes() {
        return mes;
    }

    @Override
    public String toString() {
        return dia.toString()+"/"+mes.toString();
    }

    @Override
    public boolean equals(Object otra) {
        if (otra == null) return false;
        if (otra.getClass() != this.getClass()) return false;
        Fecha otraFecha = (Fecha) otra;
        return otraFecha.dia() == dia() && otraFecha.mes() == mes();
    }

    public void incrementarDia() {
        if (dia == diasEnMes(mes)){
            dia=1;
            if (mes==12)
                mes=1;
            else
                mes+=1;
        } else {
            dia+=1;
        }
    }

    private int diasEnMes(int mes) {
        int dias[] = {
                // ene, feb, mar, abr, may, jun
                31, 28, 31, 30, 31, 30,
                // jul, ago, sep, oct, nov, dic
                31, 31, 30, 31, 30, 31
        };
        return dias[mes - 1];
    }

}
