<?php

if (1 + 3 == 4)//estrutura sem as chaves é ultilizada para executar penas um comando. 
    echo '<p>"A primeira verificação é verdadeira!"</p>';
$var = 7;
if ( 3 + $var == 10) {
    echo '<p>"A segunda verificação é verdadeira!"</p>';
} 

if ( 3 - $var == 10) 
{
    echo '<p>A terceira verificação é</p>';
    echo " verdadeira";
} 
else 
    echo '<p>"A terceira verificação é falsa"</p>';

if ( 3 - $var == 10) 
{
    echo '<p>"A quarta verificação é"</p>';
    echo " verdadeira";
}
elseif ($var != 0)
    echo '<p>"A variavel é diferente de zerro"</p>';
else{ 
    echo '<p>"A quarta verificação "</p>';
    echo '<p>"é falsa"</p>';
}
$usuario = '<p>"admin"</p>';
$tipoUsuario = isset($usuario) ? $usuario : '<p>"A varivel é diferente de 7"</p>'; //condicional com operador ternario
echo $tipoUsuario;
echo $var != 7 ? 
    "<a href='perfil.php'>O numero é, 7</a>" :
    "<a href='cadastro.php'>O numero é $var</a>";

switch(($var * 8)/ 4){
    case 34:
        echo '<p>"valor incorreto"</p>';
        break;
    case 14:
        echo '<p>"valor correto"</p>';
        break;
    case 47:
        echo '<p>"valor incorreto"</p>';
        break;
    case 76:
        echo '<p>"valor incorreto"</p>';
        break;
    default:
        echo '<p>"valor incorreto"</p>';
}
/*
 *Estrutura Switch usa  uma comparação frouxa para 
 *executar um bloco  de codigo se um falor é igual 
 *a um dos cassos e se for não ele execuda o bloco 
 *default.
 *Ps. O ultimo case não necessita do comando break
 */

echo match($var) {
    3 => '<p>"valor 3 informado"</p>' ,
    5 => '<p>"valor 5 informado"</p>' ,
    7 => '<p>"valor 7 informado"</p>' ,
    default => '<p>"valor incorreto"</p>' ,
};
/*
 *Estrutura match usa  uma comparação extrita para 
 *executar um bloco  de codigo se um valor é igual 
 *a um dos seus valores e se for não ele execuda o 
 *bloco  default,  além  disso  diferentimente  do 
 *switch ele retorna um valor podendo ser usado em
 *um echo, ser recebido por uma variavel etc.
 */
