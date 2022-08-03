function validateColoring(mtx, colors)
  % Verifica se matriz eh quadrada
  if(rows(mtx) != columns(mtx))
    disp("Matrix is not square")
    return
  endif
  n = rows(mtx);
  % Verifica se vetor de cores tem o tamanho correto
  if(n!=length(colors))
    disp("Colors vector does not have the right size")
    return
  endif
  % Verifica se todos os vertices foram coloridos
  if any(colors == 0)
    disp("Vertex is not colored")
    return
  endif
  % Iteracao para verificar a cor dos vizinhos
  for i = 1:n
    cor_atual = colors(i);
    for j = 1:n
      % Caso seja o mesmo vertice
      if i == j
        continue
      endif
      % Verifica se vizinho
      if(mtx(i,j)!=0)
        % verifica cor do vizinho
        if(cor_atual == colors(j))
          disp("Adjacent vertex with same color!");
          return
        endif
      endif
    endfor
  endfor
  disp("Valid coloring")
endfunction
