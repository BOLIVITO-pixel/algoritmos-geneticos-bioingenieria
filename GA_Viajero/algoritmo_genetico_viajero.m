function [mejorRuta, mejorFit, historial, tiempo, P, f] = algoritmo_genetico_viajero(nPob, nIter, metodo, Pm, regreso, D)
% ALGORITMO_GENETICO_VIAJERO  Algoritmo genetico para el problema del viajero.
%
%   [mejorRuta, mejorFit, historial, tiempo] = algoritmo_genetico_viajero( ...
%                                       nPob, nIter, metodo, Pm, regreso, D)
%
%   Entradas (todas opcionales; entre parentesis el valor por defecto)
%     nPob    tamano de la poblacion, multiplo de 4            (60)
%     nIter   numero de iteraciones (generaciones)             (100)
%     metodo  'elitismo' | 'torneo' | 'ruleta'                 ('torneo')
%     Pm      probabilidad de mutacion de cada hijo            (0.1)
%     regreso true: el recorrido incluye volver al origen      (true)
%     D       matriz de tiempos de la Tabla I                  (tsp_datos)
%
%   Salidas
%     mejorRuta  mejor recorrido encontrado (permutacion de 1..13)
%     mejorFit   su tiempo total en minutos
%     historial  mejor valor encontrado tras cada iteracion (nIter+1 datos;
%                el primero corresponde a la poblacion inicial)
%     tiempo     tiempo de ejecucion en segundos
%     P, f       poblacion final y su fitness
%
%   Esquema de cada iteracion:
%     1. Seleccion de la mitad de la poblacion (elitismo, torneo o ruleta).
%     2. Apareamiento al azar de los seleccionados por parejas.
%     3. Cruce OX1: cada pareja genera 2 hijos.
%     4. Mutacion por intercambio de cada hijo con probabilidad Pm.
%     5. Nueva poblacion = padres seleccionados + hijos (el tamano no cambia).

if nargin < 1 || isempty(nPob),    nPob    = 60;       end
if nargin < 2 || isempty(nIter),   nIter   = 100;      end
if nargin < 3 || isempty(metodo),  metodo  = 'torneo'; end
if nargin < 4 || isempty(Pm),      Pm      = 0.1;      end
if nargin < 5 || isempty(regreso), regreso = true;     end
if nargin < 6 || isempty(D),       D       = tsp_datos(); end

if mod(nPob, 4) ~= 0
    error('El tamano de la poblacion debe ser multiplo de 4.');
end
nC = size(D, 1);

tic;
% --- Poblacion inicial -------------------------------------------------
P = tsp_poblacion(nPob, nC);
f = evaluar(P, D, regreso);

[mejorFit, i] = min(f);
mejorRuta = P(i, :);
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

    % 2-3. Apareamiento por parejas al azar y cruce OX1
    m = size(S, 1);
    orden = randperm(m);
    H = zeros(m, nC);
    for j = 1:2:m
        [H(j, :), H(j+1, :)] = cruce_OX1(S(orden(j), :), S(orden(j+1), :));
    end

    % 4. Mutacion de los hijos
    for j = 1:m
        if rand < Pm
            H(j, :) = mutacion_viajero(H(j, :));
        end
    end

    % 5. Nueva poblacion
    fH = evaluar(H, D, regreso);
    P  = [S; H];
    f  = [fS; fH];

    [fmin, i] = min(f);
    if fmin < mejorFit
        mejorFit  = fmin;
        mejorRuta = P(i, :);
    end
    historial(it + 1) = mejorFit;
end
tiempo = toc;
end

function f = evaluar(P, D, regreso)
f = zeros(size(P, 1), 1);
for i = 1:size(P, 1)
    f(i) = tsp_fitness(P(i, :), D, regreso);
end
end
