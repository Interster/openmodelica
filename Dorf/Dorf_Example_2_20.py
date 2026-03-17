#%%
import control as ct
import matplotlib.pyplot as plt

# Wys die weergawe van die beheerpaket
print(ct.__version__)

#%%
num = [5400]
den = [2, 2.5, 5402]
sys = ct.tf(num, den)

print(sys)
# %%
# %%
# Plot staprespons van die stelsel:  Hierdie stelsel is nie stabiel nie.
t, y = ct.step_response(sys)

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
