function ret = OrdenarAleatorio(mat)
  #Descobre o grau de cada vertice na posição original da matriz
  [ordemVertice, rows] = CalcularGrau(mat);

  #Cria uma matriz com uma coluna adicional com valores randomicos
  #Os vertices serao ordenados de acordo com essa coluna adicional
  aux = zeros(rows,3);

  #Primeiras duas colunas igual a matriz de posicao/grau original
  aux(:,1:2) = ordemVertice;
  #Terceira coluna com valores aleatorios
  aux(:,3) = rand(rows,1);

  #Ordena as linhas de acordo com os valores da 3a coluna
  ret = sortrows(aux, 3);

  #Remove a 3a linha auxiliar para retornar
  ret = ret(:,1:2);

endfunction
