#%%
import control as ct
import matplotlib.pyplot as plt
import numpy as np

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%
# Parameters van die stelsel
b = 10
ζ = 0.707
ωn = 4

KP = 886
KI = 0
KD = 0


#%%
# Definieer oordragsfunksie H
s = ct.tf('s')

proses = 1/(s*(s + b)*(s + 2*ζ*ωn))
beheerder = KP + KI/s + KD*s 

totalestelsel = beheerder*proses
print(totalestelsel)

# Gee die stelsel negatiewe terugvoer
sys = ct.feedback(totalestelsel)
print(sys)
# %%
# %%
# Plot staprespons van die stelsel:
t = np.linspace(0, 2, 1000)  
t, y = ct.step_response(sys, T = t)

# 3. Teken die grafiek
plt.figure(figsize=(8, 5))
plt.plot(t, y, label='Staprespons', color='blue', linewidth=2)

# Voeg 'n horisontale lyn by vir die finale waarde (steady-state)
plt.axhline(y=ct.dcgain(sys), color='red', linestyle='--', label='Finale Waarde')

# Voeg as-etikette en 'n rooster by
plt.title('Staprespons van die Stelsel')
plt.xlabel('Tyd (s)')
plt.ylabel('Amplitude')
plt.grid(True, which='both', linestyle='--', alpha=0.5)
plt.legend()
plt.show()


plt.show()
ct.step_info(sys)
# %%
# Parameters van die stelsel:  Ziegler-Nichols instemming
b = 10
ζ = 0.707
ωn = 4

KP = 370
KI = 100
KD = 60


#%%
# Definieer oordragsfunksie H
s = ct.tf('s')

proses = 1/(s*(s + b)*(s + 2*ζ*ωn))
beheerder = KP + KI/s + KD*s 

totalestelsel = beheerder*proses
print(totalestelsel)

# Gee die stelsel negatiewe terugvoer
sys = ct.feedback(totalestelsel)
print(sys)
# %%
# %%
# Plot staprespons van die stelsel:
t = np.linspace(0, 2, 1000)  
t, y = ct.step_response(sys, T = t)

# 3. Teken die grafiek
plt.figure(figsize=(8, 5))
plt.plot(t, y, label='Staprespons', color='blue', linewidth=2)

# Voeg 'n horisontale lyn by vir die finale waarde (steady-state)
plt.axhline(y=ct.dcgain(sys), color='red', linestyle='--', label='Finale Waarde')

# Voeg as-etikette en 'n rooster by
plt.title('Staprespons van die Stelsel')
plt.xlabel('Tyd (s)')
plt.ylabel('Amplitude')
plt.grid(True, which='both', linestyle='--', alpha=0.5)
plt.legend()
plt.show()


plt.show()
ct.step_info(sys)
# %%
