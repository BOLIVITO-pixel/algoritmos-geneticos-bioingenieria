function res = estudio_ackley(d, nPob, nIter, metodo, Pm, sigmaM, nPruebas)
% ESTUDIO_ACKLEY  Ejecuta varias veces el algoritmo genetico de Ackley con una
% misma configuracion y resume los resultados.
%   res.tiempo   tiempo de ejecucion medio (s)
%   res.mejor    mejor valor encontrado en las pruebas
%   res.x        individuo que obtuvo ese mejor valor
%   res.media    media de los resultados de las pruebas
%   res.desv     desviacion estandar de los resultados (muestral, N-1)
%   res.rmse     raiz del error cuadratico medio respecto a 3 - e (ecuacion 15)
%   res.valores  resultado de cada prueba

optimo = 3 - exp(1);
vals = zeros(nPruebas, 1);
tiempos = zeros(nPruebas, 1);
xs = zeros(nPruebas, d);
for k = 1:nPruebas
    [x, f, ~, t] = algoritmo_genetico_ackley(d, nPob, nIter, metodo, Pm, sigmaM);
    vals(k) = f;
    tiempos(k) = t;
    xs(k, :) = x;
end
[res.mejor, i] = min(vals);
res.x       = xs(i, :);
res.media   = mean(vals);
res.desv    = std(vals);
res.rmse    = sqrt(mean((vals - optimo).^2));
res.tiempo  = mean(tiempos);
res.valores = vals;
end
