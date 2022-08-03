from IPython.display import display
import PySimpleGUI as sg
from matplotlib.pyplot import fill
import pandas as pd
import os
import numpy
import matplotlib.pyplot as plt

global heuristic_names,xmax
heuristic_names = ["Decrescente", "Crescente", "Aleatória"]
xmax = [31, 41, 56]
xtick = [2, 2, 2]

def readData(fill_levels=[50,70,90], sizes=[10,50,100], n_matrix=100, n_heuristicas=3):
	p = 1
	cwd = os.getcwd()
	AlldataframeFill = []

	#Percorre todos os niveis de preenchimento
	for i_f, fill_level in enumerate(fill_levels):
		dataframeFill = []
		#Cria um dataframe vazio para cada heuristica nesse nivel de preenchimento
		for h in range(n_heuristicas):
			dataframeFill.append(pd.DataFrame())

		#Percorre todos os tamanhos daquele nivel de preenchimento
		for i_s,size in enumerate(sizes):
			ResultHeuristic = []
			#Percorre todas as matrizes daquele tamanho
			for i in range(n_matrix):
				resList = []

				#Monta o caminho para cada arquivo txt
				path = cwd + '/dados/' + f'{size}_{fill_level}/' + f'matriz_{i+1}.txt'
				#Armazena todo o dataframe
				df1 = pd.read_csv(path, sep=",", header=None)

				#Seleciona apenas as ultimas 3 linhas (resultado da coloracao em cada heuristica)
				#Linha 0: grau decrescente 
				#Linha 1: grau crescente
				#Linha 2: grau aleatorio
				df2 = df1.tail(n_heuristicas)
				
				#Lista que armazena: [maxH1, MaxH2, MaxH3]
				for j in range(n_heuristicas):
					resList.append(max(df2.iloc[j]))

				#Lista de listas que armazena:	[maxH1_matriz1, MaxH2_matriz1, MaxH3_matriz1]
				#								[maxH1_matriz2, MaxH2_matriz2, MaxH3_matriz2]
				#								...
				ResultHeuristic.append(resList)

			
			for h in range(n_heuristicas):
				#converte a lista para numpy array para acessar todas as colunas de uma unica vez
				array = numpy.array(ResultHeuristic)
				
				name = str(size) + " Vértices"
				dataframeFill[h][name] = array[ : , h].tolist()
				
		#fig, (ax1, ax2, ax3) = plt.subplots(3)
		#ax = [ax1, ax2, ax3]


		for s in range(n_heuristicas):
			titlefig = "Médias da Heurística " + heuristic_names[s] + " - Preenchimento " + str(fill_level)
			dataframeFill[s].plot(	kind='hist', 
									alpha=0.7,
									#bins=int(xmax[i_f]//1.5),
									title=titlefig + "%\n",
									grid=True,
									figsize=(12,8),
									fontsize=12,
									xlim=(0,xmax[i_f]-1),
									ylim=(0,1.1),
									xticks=range(0,xmax[i_f]+xtick[i_f],xtick[i_f]),
									yticks=range(0,100,10)
									)
			
			#display("\n" + titlefig)
			#display(dataframeFill[s].mean())
		
			plt.xlabel("\nNúmero de Cores Necessárias", fontsize = 15)
			plt.ylabel("Frequência\n", fontsize = 15)

			plt.savefig(titlefig+'.png')
			
		#plt.show()
	
readData()