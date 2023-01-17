<?php
//Converção de string para inteiro

use function PHPSTORM_META\type;

$idade = "25";
//$idade = intval($idade); //Converte para o tipo int ou inteiro
//var_dump($idade); #Exibe o tipo da variavel
if (is_int($idade)){
    echo "A variavel é do tipo int";
} else {
    echo 'A variavel é do tipo: ';
    var_dump($idade); 
}
 
