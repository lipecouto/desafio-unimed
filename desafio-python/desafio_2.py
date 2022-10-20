curso = "    Python "

#strip serve para remover caracteres em branco de uma string, e pode ser Lstrip ou Rstrip referenciado o lado que deseja remover os dados.

#center serve para centralizar uma string dentro de um tamanho de strig passado no primeiro parametro, segundo parametro serve para informar qual caracter deseja nos 
#campos que excedem o tanho da string

#join serve para adicionar um valor entre cada letra de uma determinada string

#f-string é a melhor forma de interpolar string com variáveis, (f"Eu sou fulano e tenho {idade}")

valores = input().split()

#TODO:  Calcule a média de cachorros quentes consumidas por participante e imprima o valor com DUAS casas decimais.

media = (float(valores[0])/float(valores[1]))

print(f'{media:.2f}')