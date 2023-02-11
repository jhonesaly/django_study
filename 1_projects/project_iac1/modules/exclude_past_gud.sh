#!/bin/bash

# Excluir diretórios, arquivos, grupos e usuários criados anteriormente

## Excluir todos os usuários, exceto o usuário root
echo "Excluindo usuários..."
for user in $(ls /home); do
  if [ $user != "root" ]; then
    sudo userdel -r $user
  fi
done

## Excluir todos os grupos com id superior a 999 e menor que 1100
echo "Excluindo grupos"
for group in $(cut -d: -f1 /etc/group); do
  id=$(getent group $group | cut -d: -f3)
  if [ $id -gt 1000 ] && [ $id -lt 1100 ]; then
    if [ $group != "sync" ]; then
      sudo groupdel $group
    fi
  fi
done

## Excluir todas as pastas dos usuários
echo "Excluindo pastas"
for user in $(ls /home); do
  sudo rm -rf /home/$user
done

## Adicionando novo usuário administrador

read -p "Deseja adicionar um novo usuário administrador? [y/n]" answer

if [ $answer == "y" ] then;
  echo "Adicionando novo usuário administrador"

  read -p "Digite o nome do novo usuário administrador: " user_adm
  adduser $user_adm
  usermod -aG sudo $user_adm

fi



