#Alvo da questão: Um script python que corrija um gabarito de x questões para um numéro n de alunos e informe se ele esta aprovado ou não tomando como nota minima para ser aprovado a metade do gabarito.

entrada = ['a','b','c','d','e'] #Respostas acitas.
gabarito = []
cont = 1
aluns = []
situ = []
alunos = ''
ques=[]
l_num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, '1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
res = ''
certas = 0
qcert=[]

print('='*35)
while True:
    sair = 's'
    res = input("Digite a resposta da questão {}:".format(cont)).lower()
    if res in entrada:
            gabarito.append(res)
    while res not in entrada:
        res = input("Digite a resposta da questão {}:".format(cont)).lower()
        if res in entrada:
            gabarito.append(res)
    print('='*35)
    

    sair = input("Deseja continuar?[S ou N]").lower()
    print('='*35)
    
    while sair != 'n' and sair != 's':
        sair = input("Deseja continuar?[S ou N]").lower()
        print('='*35)
    if sair == 'n':
        break
    
    sair = ' '
    cont += 1

while alunos not in l_num:
    sair = 0
    alunos = input("Informe a quantidade de alunos:\n")
    alunos = alunos.replace(" ", "")
    for c in range(0, len(alunos)):
        if alunos[c] in l_num:
            sair += 1
    if sair == len(alunos):
        break
    else:
        print("Apenas numeros são aceitos para a quantidade de alunos\n")
        alunos = input()
        alunos = alunos.replace(" ", "")
print('='*30)

alunos = int(alunos)
questões = len(gabarito) 

for c in range (0, alunos):
    aluns.append(input ('Informe o nome do {}° aluno: '.format(c+1)))
    print('='*50)
    for i in range (0, questões):
        x = input("Digite a resposta da questão {}:".format(i+1)).lower()
        while x not in entrada:
            x = input("Digite a resposta da questão {}:".format(i+1)).lower()
        ques.append(x)
        if ques[i] == gabarito[i]:
            certas += 1
    qcert.append(certas)
    if certas >= questões/2:
        situ.append("APROVADO")
    else:
        situ.append("REPROVADO")
    ques = []
    certas = 0

for c in range (0, alunos):
    print("o aluno: {} ,acertou {} questões e está {} ".format(aluns[c], qcert[c], situ[c] ))