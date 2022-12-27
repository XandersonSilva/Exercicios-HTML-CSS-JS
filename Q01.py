numeros = []
for c in range(5):
    numeros.append(int(input("Digite um numero para adicionalo a lista: \n")))
for c in range(5):
    print("O número {} é o {}° número e na lista tem o indice {}".format(numeros[c], c + 1, c))
