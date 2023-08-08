class Jugador extends Empleado {
	private int partidosJugados;
	private int golesAnotados;

	public Jugador(String nombre, double sueldoBasico, int antiguedad, int partidosJugados, int golesAnotados) {
    	super(nombre, sueldoBasico, antiguedad);
    	this.partidosJugados = partidosJugados;
    	this.golesAnotados = golesAnotados;
	}

	public int getPartidosJugados() {
    	return partidosJugados;
	}

	public void setPartidosJugados(int partidosJugados) {
    	this.partidosJugados = partidosJugados;
	}

	public int getGolesAnotados() {
    	return golesAnotados;
	}

	public void setGolesAnotados(int golesAnotados) {
    	this.golesAnotados = golesAnotados;
	}

	public double calcularEfectividad() {
    	return (double) golesAnotados / partidosJugados;
	}

	public double calcularSueldoACobrar() {
    	double sueldoACobrar = super.calcularSueldoACobrar();

    	if (calcularEfectividad() > 0.5) {
        	sueldoACobrar += sueldoBasico;
    	}

    	return sueldoACobrar;
	}

	public String toString() {
    	return super.toString() + ", Efectividad: " + calcularEfectividad();
	}
}
