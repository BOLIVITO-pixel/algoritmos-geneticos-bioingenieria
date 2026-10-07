function res = estudio_viajero(nPob, nIter, metodo, Pm, nPruebas, regreso)
% ESTUDIO_VIAJERO  Ejecuta varias veces el algoritmo genetico del viajero con
% una misma configuracion y resume los resultados.
%   res.tiempo   tiempo de ejecucion medio (s)
%   res.mejor    mejor valor encontrado en las pruebas (min)
%   res.ruta     individuo que obtuvo ese mejor valor
%   res.media    media de los resultados de las pruebas (min)
%   res.desv     desviacion estandar de los resultados (muestral, N-1)
%   res.valores  resultado de cada prueba

vals = zeros(nPruebas, 1);
tiempos = zeros(nPruebas, 1);
rutas = zeros(nPruebas, 13);
for k = 1:nPruebas
    [r, f, ~, t] = algoritmo_genetico_viajero(nPob, nIter, metodo, Pm, regreso);
    vals(k) = f;
    tiempos(k) = t;
    rutas(k, :) = r;
end
[res.mejor, i] = min(vals);
res.ruta    = rutas(i, :);
res.media   = mean(vals);
res.desv    = std(vals);
res.tiempo  = mean(tiempos);
res.valores = vals;
end
