clear;
clc;

iter = 10;
result = [];
dia = datestr(now(),30);
mkdir('.',dia);

n = 100;
preenchimento = 0.5;

for i = 1:iter
  arquivo = [dia  '\matriz_' num2str(i) '.txt'];
  %preenchimento = 0.4*rand() + 0.5;
  mat = CriarMatrizNaoDirecionadaSemPeso(n, preenchimento);

  % ordem decrescente de grau
  vect_1 = transpose(OrdenarDecrescente(mat)(:,1));
  [n_cores_1, cor_vertice_1] = Colorir(mat, vect_1);
  validateColoring(mat, cor_vertice_1);

  % ordem crescente de grau
  vect_2 = transpose(OrdenarCrescente(mat)(:,1));
  [n_cores_2, cor_vertice_2] = Colorir(mat, vect_2);
  validateColoring(mat, cor_vertice_2);

  % ordem aleatoria de grau
  vect_3 = transpose(OrdenarAleatorio(mat)(:,1));
  [n_cores_3, cor_vertice_3] = Colorir(mat, vect_3);
  validateColoring(mat, cor_vertice_3);

  result(end+1,:)=[i, preenchimento, n_cores_1, n_cores_2, n_cores_3];
  mat(end+1,:)=cor_vertice_1;
  mat(end+1,:)=cor_vertice_2;
  mat(end+1,:)=cor_vertice_3;
  csvwrite(arquivo, mat);
endfor

csvwrite([dia '\result.csv'], result);

