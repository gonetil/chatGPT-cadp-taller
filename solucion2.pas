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

  VectorComputadoras = record
	computadoras: array [1..MAX_COMPUTADORAS] of Computadora;
	dimensionLogica: Integer;
  end;

procedure LeerDatosComputadoras(var vector: VectorComputadoras);
var
  i: Integer;
begin
  i := 1;
  repeat
	Write('Ingrese el código de la computadora (o -1 para finalizar): ');
	Readln(vector.computadoras[i].codigo);

	if vector.computadoras[i].codigo <> -1 then
	begin
  	Write('Ingrese la versión de Ubuntu (ejemplo: 18.04): ');
  	Readln(vector.computadoras[i].version);

  	Write('Ingrese la cantidad de paquetes instalados: ');
  	Readln(vector.computadoras[i].cantidadPaquetes);

  	Write('Ingrese la cantidad de cuentas de usuario: ');
  	Readln(vector.computadoras[i].cantidadCuentas);

  	i := i + 1;
	end;
  until (vector.computadoras[i - 1].codigo = -1) or (i > MAX_COMPUTADORAS);

  vector.dimensionLogica := i - 1;
end;

function ContarVersiones1804_1604(const vector: VectorComputadoras): Integer;
var
  contador: Integer;
  i: Integer;
begin
  contador := 0;
  for i := 1 to vector.dimensionLogica do
  begin
	if (vector.computadoras[i].version = 18.04) or (vector.computadoras[i].version = 16.04) then
  	contador := contador + 1;
  end;
  Result := contador;
end;

function CalcularPromedioCuentas(const vector: VectorComputadoras): Real;
var
  totalCuentas: Integer;
  i: Integer;
begin
  totalCuentas := 0;
  for i := 1 to vector.dimensionLogica do
  begin
	totalCuentas := totalCuentas + vector.computadoras[i].cantidadCuentas;
  end;
  Result := totalCuentas / vector.dimensionLogica;
end;

function ObtenerVersionMaxPaquetes(const vector: VectorComputadoras): Real;
var
  maxPaquetes: Integer;
  versionMaxPaquetes: Real;
  i: Integer;
begin
  maxPaquetes := 0;
  versionMaxPaquetes := 0.0;
  for i := 1 to vector.dimensionLogica do
  begin
	if vector.computadoras[i].cantidadPaquetes > maxPaquetes then
	begin
  	maxPaquetes := vector.computadoras[i].cantidadPaquetes;
  	versionMaxPaquetes := vector.computadoras[i].version;
	end;
  end;
  Result := versionMaxPaquetes;
end;

procedure EliminarComputadorasEntre0y500(var vector: VectorComputadoras);
var
  i, j: Integer;
begin
  j := 1;
  for i := 1 to vector.dimensionLogica do
  begin
	if (vector.computadoras[i].codigo < 0) or (vector.computadoras[i].codigo > 500) then
	begin
  	vector.computadoras[j] := vector.computadoras[i];
  	j := j + 1;
	end;
  end;
  vector.dimensionLogica := j - 1;
end;

procedure MostrarResultados(const vector: VectorComputadoras);
var
  version1804_1604: Integer;
  promedioCuentas: Real;
  versionMaxPaquetes: Real;
begin
  version1804_1604 := ContarVersiones1804_1604(vector);
  promedioCuentas := CalcularPromedioCuentas(vector);
  versionMaxPaquetes := ObtenerVersionMaxPaquetes(vector);

  Writeln('Cantidad de computadoras que utilizan las versiones 18.04 o 16.04: ', version1804_1604);
  Writeln('Promedio de cuentas de usuario por computadora: ', promedioCuentas:0:2);
  Writeln('Versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados: ', versionMaxPaquetes:0:2);
end;

var
  vectorComputadoras: VectorComputadoras;

begin
  LeerDatosComputadoras(vectorComputadoras);
  EliminarComputadorasEntre0y500(vectorComputadoras);
  MostrarResultados(vectorComputadoras);

  Readln;
end.
