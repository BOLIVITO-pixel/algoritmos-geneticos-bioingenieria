function res = estudio_inventario(nPob, nIter, metodo, Pm, sigmaRel, nPruebas)
% ESTUDIO_INVENTARIO  Ejecuta varias veces el algoritmo genetico de inventarios
% con una misma configuracion y resume los resultados.
%   res.tiempo   tiempo de ejecucion medio (s)
%   res.mejor    mejor valor de Z encontrado en las pruebas
%   res.x        individuo que obtuvo ese mejor valor
%   res.media    media de los resultados de las pruebas
%   res.desv     desviacion estandar de los resultados (muestral, N-1)
%   res.valores  resultado de cada prueba
% (No se calcula RMSE: en este problema no se conoce el valor optimo.)

vals = zeros(nPruebas, 1);
tiempos = zeros(nPruebas, 1);
xs = zeros(nPruebas, 15);
for k = 1:nPruebas
    [x, f, ~, t] = algoritmo_genetico_inventario(nPob, nIter, metodo, Pm, sigmaRel);
    vals(k) = f;
    tiempos(k) = t;
    xs(k, :) = x;
end
[res.mejor, i] = min(vals);
res.x       = xs(i, :);
res.media   = mean(vals);
res.desv    = std(vals);
res.tiempo  = mean(tiempos);
res.valores = vals;
end
