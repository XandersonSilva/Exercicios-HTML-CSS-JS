<?php 
declare(strict_types=1);//Esse comando torna possivel definir explicitamente o tipo de dados ─ Diponivel a partir do PHP 7.0

function faz_algo1(int $entrada): string
{
    return $entrada = '' . $entrada;
}

/*
Como visto na função acima ela trabalhara somente 
somente com variaveis  do tipo int  e tera saidas 
somente do tipo string. 
*/

$Texto = faz_algo1(45);
#$tipo = var_dump($Texto);
echo $Texto ;

function faz_algo2(?int $entrada): ?string 
{
    return $entrada = '' . $entrada;
}

/*
A função acima com sintaxe funcional a partir do
PHP 7.1 trabalhara somente somente com variaveis 
do tipo int e null  sendo suas saidas  possiveis
null e do tipo string. 
*/

$Texto = faz_algo2(null);
#$tipo = var_dump($Texto);
echo $Texto ;

function faz_algo3(int|string|null $entrada): ?string 
{
    return $entrada = '' . $entrada;
}

/*
A função acima com sintaxe funcional a partir do
PHP 8.0 trabalhara somente somente com variaveis 
do tipo  int,  string e  null sendo  suas saidas  
possiveis null e do tipo string. 
*/

$Texto = faz_algo3('Texto');
#$tipo = var_dump($Texto);
echo $Texto ;
