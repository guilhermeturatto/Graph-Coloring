function [n_cores, cor_vertice] = Colorir(mat, vect)
  if rows(mat)!=columns(mat)
    disp("Matriz nao quadrada")
    return
  endif
  n = rows(mat);
  if n != columns(vect)
    disp("Numero invalido de vertices")
    return
  endif
  cor_vertice = zeros(1,n);
  n_cores = 0;

  % itera em vect
  for i = 1:n
    vertice_atual = vect(i);
    cores_adjacentes = [];

    % itera nas colunas de mat
    for j = 1:n
      % procura vizinhos
      if mat(vertice_atual, j) == 1
        % checa as cores
        if cor_vertice(j) != 0
          cores_adjacentes(1, end+1) = cor_vertice(j);
        endif
      endif
    endfor

    % encontra a primeira
    cor = 1;
    while any(cores_adjacentes == cor)
      cor = cor + 1;
    endwhile
    cor_vertice(vertice_atual) = cor;

    % Se criou uma nova cor
    if n_cores < cor
      if n_cores + 1 != cor
        disp("Erro")
      endif
      n_cores = n_cores + 1;
    endif
  endfor

endfunction
