program VentasComercio;

type
  Venta = record
	codigoProducto: Integer;
	fecha: String;
	cantidad: Integer;
  end;

  NodoVenta = ^VentaNodo;
  VentaNodo = record
	venta: Venta;
	izquierda: NodoVenta;
	derecha: NodoVenta;
  end;

  NodoProducto = ^ProductoNodo;
  ProductoNodo = record
	codigoProducto: Integer;
	cantidadTotal: Integer;
	izquierda: NodoProducto;
	derecha: NodoProducto;
  end;

function CrearNodoVenta(venta: Venta): NodoVenta;
var
  nodo: NodoVenta;
begin
  New(nodo);
  nodo^.venta := venta;
  nodo^.izquierda := nil;
  nodo^.derecha := nil;
  CrearNodoVenta := nodo;
end;

procedure InsertarVenta(var arbol: NodoVenta; venta: Venta);
begin
  if arbol = nil then
	arbol := CrearNodoVenta(venta)
  else if venta.codigoProducto < arbol^.venta.codigoProducto then
	InsertarVenta(arbol^.izquierda, venta)
  else
	InsertarVenta(arbol^.derecha, venta);
end;

function CrearNodoProducto(codigoProducto, cantidadTotal: Integer): NodoProducto;
var
  nodo: NodoProducto;
begin
  New(nodo);
  nodo^.codigoProducto := codigoProducto;
  nodo^.cantidadTotal := cantidadTotal;
  nodo^.izquierda := nil;
  nodo^.derecha := nil;
  CrearNodoProducto := nodo;
end;

procedure InsertarProducto(var arbol: NodoProducto; codigoProducto, cantidadTotal: Integer);
begin
  if arbol = nil then
	arbol := CrearNodoProducto(codigoProducto, cantidadTotal)
  else if codigoProducto < arbol^.codigoProducto then
	InsertarProducto(arbol^.izquierda, codigoProducto, cantidadTotal)
  else
	InsertarProducto(arbol^.derecha, codigoProducto, cantidadTotal);
end;

procedure GenerarArbolesVentaYProducto(var arbolVenta, arbolProducto: NodoVenta);
var
  venta: Venta;
begin
  ReadLn(venta.codigoProducto);
  while venta.codigoProducto <> 0 do
  begin
	ReadLn(venta.fecha);
	ReadLn(venta.cantidad);

	InsertarVenta(arbolVenta, venta);
	InsertarProducto(arbolProducto, venta.codigoProducto, venta.cantidad);

	ReadLn(venta.codigoProducto);
  end;
end;

function BuscarCantidadVenta(arbol: NodoVenta; codigoProducto: Integer): Integer;
begin
  if arbol = nil then
	BuscarCantidadVenta := 0
  else if codigoProducto = arbol^.venta.codigoProducto then
	BuscarCantidadVenta := arbol^.venta.cantidad
  else if codigoProducto < arbol^.venta.codigoProducto then
	BuscarCantidadVenta := BuscarCantidadVenta(arbol^.izquierda, codigoProducto)
  else
	BuscarCantidadVenta := BuscarCantidadVenta(arbol^.derecha, codigoProducto);
end;

function BuscarCantidadProducto(arbol: NodoProducto; codigoProducto: Integer): Integer;
begin
  if arbol = nil then
	BuscarCantidadProducto := 0
  else if codigoProducto = arbol^.codigoProducto then
	BuscarCantidadProducto := arbol^.cantidadTotal
  else if codigoProducto < arbol^.codigoProducto then
	BuscarCantidadProducto := BuscarCantidadProducto(arbol^.izquierda, codigoProducto)
  else
	BuscarCantidadProducto := BuscarCantidadProducto(arbol^.derecha, codigoProducto);
end;

var
  arbolVenta: NodoVenta;
  arbolProducto: NodoProducto;
  codigoProducto: Integer;

begin
  arbolVenta := nil;
  arbolProducto := nil;

  GenerarArbolesVentaYProducto(arbolVenta, arbolProducto);

  Write('Ingrese el código de producto para buscar la cantidad vendida: ');
  ReadLn(codigoProducto);
  WriteLn('Cantidad total vendida del producto ', codigoProducto, ': ', BuscarCantidadVenta(arbolVenta, codigoProducto));

  Write('Ingrese el código de producto para buscar la cantidad total vendida: ');
  ReadLn(codigoProducto);
  WriteLn('Cantidad total vendida del producto ', codigoProducto, ': ', BuscarCantidadProducto(arbolProducto, codigoProducto));

  ReadLn;
end.
