notas = []
nt = 0
for c in range(4):
    notas.append(float(input("Digite a {}° nota do aluno: \n".format(c + 1))))
    nt += notas[c]
media = nt/4
print("O aluno possui as notas {}; {}; {}; {}; e a media {:.1f}".format(notas[0], notas[1], notas[2], notas[3], media))
