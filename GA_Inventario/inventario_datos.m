function par = inventario_datos()
% INVENTARIO_DATOS  Parametros de entrada del problema de inventarios (Tabla II
% de la guia). Los valores monetarios estan en miles de COP.
%   par.D      ventas anuales de cada item
%   par.m      valor promedio que se invierte en el item por cada pedido
%   par.mu     media de la demanda durante el tiempo de reposicion
%   par.sigma  desviacion estandar de esa demanda
%   par.Smax   limite superior del stock de seguridad S_i (c1 de cada item)
%   par.Kmax   limite superior de la demanda definida K_i (c2 de cada item)
%   par.I      inversion maxima en inventario (restriccion de la ecuacion 9)
%   par.Qmax   limite superior de Q_i. La guia lo deja en infinito, pero la
%              ecuacion 9 con Q_i > 0 y S_i >= 0 obliga a que Q_i <= 2*I.
par.D     = [12000 80000 150000 50000 100000];
par.m     = [20 220 900 120 180];
par.mu    = [300 4000 7000 2000 3500];
par.sigma = [100 1200 2500 700 1100];
par.Smax  = [200 1200 2500 800 1500];
par.Kmax  = [500 2000 5000 1500 3000];
par.I     = 8000;
par.Qmax  = 2 * par.I;
par.Qmin  = 1e-3;     % Q_i debe ser estrictamente positivo
end
