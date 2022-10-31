letra = "N"

dict = {"A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26} 

print(dict.get(letra))



# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
salario = int(input()) 

# TODO:  Calcule o salário do funcionário e print o novo salário, bem como o valor de reajuste ganho e o índice reajustado (em porcentagem)

perc_a = 0.17
perc_b = 0.13
perc_c = 0.12
perc_d = 0.10
perc_e = 0.05

if (salario <= 600):
  calcula_salario(salario, perc_a)
elif (salario > 600 and salario <= 900):
  calcula_salario(salario, perc_b)
elif (salario > 900 and salario <= 1500):
   calcula_salario(salario, perc_c)
elif (salario > 1500 and salario <= 2000):
   calcula_salario(salario, perc_d)
else: 
   calcula_salario(salario, perc_e)

def calcula_salario(salario, perc):
    novosalario = (salario + (salario * perc))
    #novosalario = format(novosalario, ".2f")
    reajuste = (salario * perc) 
    #reajuste = format(reajuste, ".2f")
    _perc = (perc * 100)
    
    print(f"Novo salario: {novosalario:.2f}\n Reajuste ganho: {reajuste:.2f}\n Em percentual: {int(_perc)} %")
   