function mat = CriarMatrizNaoDirecionadaSemPeso(n, preenchimento)
  mat = zeros(n);
  for i = 1:n
    for j = i+1:n
      if rand() < preenchimento
        mat(i,j) = 1;
        mat(j,i) = 1;
      endif
    endfor
  endfor

endfunction
