% ESTUDIO1_SELECCION_ACKLEY  Estudio del metodo de seleccion (funcion Ackley).
% Compara elitismo, torneo y ruleta con 100 iteraciones y cruce BLX-alfa.

clear; clc; rng(4);
d = 10; nPob = 60; nIter = 100; Pm = 0.1; sigmaM = 1; nPruebas = 30;
metodos = {'elitismo', 'torneo', 'ruleta'};

for q = 1:numel(metodos)
    res(q) = estudio_ackley(d, nPob, nIter, metodos{q}, Pm, sigmaM, nPruebas); %#ok<SAGROW>
end
imprimir_estudio_ackley(sprintf('ESTUDIO 1: metodo de seleccion (Ackley, d = %d, %d iteraciones)', d, nIter), ...
                        metodos, res, 'resultados_estudio1_ackley.csv');
