program EstadisticasUbuntu;

const
  MAX_COMPUTADORAS = 10000;

type
  Computadora = record
	codigo: Integer;
	version: Real;
	cantidadPaquetes: Integer;
	cantidadCuentas: Integer;
  end;

var
  computadoras: array [1..MAX_COMPUTADORAS] of Computadora;
  cantidadComputadoras, i: Integer;
  version1804_1604: Integer;
  promedioCuentas: Real;
  maxPaquetes: Integer;
  versionMaxPaquetes: Real;

begin
  cantidadComputadoras := 0;
  version1804_1604 := 0;
  promedioCuentas := 0.0;
  maxPaquetes := 0;

  { Lectura de datos }
  repeat
	Write('Ingrese el código de la computadora (o -1 para finalizar): ');
	Readln(computadoras[cantidadComputadoras + 1].codigo);

	if computadoras[cantidadComputadoras + 1].codigo <> -1 then
	begin
  	Write('Ingrese la versión de Ubuntu (ejemplo: 18.04): ');
  	Readln(computadoras[cantidadComputadoras + 1].version);

  	Write('Ingrese la cantidad de paquetes instalados: ');
  	Readln(computadoras[cantidadComputadoras + 1].cantidadPaquetes);

  	Write('Ingrese la cantidad de cuentas de usuario: ');
  	Readln(computadoras[cantidadComputadoras + 1].cantidadCuentas);

  	cantidadComputadoras := cantidadComputadoras + 1;
	end;
  until (computadoras[cantidadComputadoras].codigo = -1) or (cantidadComputadoras = MAX_COMPUTADORAS);

  { Procesamiento de datos }
  for i := 1 to cantidadComputadoras do
  begin
	if (computadoras[i].version = 18.04) or (computadoras[i].version = 16.04) then
  	version1804_1604 := version1804_1604 + 1;

	promedioCuentas := promedioCuentas + computadoras[i].cantidadCuentas;

	if computadoras[i].cantidadPaquetes > maxPaquetes then
	begin
  	maxPaquetes := computadoras[i].cantidadPaquetes;
  	versionMaxPaquetes := computadoras[i].version;
	end;
  end;

  promedioCuentas := promedioCuentas / cantidadComputadoras;

  { Eliminación de datos }
  for i := 1 to cantidadComputadoras do
  begin
	if (computadoras[i].codigo >= 0) and (computadoras[i].codigo <= 500) then
	begin
  	computadoras[i].codigo := 0;
  	computadoras[i].version := 0.0;
  	computadoras[i].cantidadPaquetes := 0;
  	computadoras[i].cantidadCuentas := 0;
	end;
  end;

  { Resultados }
  Writeln('Cantidad de computadoras que utilizan las versiones 18.04 o 16.04: ', version1804_1604);
  Writeln('Promedio de cuentas de usuario por computadora: ', promedioCuentas:0:2);
  Writeln('Versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados: ', versionMaxPaquetes:0:2);

  Readln;
end.
