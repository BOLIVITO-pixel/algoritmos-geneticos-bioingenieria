% ESTUDIO1_SELECCION_VIAJERO  Estudio del mejor metodo de seleccion.
% Ejecuta el algoritmo con 100 iteraciones y cada metodo de seleccion
% (elitismo, torneo y ruleta), con el cruce OX1 y 30 pruebas por escenario.

clear; clc; rng(1);                 % semilla fija: resultados reproducibles
nPob = 60; nIter = 100; Pm = 0.1; nPruebas = 30; regreso = true;
metodos = {'elitismo', 'torneo', 'ruleta'};

for q = 1:numel(metodos)
    res(q) = estudio_viajero(nPob, nIter, metodos{q}, Pm, nPruebas, regreso); %#ok<SAGROW>
end
imprimir_estudio('ESTUDIO 1: metodo de seleccion (viajero, 100 iteraciones)', metodos, res, 'resultados_estudio1_viajero.csv');

[~, ib] = min([res.media]);
fprintf('Metodo con menor media: %s  --> usalo en los estudios 2 y 3.\n', metodos{ib});
