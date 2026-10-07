    % ESTUDIO4_DIMENSIONES_ACKLEY  Estudio del numero de dimensiones (Ackley).
% Usa el metodo de seleccion del estudio 1, el numero de iteraciones del
% estudio 2 y la mutacion del estudio 3, variando las dimensiones de la funcion.

clear; clc; rng(7);
metodo = 'elitismo';                  % <-- CAMBIAR segun el estudio 1
nIter  = 100;                         % <-- CAMBIAR segun el estudio 2
Pm = 0.05; sigmaM = 1;                 % <-- CAMBIAR segun el estudio 3
nPob = 60; nPruebas = 30;
dimensiones = [2 3 10 20 50 100];

etiquetas = cell(1, numel(dimensiones));
for q = 1:numel(dimensiones)
    res(q) = estudio_ackley(dimensiones(q), nPob, nIter, metodo, Pm, sigmaM, nPruebas); %#ok<SAGROW>
    etiquetas{q} = sprintf('d = %d', dimensiones(q));
end
imprimir_estudio_ackley(sprintf('ESTUDIO 4: numero de dimensiones (Ackley, %s, %d iteraciones)', metodo, nIter), ...
                        etiquetas, res, 'resultados_estudio4_ackley.csv');
