<?php
//const CONSTANTE = 'Isso é uma constante'; #Válido desde PHP 5.6 e inválido anteriormente
define('CONSTANTE', 'Isso é uma constante' ); #Válido em todas as versões do php

echo CONSTANTE;
//echo $CONSTANTE; # Isso não funciona como na linha anterior

