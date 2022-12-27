num = []
for c in range(10):
    num.append(float(input("Digite um numero para adiciona-lo a lista: \n")))
print("A lista possui os seguintes valores:")
for c in range(9, -1, -1):
    print(num[c])
