#Extract, Transform, Load
import pandas as pd
from sklearn.datasets import make_regression
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt

#criando modelo de regressao linear
x,y = make_regression(n_samples = 200, n_features=1, noise=30)

plt.scatter(x,y)

modelo = LinearRegression()
modelo.fit(x,y)

plt.plot(x, modelo.predict(x), color='red', linewidth=3)
plt.show()
