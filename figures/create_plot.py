from matplotlib import pyplot as plt
from math import tanh

x_points = list(range(-20, 20))
y_points = [tanh(x/10)+1.1 for x in x_points]

plt.xlabel("StackOverflow questions viewed")
plt.ylabel("Programming knowledge")

plt.title("The effect of StackOverflow on programming knowledge")

plt.plot(x_points, y_points, linewidth=2)

plt.xticks([])
plt.yticks([])

plt.show()
