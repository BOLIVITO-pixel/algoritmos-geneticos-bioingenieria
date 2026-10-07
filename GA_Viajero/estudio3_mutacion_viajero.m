% ESTUDIO3_MUTACION_VIAJERO  Estudio de la estrategia de mutacion.
% Varia la probabilidad de mutacion Pm (0 = sin mutacion). Usa el metodo de
% seleccion del estudio 1 y el numero de iteraciones que considere mas
% apropiado segun el estudio 2.

clear; clc; rng(3);
metodo = 'elitismo';                  % <-- CAMBIAR segun el estudio 1
nIter  = 100;                       % <-- CAMBIAR segun el estudio 2
nPob = 60; nPruebas = 30; regreso = true;
valoresPm = [0 0.05 0.1 0.2 0.3 0.5];

etiquetas = cell(1, numel(valoresPm));
for q = 1:numel(valoresPm)
    res(q) = estudio_viajero(nPob, nIter, metodo, valoresPm(q), nPruebas, regreso); %#ok<SAGROW>
    etiquetas{q} = sprintf('Pm = %.2f', valoresPm(q));
end
imprimir_estudio(sprintf('ESTUDIO 3: probabilidad de mutacion (viajero, %s, %d iteraciones)', metodo, nIter), ...
                 etiquetas, res, 'resultados_estudio3_viajero.csv');
