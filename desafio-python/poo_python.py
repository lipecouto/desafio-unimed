##criando classes

class Bicicle: #sempre é necessário usar o self para cada método da classe, já que ele é a instancia do objeto
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
        self.marcha = 1
    
    def buzinar(self):
        print("trim trim")
    
    def correr(self):
        print("Correndo")
    
    def parar(self):
        print("Parada")
    

    def __str__(self): #retorna os atributos da classe de forma dinâmica.
        return f"{self.__class__.__name__}: {', '.join([f'{chave} = {valor}' for chave, valor in self.__dict__.items()])}"


bike = Bicicle("Vermelha", "Mountain Bike", 2022, 1000)

bike.correr()
bike.parar()
bike.buzinar()

print(bike)

#conceito de herança em python

class BBike(Bicicle): #Bbike recebe herança de Bicicle
    pass

class BCBike(Bicicle, BBike): #BCBike agora tem heranças multiplas.
    pass
    super().__init__() ## esse super vai buscar a implementação do pai.