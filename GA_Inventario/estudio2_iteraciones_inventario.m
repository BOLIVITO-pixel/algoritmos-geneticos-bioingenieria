% ESTUDIO2_ITERACIONES_INVENTARIO  Estudio del numero de iteraciones (inventarios).
% Usa el metodo de seleccion que dio mejores resultados en el estudio 1.

clear; clc; rng(9);
metodo = 'elitismo';                  % <-- CAMBIAR segun el resultado del estudio 1
nPob = 60; Pm = 0.1; sigmaRel = 0.1; nPruebas = 30;
iteraciones = [10 20 30 50 100 150 200];

etiquetas = cell(1, numel(iteraciones));
for q = 1:numel(iteraciones)
    res(q) = estudio_inventario(nPob, iteraciones(q), metodo, Pm, sigmaRel, nPruebas); %#ok<SAGROW>
    etiquetas{q} = sprintf('%d iter.', iteraciones(q));
end
imprimir_estudio_inventario(sprintf('ESTUDIO 2: numero de iteraciones (inventarios, seleccion: %s)', metodo), ...
                            etiquetas, res, 'resultados_estudio2_inventario.csv');
