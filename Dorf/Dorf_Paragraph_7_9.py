#%%
import control as ct
import matplotlib.pyplot as plt

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%

# Definieer oordragsfunksie H
s = ct.tf('s')
sys = (s + 1)/(s*(s + 2)*(s + 3))
print(sys)
# %%
# 2. Teken die wortel-lokus
ct.root_locus(sys)

# 3. Wys die grafiek
plt.title("Wortel-lokus Metode")
plt.grid(True)
plt.show()
# %%
