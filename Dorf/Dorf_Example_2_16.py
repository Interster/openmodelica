#%%
import control as ct
import matplotlib.pyplot as plt

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%
numg = [1]
deng = [500, 0, 0]
sysg = ct.tf(numg, deng)

numh = [1, 1]
denh = [1, 2]
sysh = ct.tf(numh, denh)

# Verbind die beheerder en die stelsel in series
sys3 = ct.series(sysg, sysh)
print(sys)

# Gee die stelsel negatiewe terugvoer
sys = ct.feedback(sys3, -1)
print(sys)
# %%
