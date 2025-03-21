package aed;

public class Recordatorio {
    private String mensaje;
    private Fecha fecha;
    private Horario horario;

    public Recordatorio(String mensaje, Fecha fecha, Horario horario) {
        this.mensaje = mensaje;
        this.fecha = new Fecha(fecha); // la consigna no dice que no debe haber aliasing aca, pero los tests fallan si no.
        this.horario = horario;
    }

    public Horario horario() {
        return horario;
    }

    public Fecha fecha() {
        return new Fecha(fecha);
    }

    public String mensaje() {
        return mensaje;
    }

    @Override
    public String toString() {
        // Implementar1
        return mensaje + " @ " + fecha.toString()+ " " + horario.toString(); 
    }

    @Override
    public boolean equals(Object otro) {
        if (otro == null) return false;
        if (otro.getClass() != this.getClass()) return false;
        Recordatorio otroReco = (Recordatorio) otro;
        return otroReco.mensaje().equals(mensaje) 
                && otroReco.fecha().equals(fecha) 
                && otroReco.horario().equals(horario);
    }

    @Override
    public Recordatorio clone(){
        return new Recordatorio(
                this.mensaje(),
                new Fecha(this.fecha()), 
                new Horario(this.horario().hora(), this.horario().minutos()));
    }

}
