% EJEMPLO_VIAJERO  Ejecuta una vez el algoritmo genetico del viajero y
% muestra el mejor recorrido encontrado.

clear; clc;
[D, nombres] = tsp_datos();

% Comprobacion de la funcion objetivo con el ejemplo de la guia
fprintf('Recorrido 1:13 sin regreso: %d min (esperado 641)\n', tsp_fitness(1:13, D, false));
fprintf('Recorrido 1:13 con regreso: %d min (esperado 730)\n\n', tsp_fitness(1:13, D, true));

nPob = 60; nIter = 100; metodo = 'torneo'; Pm = 0.1; regreso = true;
[ruta, fit, hist, t] = algoritmo_genetico_viajero(nPob, nIter, metodo, Pm, regreso, D);

fprintf('Metodo de seleccion: %s | poblacion %d | %d iteraciones | Pm = %.2f\n', metodo, nPob, nIter, Pm);
fprintf('Mejor recorrido: %s\n', mat2str(ruta));
fprintf('Tiempo total: %d min | tiempo de ejecucion: %.4f s\n', fit, t);
fprintf('Orden de visita: %s\n', strjoin(nombres(ruta), ' -> '));

figure;
plot(0:nIter, hist, 'LineWidth', 1.5);
xlabel('Iteracion'); ylabel('Mejor tiempo encontrado (min)');
title('Convergencia del algoritmo genetico (problema del viajero)');
grid on;
