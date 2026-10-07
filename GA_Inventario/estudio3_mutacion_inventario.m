% ESTUDIO3_MUTACION_INVENTARIO  Estudio de la estrategia de mutacion (inventarios).
% Varia la probabilidad de mutacion Pm (0 = sin mutacion) y la desviacion
% estandar relativa sigmaRel (fraccion del rango de cada gen). Usa el metodo de
% seleccion del estudio 1 y el numero de iteraciones del estudio 2.

clear; clc; rng(10);
metodo = 'elitismo';                  % <-- CAMBIAR segun el estudio 1
nIter  = 100;                         % <-- CAMBIAR segun el estudio 2
nPob = 60; nPruebas = 30;
%            Pm     sigmaRel
config = [   0.00   0.10;
             0.05   0.10;
             0.10   0.10;
             0.30   0.10;
             0.50   0.10;
             0.10   0.01;
             0.10   0.05;
             0.10   0.30 ];

etiquetas = cell(1, size(config, 1));
for q = 1:size(config, 1)
    res(q) = estudio_inventario(nPob, nIter, metodo, config(q, 1), config(q, 2), nPruebas); %#ok<SAGROW>
    etiquetas{q} = sprintf('Pm=%.2f, s=%.2f', config(q, 1), config(q, 2));
end
imprimir_estudio_inventario(sprintf('ESTUDIO 3: estrategia de mutacion (inventarios, %s, %d iteraciones)', metodo, nIter), ...
                            etiquetas, res, 'resultados_estudio3_inventario.csv');
