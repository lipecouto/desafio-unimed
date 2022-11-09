# Explorando dados no AWS.

#### Neste desafio eu criei duas consultas diferentes das que foram propostas no exercicio.

##### Select do total da população de minas gerais agrupado por regiões.


```
SELECT health_region "Região", sum(population) AS "Populacão da Região" FROM "AwsDataCatalog"."populationdb"."population"
WHERE state = 'Minas Gerais'
GROUP BY health_region
ORDER BY 2 DESC

```



##### Select do total de população da região sudeste do país

```
SELECT sum(population)
FROM "AwsDataCatalog"."populationdb"."population"
WHERE state IN ('Minas Gerais', 'São Paulo', 'Rio Janeiro', 'Espirito Santo')

```