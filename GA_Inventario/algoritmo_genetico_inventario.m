function [mejorX, mejorFit, historial, tiempo, P, f] = algoritmo_genetico_inventario(nPob, nIter, metodo, Pm, sigmaRel, alpha)
% ALGORITMO_GENETICO_INVENTARIO  Algoritmo genetico para el problema de inventarios.
%
%   [mejorX, mejorFit, historial, tiempo] = algoritmo_genetico_inventario( ...
%                                  nPob, nIter, metodo, Pm, sigmaRel, alpha)
%
%   Entradas (todas opcionales; entre parentesis el valor por defecto)
%     nPob     tamano de la poblacion, multiplo de 4                (60)
%     nIter    numero de iteraciones (generaciones)                 (100)
%     metodo   'elitismo' | 'torneo' | 'ruleta'                     ('elitismo')
%     Pm       probabilidad de mutacion de cada hijo                (0.1)
%     sigmaRel desviacion estandar de la mutacion como fraccion del
%              rango del gen                                        (0.1)
%     alpha    parametro del cruce BLX-alfa                         (0.5)
%
%   Salidas
%     mejorX     mejor individuo [Q1..Q5, S1..S5, K1..K5]
%     mejorFit   valor de Z (ecuacion 8) en ese individuo
%     historial  mejor valor encontrado tras cada iteracion (nIter+1 datos)
%     tiempo     tiempo de ejecucion en segundos
%     P, f       poblacion final y su fitness
%
%   Esquema de cada iteracion (igual al de los otros problemas):
%     1. Seleccion de la mitad de la poblacion (elitismo, torneo o ruleta).
%     2. Apareamiento al azar de los seleccionados por parejas.
%     3. Cruce BLX-alfa: cada pareja genera 2 hijos (reparados con la ec. 9).
%     4. Mutacion gaussiana de cada hijo con probabilidad Pm.
%     5. Nueva poblacion = padres seleccionados + hijos (el tamano no cambia).

if nargin < 1 || isempty(nPob),     nPob     = 60;         end
if nargin < 2 || isempty(nIter),    nIter    = 100;        end
if nargin < 3 || isempty(metodo),   metodo   = 'elitismo'; end
if nargin < 4 || isempty(Pm),       Pm       = 0.1;        end
if nargin < 5 || isempty(sigmaRel), sigmaRel = 0.1;        end
if nargin < 6 || isempty(alpha),    alpha    = 0.5;        end

if mod(nPob, 4) ~= 0
    error('El tamano de la poblacion debe ser multiplo de 4.');
end

tic;
% --- Poblacion inicial -------------------------------------------------
P = inventario_poblacion(nPob);
f = inventario_funcion(P);

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
    H = zeros(m, 15);
    for j = 1:2:m
        [H(j, :), H(j+1, :)] = cruce_BLX_inventario(S(orden(j), :), S(orden(j+1), :), alpha);
    end

    % 4. Mutacion de los hijos
    for j = 1:m
        if rand < Pm
            H(j, :) = mutacion_inventario(H(j, :), sigmaRel);
        end
    end

    % 5. Nueva poblacion
    fH = inventario_funcion(H);
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
