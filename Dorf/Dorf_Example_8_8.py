#%%
import control as ct
import matplotlib.pyplot as plt

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%

# Definieer oordragsfunksie H
s = ct.tf('s')
K = 2
sys = K/(s*(s + 1)*(s + 2) + K)
print(sys)
# %%
# 2. Teken die Bode plot
ct.bode_plot(sys, dB=True, Hz=False, deg=True, margins = True)


# 3. Wys die grafiek
plt.grid(True)
plt.show()
# %%
