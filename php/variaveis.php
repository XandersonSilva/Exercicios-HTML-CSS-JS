<?php

$num= 34;
$boleano=true;
$texto="Olá mundo";
$flutuante=1.5;
echo <<<Texto
<p>Isso é uma variavel numerica inteira com o valor: $num </p>
<p>Isso é uma variavel numerica de ponto flutuante com o valor: $flutuante </p>
<p>Isso é uma variavel do tipo texto com o conteudo: $texto </p>
<p>Isso é uma variavel boleana de valor: $boleano </p>
Texto;

//Variaveis variaveis

$a = "ola";
$$a = " mundo<br>";

echo $a  ; 
echo $$a ; // Equivale ao proximo echo
echo $ola; 

//interpolação de srings 

$nome = 'Cacatua amarela';
echo 'O nome informado é ' . $nome . '<br>'; //aspas simples não possuem interpolação de strings
echo "O nome informado é $nome <br>"; //aspas duplas permitem a interpolação de strings

//interpolação de Variaveis variaveis

echo "$a $$a"; //Isto não é o mesmo que... 
echo "$a {$$a}";//Neste temos a saida do valor da variavel variavel

//Tambem é possivel aniquilar o valor de uma variavel usando o comando unset()
unset($a);
