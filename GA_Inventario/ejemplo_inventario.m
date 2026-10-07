% EJEMPLO_INVENTARIO  Una ejecucion del algoritmo genetico de inventarios.
clear; clc; rng(1);
[x, f, hist, t] = algoritmo_genetico_inventario(60, 100, 'elitismo', 0.1, 0.1);
par = inventario_datos();
fprintf('Mejor Z (ventas no atendidas esperadas): %.4f   (%.3f s)\n', f, t);
fprintf('Q: %s\n', sprintf('%.1f ', x(1:5)));
fprintf('S: %s\n', sprintf('%.1f ', x(6:10)));
fprintf('K: %s\n', sprintf('%.1f ', x(11:15)));
fprintf('Restriccion sum(Q/2+S) = %.6f (I = %d)\n', sum(x(1:5)/2) + sum(x(6:10)), par.I);
plot(0:numel(hist)-1, hist, 'LineWidth', 1.5); grid on;
xlabel('Iteracion'); ylabel('Mejor Z'); title('Convergencia - inventarios');
