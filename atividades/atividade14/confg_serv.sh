#!/bin/bash

#Instalação apache
apt install -y apache2

#Backup index padrão
mv /var/www/html/index.html /var/www/html/index.html.bkp

#Gerando novo Index, como nome e matricula
printf "<html lang="pt-br">\n  <head>\n    <title>Atividade 04 Programação de scripts</title>\n    <meta charset="utf-8">\n  </head>\n  <body>\n    <h2>Aluno: Mogleson Lima - Matricula: 472007<h2>\n  </body>\n</html>\n" > /var/www/html/index.html

#Reinicializando apache2
systemctl restart apache2
