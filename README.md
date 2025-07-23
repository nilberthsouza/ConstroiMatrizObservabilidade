# Gerador de Matriz de Observabilidade para Sistemas de Potência

Este script MATLAB gera a **matriz de observabilidade** de um sistema elétrico de potência a partir da topologia da rede (conexões entre barras).

## 🔧 Como funciona

1. O script importa os dados de um sistema de potência através da variável `caso`.
2. Cria uma matriz de observabilidade baseada nas conexões entre as barras (matriz identidade + vizinhança).
3. Adiciona opcionalmente uma coluna de zeros à esquerda.
4. Exporta a matriz resultante para um arquivo `.m`.

O nome do arquivo gerado será automaticamente o nome do caso com um `P` no final.  
**Exemplo:**  
Entrada: `caso = 'casoieee14'`  
Saída: `casoieee14P.m`

## 📌 Observações

- A primeira coluna da matriz (`Obs`) contém zeros e pode ser removida caso seu código não precise dela.
- Para remover, basta comentar esta linha no código:
  
```matlab
Obs = [zeros(Num_Barras,1), Obs];
