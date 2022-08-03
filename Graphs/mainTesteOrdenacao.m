#Grau de "completude" - porcentagem de numeros 1 na matriz
#Se for grau de limpeza alterar sinal de > para <

g = 0.45 # 60% - 1, 40% - 0
m = 5

#Gera matriz 5x5
mat = ones (m, m);
[rows, columns] = size(mat);

for i = 1:rows
  for j = 1:columns
    if(rand() > g)
      mat(i,j) = 0;
    endif
  endfor
endfor

#Exibe matriz
mat

#Calcula posicao e grau dos vertices (retorna posicao|grau de cada vertice e o numero de linhas de mat)
[Posicao_Grau_ORIGINAL, rows] = CalcularGrau(mat);

disp("\n\n")

#Prints
Posicao_Grau_ORIGINAL
Ordenacao_Crescente  = OrdenarCrescente(mat)(:,1)
Ordenacao_Derescente = OrdenarDecrescente(mat)(:,1)
Ordenacao_Aleatoria  = OrdenarAleatorio(mat)(:,1)


