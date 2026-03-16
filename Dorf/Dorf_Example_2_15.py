#%%
import control as ct
import matplotlib.pyplot as plt

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%
# Transfer function of G
# Numerator coefficients 
numg = [6, 0, 1]

# Denominator coefficients 
deng = [1, 3, 3, 1]

# Create the transfer function
G = ct.tf(numg, deng)

# Print the transfer function (nicely formatted in the console)
print(G)

# Bereken die zeros en pole van die stelsel
z = ct.zeros(G)
print(z)
p = ct.poles(G)
print(p)

#%%
# Transfer function of H
# Numerator coefficients 
numg = [6, 0, 1]

# Denominator coefficients 
deng = [1, 3, 3, 1]

# Create the transfer function
G = ct.tf(numg, deng)

# Print the transfer function (nicely formatted in the console)
print(G)

# %%
# Definieer oordragsfunksie H
s = ct.tf('s')
H = ((s + 1)*(s + 2))/((s + 2j)*(s - 2j)*(s + 3))
print(H)
# %%
sys = G/H
print(sys)

# Genereer die kaart
# As pzmap werk, hou daarby:
ct.pzmap(sys, grid=True) 
plt.title('Pool-Nulpunt Kaart')

plt.show()
# %%
# Plot staprespons van die stelsel:  Hierdie stelsel is nie stabiel nie.
t, y = ct.step_response(sys)

# 3. Teken die grafiek
plt.figure(figsize=(8, 5))
plt.plot(t, y, label='Staprespons', color='blue', linewidth=2)

# Voeg 'n horisontale lyn by vir die finale waarde (steady-state)
plt.axhline(y=ct.dcgain(G), color='red', linestyle='--', label='Finale Waarde')

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
