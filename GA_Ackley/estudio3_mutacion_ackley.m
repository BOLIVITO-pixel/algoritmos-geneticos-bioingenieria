% ESTUDIO3_MUTACION_ACKLEY  Estudio de la estrategia de mutacion (Ackley).
% Varia la probabilidad de mutacion Pm (0 = sin mutacion) y la desviacion
% estandar sigmaM de la mutacion. Usa el metodo de seleccion del estudio 1 y
% el numero de iteraciones que se considere mas apropiado segun el estudio 2.

clear; clc; rng(6);
metodo = 'elitismo';                  % <-- CAMBIAR segun el estudio 1
nIter  = 100;                         % <-- CAMBIAR segun el estudio 2
d = 10; nPob = 60; nPruebas = 30;
%            Pm     sigmaM
config = [   0.00   1.0;
             0.05   1.0;
             0.10   1.0;
             0.30   1.0;
             0.50   1.0;
             0.10   0.1;
             0.10   0.5;
             0.10   3.0 ];

etiquetas = cell(1, size(config, 1));
for q = 1:size(config, 1)
    res(q) = estudio_ackley(d, nPob, nIter, metodo, config(q, 1), config(q, 2), nPruebas); %#ok<SAGROW>
    etiquetas{q} = sprintf('Pm=%.2f, s=%.1f', config(q, 1), config(q, 2));
end
imprimir_estudio_ackley(sprintf('ESTUDIO 3: estrategia de mutacion (Ackley, d = %d, %s, %d iteraciones)', d, metodo, nIter), ...
                        etiquetas, res, 'resultados_estudio3_ackley.csv');
