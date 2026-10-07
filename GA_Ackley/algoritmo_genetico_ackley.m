function [mejorX, mejorFit, historial, tiempo, P, f] = algoritmo_genetico_ackley(d, nPob, nIter, metodo, Pm, sigmaM, alpha, lim)
% ALGORITMO_GENETICO_ACKLEY  Algoritmo genetico para minimizar la funcion Ackley.
%
%   [mejorX, mejorFit, historial, tiempo] = algoritmo_genetico_ackley( ...
%                                  d, nPob, nIter, metodo, Pm, sigmaM, alpha, lim)
%
%   Entradas (todas opcionales; entre parentesis el valor por defecto)
%     d       numero de dimensiones de la funcion                (3)
%     nPob    tamano de la poblacion, multiplo de 4              (60)
%     nIter   numero de iteraciones (generaciones)               (100)
%     metodo  'elitismo' | 'torneo' | 'ruleta'                   ('elitismo')
%     Pm      probabilidad de mutacion de cada hijo              (0.1)
%     sigmaM  desviacion estandar de la mutacion                 (1)
%     alpha   parametro del cruce BLX-alfa                       (0.5)
%     lim     limites de cada variable [min max]                 ([-10 10])
%
%   Salidas
%     mejorX     mejor individuo encontrado (vector de d numeros)
%     mejorFit   valor de la funcion Ackley en ese individuo (optimo = 3 - e)
%     historial  mejor valor encontrado tras cada iteracion (nIter+1 datos)
%     tiempo     tiempo de ejecucion en segundos
%     P, f       poblacion final y su fitness
%
%   Esquema de cada iteracion (igual al del problema del viajero):
%     1. Seleccion de la mitad de la poblacion (elitismo, torneo o ruleta).
%     2. Apareamiento al azar de los seleccionados por parejas.
%     3. Cruce BLX-alfa: cada pareja genera 2 hijos.
%     4. Mutacion gaussiana de cada hijo con probabilidad Pm.
%     5. Nueva poblacion = padres seleccionados + hijos (el tamano no cambia).

if nargin < 1 || isempty(d),      d      = 3;          end
if nargin < 2 || isempty(nPob),   nPob   = 60;         end
if nargin < 3 || isempty(nIter),  nIter  = 100;        end
if nargin < 4 || isempty(metodo), metodo = 'elitismo'; end
if nargin < 5 || isempty(Pm),     Pm     = 0.1;        end
if nargin < 6 || isempty(sigmaM), sigmaM = 1;          end
if nargin < 7 || isempty(alpha),  alpha  = 0.5;        end
if nargin < 8 || isempty(lim),    lim    = [-10 10];   end

if mod(nPob, 4) ~= 0
    error('El tamano de la poblacion debe ser multiplo de 4.');
end

tic;
% --- Poblacion inicial -------------------------------------------------
P = ackley_poblacion(nPob, d, lim);
f = evaluar(P);

[mejorFit, i] = min(f);
mejorX = P(i, :);
historial = zeros(nIter + 1, 1);
historial(1) = mejorFit;

% --- Ciclo evolutivo ---------------------------------------------------
for it = 1:nIter
    % 1. Seleccion
    switch lower(metodo)
        case 'elitismo'
            [S, fS] = seleccion_elitismo(P, f);
        case 'torneo'
            [S, fS] = seleccion_torneo(P, f);
        case 'ruleta'
            [S, fS] = seleccion_ruleta(P, f);
        otherwise
            error('Metodo de seleccion desconocido: %s', metodo);
    end

    % 2-3. Apareamiento por parejas al azar y cruce BLX-alfa
    m = size(S, 1);
    orden = randperm(m);
    H = zeros(m, d);
    for j = 1:2:m
        [H(j, :), H(j+1, :)] = cruce_BLX(S(orden(j), :), S(orden(j+1), :), alpha, lim);
    end

    % 4. Mutacion de los hijos
    for j = 1:m
        if rand < Pm
            H(j, :) = mutacion_ackley(H(j, :), sigmaM, lim);
        end
    end

    % 5. Nueva poblacion
    fH = evaluar(H);
    P  = [S; H];
    f  = [fS; fH];

    [fmin, i] = min(f);
    if fmin < mejorFit
        mejorFit = fmin;
        mejorX   = P(i, :);
    end
    historial(it + 1) = mejorFit;
end
tiempo = toc;
end

function f = evaluar(P)
f = zeros(size(P, 1), 1);
for i = 1:size(P, 1)
    f(i) = ackley_funcion(P(i, :));
end
end
