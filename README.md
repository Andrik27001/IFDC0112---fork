# IFDC0112
### Certificado de profesionalidad

[Enlace a algo](https://github.com/adam-p/markdown-here/wiki/markdown-cheatsheet)


```c
#include <stdio.h>
int main(void)
{
  printf("Hola mundo");
retun r (0);  
}
```

Ahora voy a hacer unas pruebas de **negrita**, *subrayado*
Ahora voy a hacer unas pruebas de __negrita__, _subrayado_

|num|nombre|
|---:|-:|
|01 |Pol apellido 1 apellido 2|
|02| Eric|
|03|Alex|
|04|Eric|


# Comandos bash 

+ change directory (cd <dir>)
+ make directory (mkdir <dir>)
+ change ownership (chown <owner>:<group> <file>)
+ change permissions (chmod <num> <file>)  El numero de tres cifras otorga los permisos al owner, al grupo y a otros
+ list directous (ls <directory>  flsgs: -l long format.  -a all files.))
+ grep <patron> <archivo<>
+ cat amd.csv | awk -F';' '$3==8' filtra los registros que tiene un 8 en la tercera columna
+ awk -F';' '{print $3} ' amd_commas.csv  extrae la tercera columna de un archivo

# Comandos vim

+ salir :q 
+ salir sin salvar cambios :q!
+ salvar :w
+ editar un archivo :e <nombre>
+ substituir en todo el archivo :% s/original/substitucion/g
+ cambiar una palabra cw (sin los dos puntos. estando encima de la palabra.)
+ deshacer u