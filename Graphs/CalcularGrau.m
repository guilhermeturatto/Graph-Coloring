function [grauVertice, rows] = CalcularGrau(mat)
  rows             = rows(mat);      #Le o tamanho da matriz
  grauVertice      = zeros(rows,2);  #Cria vetor 2D para armazenar o grau e posicao de cada vertice
  grauVertice(:,1) = (1:rows);       #Coloca a posicao dos vertices na 1a coluna

  for i = 1:rows                #Para cada linha:
    for j = 1:rows
      if(mat(i,j) == 1)         #Se o valor da coluna dor 1, incrementa grau
        grauVertice(i,2) += 1; #Coloca o grau dos vertices na 2a coluna
      endif
    endfor
  endfor

  #Exemplo de retorno:
  # posicao original   | grau
  #         1          |   3
  #         2          |   4
  #         3          |   1
  #         4          |   2
  #         5          |   0

endfunction
