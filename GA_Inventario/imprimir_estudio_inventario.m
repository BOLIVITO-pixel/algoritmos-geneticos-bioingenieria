function imprimir_estudio_inventario(titulo, etiquetas, res, archivoCSV)
% IMPRIMIR_ESTUDIO_INVENTARIO  Muestra los resultados en la ventana de comandos
% y los guarda en un archivo CSV (separador ';') para copiarlos a la tabla.
% El mejor individuo se escribe completo: Q1..Q5, S1..S5, K1..K5.

fprintf('\n%s\n', titulo);
fprintf('%-18s | %-10s | %-10s | %-10s | %-10s | %s\n', 'Escenario', 'Tiempo (s)', 'Mejor Z', 'Media', 'Desv. est.', 'Mejor individuo (Q1..Q5 | S1..S5 | K1..K5)');
fprintf('%s\n', repmat('-', 1, 130));
fid = fopen(archivoCSV, 'w');
fprintf(fid, 'Escenario;Tiempo medio (s);Mejor valor;Media;Desviacion estandar;Mejor individuo\n');
for q = 1:numel(res)
    x = res(q).x;
    xtxt = [sprintf('%.1f ', x(1:5)) '| ' sprintf('%.1f ', x(6:10)) '| ' sprintf('%.1f ', x(11:15))];
    xtxt = strtrim(xtxt);
    fprintf('%-18s | %-10.4f | %-10.4f | %-10.4f | %-10.4f | %s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, xtxt);
    fprintf(fid, '%s;%.4f;%.4f;%.4f;%.4f;%s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, xtxt);
end
fclose(fid);
fprintf('\nResultados guardados en %s\n', archivoCSV);
end
