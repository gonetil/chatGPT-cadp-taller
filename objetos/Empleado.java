class Empleado {
	protected String nombre;
	protected double sueldoBasico;
	protected int antiguedad;

	public Empleado(String nombre, double sueldoBasico, int antiguedad) {
    	this.nombre = nombre;
    	this.sueldoBasico = sueldoBasico;
    	this.antiguedad = antiguedad;
	}

	public String getNombre() {
    	return nombre;
	}

	public void setNombre(String nombre) {
    	this.nombre = nombre;
	}

	public double getSueldoBasico() {
    	return sueldoBasico;
	}

	public void setSueldoBasico(double sueldoBasico) {
    	this.sueldoBasico = sueldoBasico;
	}

	public int getAntiguedad() {
    	return antiguedad;
	}

	public void setAntiguedad(int antiguedad) {
    	this.antiguedad = antiguedad;
	}

	public double calcularSueldoACobrar() {
    	return sueldoBasico + (sueldoBasico * 0.1 * antiguedad);
	}

	public String toString() {
    	return "Nombre: " + nombre + ", Sueldo a cobrar: " + calcularSueldoACobrar();
	}
}
