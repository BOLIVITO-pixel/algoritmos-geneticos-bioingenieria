% EJEMPLO_ACKLEY  Ejecuta una vez el algoritmo genetico para la funcion Ackley
% y muestra el mejor individuo encontrado.

clear; clc;
fprintf('f(0,...,0) = %.4f (optimo teorico 3 - e = %.4f)\n\n', ackley_funcion(zeros(1, 5)), 3 - exp(1));

d = 10; nPob = 60; nIter = 100; metodo = 'elitismo'; Pm = 0.1; sigmaM = 1;
[x, fit, hist, t] = algoritmo_genetico_ackley(d, nPob, nIter, metodo, Pm, sigmaM);

fprintf('Seleccion: %s | d = %d | poblacion %d | %d iteraciones | Pm = %.2f | sigmaM = %.1f\n', metodo, d, nPob, nIter, Pm, sigmaM);
fprintf('Mejor individuo: %s\n', mat2str(x, 4));
fprintf('Mejor valor: %.6f | error respecto a 3 - e: %.2e | tiempo: %.4f s\n', fit, fit - (3 - exp(1)), t);

figure;
plot(0:nIter, hist, 'LineWidth', 1.5);
xlabel('Iteracion'); ylabel('Mejor valor encontrado');
title('Convergencia del algoritmo genetico (funcion Ackley)');
grid on;
