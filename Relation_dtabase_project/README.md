# Desafio unimed E-Commerce  e Oficina

## Explicação do modelo ER
##### Philipe Couto

--------------------------------

O modelo ER abaixo representa a ideia de um E-commerce.

#### A entidade Parceiro:
Esta entidade contém os campos que são necessários para realização do cadastro de parceiros, compreende-se como parceiro todos aqueles que compram, vendem e fornecem itens para o e-commerce.

O campo que realiza a distinção destes parceiros é o campo tipoparceiro tratado como inteiro sendo que os valores vão indicar 1 para clientes, 2 para fornecedores e 3 para vendedores parceiros, desta forma, caso surgam novos parceiros será sempre possível classifica-los dentro da mesma tupla de dados.

#### A entidade TipoPag
Esta entidade é reservada para registrar os tipos de pagamentos que podem ser utilizados na plataforma do e-commerce e está diretamente relacionada com a tapela de pedidos, ela também contem uma ligação com a tabela ParcelasTipoPag que defiem a quantidade de parcelas um determinado tipo de pagamento pode ter, por exemplo clientes distintos pode escolher pagar com um cartão mas em quantidade de parcelas distintas.

### A entidade Estoque
Nesta entidade estão contidos os atributos que servem para identificar o estoque de um produto de acordo com seu local, controle e código de barras, o controle da quantidades, definindo se abastem ou saem do estoque é definido pelo campo atualizaEstoque da tabela de itens do pedido com base no tipo de pedido que está sendo realizado.

### A entidade Pedidos 
A entidade de pedidos foi pensada para ser universal podem tanto receber pedidos de venda como pedidos de compra de determinados produtos e o tipo de movimento servirá para deteminar a orientação dos itens que compem este pedido.

### A entidade Financeiro
A entidade financeiro, apensar de não ter sido descrita na atividade, me pareceu necessária para melhor exemplificar como os registros de contas a pagar e receber com base nos pedidos, deveriam ser dispostos. 


----------------------------------------------------------------

O Modelo ER da Oficiona

### As principais entidades
O modelo está no geral, nem simples.

A entidade parceiro_mec foi criada para atender aos requisitos do desafio e está ligada com a tabela equipe para que seja possível na OS, selecionar uma equipe que pode conter um ou mais mecânicos.

Eu fiz uma divisão entre serviço e itens separando as entidades para que cada item possa ter seu controle de estoque e cada serviço possa ter um valor relacionado ao tipo de serviço prestado na entidade tabela de preço. A composição dos serviços mais os itens seria o total da OS, também adicionei uma entidade financeiroOS para itenficiar alguns dados relacionados somente ao financeiro. A aplicação retornaria o valor do serviço de acordo com a tabela de preço definida para o serviço.