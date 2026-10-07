function imprimir_estudio_ackley(titulo, etiquetas, res, archivoCSV)
% IMPRIMIR_ESTUDIO_ACKLEY  Muestra los resultados en la ventana de comandos y
% los guarda en un archivo CSV (separador ';') para copiarlos a la tabla.

fprintf('\n%s\n', titulo);
fprintf('%-18s | %-10s | %-10s | %-10s | %-10s | %-10s | %s\n', 'Escenario', 'Tiempo (s)', 'Mejor', 'Media', 'Desv. est.', 'RMSE', 'Mejor individuo');
fprintf('%s\n', repmat('-', 1, 120));
fid = fopen(archivoCSV, 'w');
fprintf(fid, 'Escenario;Tiempo medio (s);Mejor valor;Media;Desviacion estandar;RMSE;Mejor individuo\n');
for q = 1:numel(res)
    x = sprintf('%.4f ', res(q).x);
    x = strtrim(x);
    if numel(res(q).x) > 5
        xcorto = [sprintf('%.4f ', res(q).x(1:5)) '...'];
    else
        xcorto = x;
    end
    fprintf('%-18s | %-10.4f | %-10.4f | %-10.4f | %-10.4f | %-10.4f | %s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, res(q).rmse, xcorto);
    fprintf(fid, '%s;%.4f;%.4f;%.4f;%.4f;%.4f;%s\n', etiquetas{q}, res(q).tiempo, res(q).mejor, res(q).media, res(q).desv, res(q).rmse, x);
end
fclose(fid);
fprintf('\nResultados guardados en %s\n', archivoCSV);
end
