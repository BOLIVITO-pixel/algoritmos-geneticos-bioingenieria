% ESTUDIO2_ITERACIONES_VIAJERO  Estudio del numero de iteraciones.
% Usa el metodo de seleccion que dio mejores resultados en el estudio 1.

clear; clc; rng(2);
metodo = 'elitismo';                  % <-- CAMBIAR segun el resultado del estudio 1
nPob = 60; Pm = 0.1; nPruebas = 30; regreso = true;
iteraciones = [10 20 30 50 100 150 200];

etiquetas = cell(1, numel(iteraciones));
for q = 1:numel(iteraciones)
    res(q) = estudio_viajero(nPob, iteraciones(q), metodo, Pm, nPruebas, regreso); %#ok<SAGROW>
    etiquetas{q} = sprintf('%d iter.', iteraciones(q));
end
imprimir_estudio(sprintf('ESTUDIO 2: numero de iteraciones (viajero, seleccion: %s)', metodo), ...
                 etiquetas, res, 'resultados_estudio2_viajero.csv');
