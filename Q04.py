ida = []
maior = 0
menor = 0
ida.append(int(input("Digite a idade da 1° pessoa")))
maior = ida[0]
menor = ida[0]
for c in range(1, 20):
    ida.append(int(input("Digite a idade da {}° pessoa".format(c + 1))))
    if ida[c] > maior:
        maior = ida[c]
    if ida[c] < menor:
        menor = ida[c]
print("A pessoa mais velha tem {} anos e a mais nova tem {} anos!".format(maior, menor))