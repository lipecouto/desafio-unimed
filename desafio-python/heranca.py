class Animal():
    def __init__(self, nro_patas):
        self.nro_patas = nro_patas
    
    def __str__(self): #retorna os atributos da classe de forma dinâmica.
        return f"{self.__class__.__name__}: {', '.join([f'{chave} = {valor}' for chave, valor in self.__dict__.items()])}"

class Mamifero(Animal):
    def __init__(self, cor_pelo, **kwargs):
        self.cor_pelo = cor_pelo
        super().__init__(**kwargs)
    

class Ave(Animal):
    def __init__(self, cor_bico, **kwargs):
        self.cor_bico = cor_bico
        super().__init__(**kwargs)

class Cat(Mamifero):
    pass

class Ornitorinco(Mamifero, Ave):
    pass


#gato = Cat(4, 'preto')
#print(gato)

orni = Ornitorinco(nro_patas=2, cor_pelo='amarelo', cor_bico='preto')
print(orni)

