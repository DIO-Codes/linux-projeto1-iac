#!/bin/bash

echo "criando IAC"
echo "PASSO 1: CRIAR DIRETÓRIOS"

echo "criando diretório /publico"
mkdir /publico

echo "criando diretório /adm"
mkdir /adm

echo "criando diretório /ven"
mkdir /ven

echo "criando diretório /sec"
mkdir /sec


echo "PASSO 2: CRIAR GRUPOS"

echo "grupo adm - GRP_ADM"
groupadd GRP_ADM
echo "grupo ven - GRP_VEN"
groupadd GRP_VEN
echo "grupo sec - GRP_SEC"
groupadd GRP_SEC

echo "propriedade dos grupos - root:grupo_respectivo"
chown root:GRP_ADM /adm/
chown root:GRP_VEN /ven/
chown root:GRP_SEC /sec


echo "PASSO 3: CRIAR USERS + ATRIBUIR A GRUPO"
# chamar outro script que crie usuários seria ótimo
echo "users administradoras"
useradd carlos -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM
useradd maria -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM
useradd joao -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM

echo "users vendas"
useradd debora -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN
useradd sebastiana -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN
useradd roberto -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN

echo "users sec"
useradd josefina -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC
useradd amanda -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC
useradd rogerio -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC


echo "PASSO 4: ATRIBUIR DIREITOS"

echo "chmod 777 /publico - permissão total"
chmod 777 /publico

echo "chmod 770 /diretorios respectivos"
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
