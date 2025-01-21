<?php
print("Hola mundo");

print "print() también funciona sin paréntesis.";

print "Esto separa
múltiples líneas. Los saltos de línea también
se mostrarán";

print "Esto separa\nmúltiples líneas. Los salos de línea también\nse mostrarán.";

print "para escapar caracteres se \"hace así\".";

// También se puede usar variables usando print
$foo = "foobar";
$bar = "barbaz";

print "foo es $foo"; // foo es foobar

// También se pueden usar arrays
$bar = array("value" => "foo");

print "Esto es {$bar['value']} !"; // Esto es foo !

// Al usar comillas simples se mostrará el nombre de la variable, no su valor
print 'foo is $foo'; // foo is $foo

// Si no se necesita mostrar otros caracteres, se puede simplemente mostrar variables
print $foo;          // foobar

print <<<END
Este párrafo utiliza la sintaxis "here document" para mostrar
múltiples líneas con la interpolación de $variable. Nótese
que el terminador de here document debe aparecer al final
de la línea con punto y coma y ¡ningún espacio en blanco extra!
END;
?>