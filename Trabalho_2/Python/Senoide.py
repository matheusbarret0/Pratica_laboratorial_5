import numpy as np
import matplotlib.pyplot as plt

# Parâmetros da senoide
amplitude = 1
frequencia = 1
num_bits = 12

# Calcula os valores da senoide
tempo = np.linspace(0, 1, num=2**num_bits)
senoide = (1 + amplitude * np.sin(2 *np.pi * frequencia * tempo))

# Converte os valores para ponto fixo
ponto_fixo = (senoide * (2**(num_bits-1) - 1)).astype(int)

# Converte os valores para hexadecimal com o formato "0xXXX"
hexadecimal = [format(value, '03x') for value in ponto_fixo]

# Salva os valores em um arquivo, limpando o conteúdo anterior
arquivo = r"C:\Users\mathe\OneDrive\Documentos\Projetos\Trabalho_2\ModelSim\seno.txt"
with open(arquivo, "w") as file:
    file.write("\n".join(hexadecimal))

print(f"Senoide salva em {arquivo}.")

# Plot da senoide
plt.figure(facecolor='white') 
plt.plot(tempo, senoide, color='green')
plt.xlabel('Tempo')
plt.ylabel('Senoide')
plt.title('Gráfico da Senoide')
plt.grid(True, color='black')
plt.show()
