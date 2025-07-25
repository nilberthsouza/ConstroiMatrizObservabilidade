%% Importa o banco de dados
clear;
clc;

caso = 'casoieee69';
[rede, barras, nomes, linhas] = feval(caso); 
Num_Barras = length(barras);

%% Cria a matriz de Observabilidade modificada
Obs = eye(Num_Barras);  % Matriz identidade inicial

for k = 1:size(linhas,1)
    i = linhas(k, 1);
    j = linhas(k, 2);
    Obs(i, j) = 1;
    Obs(j, i) = 1;
end

%% Adiciona uma coluna de zeros no início, tornando a matriz não quadrada
Obs = [zeros(Num_Barras,1), Obs];  % comente esta linha se seu código não precisa disso

%% Gera o nome do arquivo de saída automaticamente
nome_arquivo_saida = [caso 'P.m'];

% Exporta a matriz Obs para o novo arquivo
fid = fopen(nome_arquivo_saida, 'w');  % Abre o arquivo para escrita

for i = 1:size(Obs,1)
    fprintf(fid, '%g ', Obs(i,:));  % Escreve a linha com valores separados por espaço
    fprintf(fid, '\n');             % Pula para a próxima linha
end

fclose(fid);  % Fecha o arquivo
