function imprimir_estudio(titulo, etiquetas, res, archivoCSV)
% IMPRIMIR_ESTUDIO  Muestra los resultados en la ventana de comandos y los
% guarda en un archivo CSV (separador ';') para copiarlos a la tabla del informe.

fprintf('\n%s\n', titulo);
fprintf('%-14s | %-12s | %-10s | %-10s | %-10s | %s\n', 'Escenario', 'Tiempo (s)', 'Mejor', 'Media', 'Desv. est.', 'Mejor individuo');
fprintf('%s\n', repmat('-', 1, 110));
fid = fopen(archivoCSV, 'w');
fprintf(fid, 'Escenario;Tiempo medio (s);Mejor valor (min);Media (min);Desviacion estandar (min);Mejor individuo\n');
for q = 1:numel(res)
    ruta = regexprep(mat2str(res(q).ruta), '[\[\]]', '');
    fprintf('%-14s | %-12.4f | %-10d | %-10.1f | %-10.2f | %s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, ruta);
    fprintf(fid, '%s;%.4f;%d;%.1f;%.2f;%s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, ruta);
end
fclose(fid);
fprintf('\nResultados guardados en %s\n', archivoCSV);
end
