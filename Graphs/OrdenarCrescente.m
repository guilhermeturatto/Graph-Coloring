function ret = OrdenarCrescente(mat)
  #Descobre o grau de cada vertice na posição original da matriz
  [grauVertice, rows] = CalcularGrau(mat);

  #Ordena as linhas de forma crescente de acordo com os valores da 2a coluna (graus dos vertices)
  ret = sortrows (grauVertice, 2);

endfunction

