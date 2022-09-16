#!/bin/bash
sudo apt update -y

sudo apt install mysql-server mysql-client -y


echo "Deseja saber se o mysql está ativo? [Y,n]"
read input
if [[ $input == "Y" || $input == "y" ]]; then
   echo "está"
   systemctl is-active mysql
   echo "======================="
else
   echo "Obrigado"
fi

echo "Deseja alterar o método de autenticação padrão? (RECOMENDADO) [Y,n]"
read resposta
if [[ $resposta == "Y" || $resposta == "y" ]]; then
   echo "Use ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'suanovasenha'; "
   echo "======================="
   sudo mysql
else
   echo "Pressione Y e defina o level de segurança da senha"
   sudo mysql_secure_installation
fi
