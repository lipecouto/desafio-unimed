class Conta:
    def __init__(self, agencia, saldo = 0, credito=0):
      self.saldo = saldo
      self.agencia = agencia
      self._credito = credito
    
    @classmethod
    def criar_conta_premium(cls, agencia, saldo = 0, credito = 0): #Cria um metodo "de fábrica" que aponta para classe, por convenção a forma de passar a clase é usar cls
        agencia = agencia
        saldo = 100000
        credito = saldo * 0.15
        return cls(agencia, saldo, credito)
    
    
    @property #property são os gettes 
    def credito(self):
      return self._credito or 0

    @credito.setter #estes são os setters do atributo _credito *por convencao um atribuito com _ na frente é protegido*
    def credito(self, valor):
      _credito = self._credito or 0
      _valor = valor or 0
      self._credito = _credito + _valor

    @credito.deleter
    def credito(self):
        self._credito = 0

    def depositar(self, valor):
        self.saldo += valor
    
    def sacar(self, valor):
        self.saldo -= valor
    
    def mostras_saldo(self):
        return self.saldo


conta = Conta("01010", 100)
conta.depositar(200)
print(conta.mostras_saldo())
conta.credito = 1000
print(conta.credito)
del conta.credito
print(conta.credito)