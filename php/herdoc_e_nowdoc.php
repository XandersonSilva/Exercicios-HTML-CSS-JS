<?php
echo <<<Paragrafo
<p> Esse é um testo em múltiplas linhas</p>
<p>Deve começar com <<< e um marcador</p>
<p style="color:red;">E finalizar com o marcador em uma nova linha </p>
<p>Seguido de ponto e vígula.</p>
Paragrafo;

//Tambem pode ser feito dessas maneiras:

# nowdoc: aspas simples
/*
<?php
echo <<<'Paragrafo'
<p>Esse é um testo em múltiplas linhas</p>
<p>Deve começar com <<< e um marcador entre aspas simples</p>
<p>E finalizar com o marcador em uma nova linha </p>
<p>Seguido de ponto e vígula.</p>
Paragrafo;
*/

/*
<?php
echo '
<p>Esse é um testo em múltiplas linhas</p>
<p>Deve começar com <<< e um marcador</p>
<p>E finalizar com o marcador em uma nova linha </p>
<p>Seguido de ponto e vígula.</p>';
*/

#Sendo este ultimo não recomendado pela possibilidade de conflito entre chaves.