package aed;

public class Agenda {

    private Fecha fechaActual;
    private ArregloRedimensionableDeRecordatorios recordatorios;


    public Agenda(Fecha fechaActual) {
        this.fechaActual = new Fecha(fechaActual); // por tema de clone
        recordatorios = new ArregloRedimensionableDeRecordatorios();
    }

    public void agregarRecordatorio(Recordatorio recordatorio) {
        recordatorios.agregarAtras(recordatorio);
    }

    @Override
    public String toString() {
        String res = fechaActual.toString() + "\n=====\n";
        for (int i=0;i<recordatorios.longitud();i++){
            if (recordatorios.obtener(i).fecha().equals(fechaActual)){
                res += recordatorios.obtener(i).toString() +"\n";
            }
        }
        return res;

    }

    public void incrementarDia() {
        fechaActual.incrementarDia();
    }

    public Fecha fechaActual() {
        return new Fecha(fechaActual);
    }

}
