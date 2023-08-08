class Entrenador extends Empleado {
	private int campeonatosGanados;

	public Entrenador(String nombre, double sueldoBasico, int antiguedad, int campeonatosGanados) {
    	super(nombre, sueldoBasico, antiguedad);
    	this.campeonatosGanados = campeonatosGanados;
	}

	public int getCampeonatosGanados() {
    	return campeonatosGanados;
	}

	public void setCampeonatosGanados(int campeonatosGanados) {
    	this.campeonatosGanados = campeonatosGanados;
	}

	public double calcularEfectividad() {
    	return (double) campeonatosGanados / antiguedad;
	}

	public double calcularSueldoACobrar() {
    	double sueldoACobrar = super.calcularSueldoACobrar();

    	if (campeonatosGanados >= 1 && campeonatosGanados <= 4) {
        	sueldoACobrar += 5000;
    	} else if (campeonatosGanados >= 5 && campeonatosGanados <= 10) {
        	sueldoACobrar += 30000;
    	} else if (campeonatosGanados > 10) {
        	sueldoACobrar += 50000;
    	}

    	return sueldoACobrar;
	}

	public String toString() {
    	return super.toString() + ", Efectividad: " + calcularEfectividad();
	}
}
