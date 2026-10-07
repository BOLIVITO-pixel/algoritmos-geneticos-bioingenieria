% ESTUDIO2_ITERACIONES_ACKLEY  Estudio del numero de iteraciones (Ackley).
% Usa el metodo de seleccion que dio mejores resultados en el estudio 1.

clear; clc; rng(5);
metodo = 'elitismo';                  % <-- CAMBIAR segun el resultado del estudio 1
d = 10; nPob = 60; Pm = 0.1; sigmaM = 1; nPruebas = 30;
iteraciones = [10 20 30 50 100 150 200];

etiquetas = cell(1, numel(iteraciones));
for q = 1:numel(iteraciones)
    res(q) = estudio_ackley(d, nPob, iteraciones(q), metodo, Pm, sigmaM, nPruebas); %#ok<SAGROW>
    etiquetas{q} = sprintf('%d iter.', iteraciones(q));
end
imprimir_estudio_ackley(sprintf('ESTUDIO 2: numero de iteraciones (Ackley, d = %d, seleccion: %s)', d, metodo), ...
                        etiquetas, res, 'resultados_estudio2_ackley.csv');
