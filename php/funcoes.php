<?php

#echo '<h1>Entendendo funções</h1>';
echo '<h2>Função sem argumento:</h2>';
function semParametros() {
    echo '<ul>
        <li><p>Executando função...</p></li>
    </ul>';
    }
semParametros();

echo '<h2>Função com argumento:</h2> ';

function saldacao($nome) {
    echo "<ul>
        <li>Olá $nome
    </ul>";
}
saldacao('Carlos');
saldacao('João');
saldacao('Maria');
saldacao('Susana');

echo '<h2>Função com três argumentos:</h2>';

function tresArgumentos($um, $dois, $tres) {
    return "<p>$um x $dois = $tres</p>";
}

for ($i = 1; $i <=10; $i++) {
    for ($c = 0; $c <=10; $c++) {
        $r = $i * $c;
        $resultado = tresArgumentos($i, $c,$r);
        echo "<ul><li>$resultado</ul>";
    }
}