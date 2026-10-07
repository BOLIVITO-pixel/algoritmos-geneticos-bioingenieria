% ESTUDIO1_SELECCION_INVENTARIO  Estudio del metodo de seleccion (inventarios).
% Compara elitismo, torneo y ruleta con 100 iteraciones y cruce BLX-alfa.

clear; clc; rng(8);
nPob = 60; nIter = 100; Pm = 0.1; sigmaRel = 0.1; nPruebas = 30;
metodos = {'elitismo', 'torneo', 'ruleta'};

for q = 1:numel(metodos)
    res(q) = estudio_inventario(nPob, nIter, metodos{q}, Pm, sigmaRel, nPruebas); %#ok<SAGROW>
end
imprimir_estudio_inventario(sprintf('ESTUDIO 1: metodo de seleccion (inventarios, %d iteraciones)', nIter), ...
                            metodos, res, 'resultados_estudio1_inventario.csv');
