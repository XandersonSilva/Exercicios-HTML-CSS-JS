<?php
$PROCESSO = 2588;
$cont = 0 ;
while ( $cont != 11 ) {
    echo "<p>contador igual a $cont \n</p>";
    $cont += 1 ;
}

do {
    echo "<p>contador igual a $cont \n</p>";
    $cont += 1 ;
} while($cont != 13);
#Executa o bloco de comandos ao menos uma vez para verificar a condição

$x = 10;
while($x++ <= 10) 
    echo "<p>Execução do while \n</p>";
do 
    echo "<p> Execução do do-while \n</p>";
while($x++ <= 10);

for ($c = 0;$c <= 100;$c++)
    echo "<p> $c ° execução do for! \n</p>";

$limit = 10;

for ($i = 0; $i < $limit; $i++){

    echo $i, PHP_EOL;

    for ($j = $limit; $j > 0; $j--){

        if ($i == $j)

            break 2;

        }

}