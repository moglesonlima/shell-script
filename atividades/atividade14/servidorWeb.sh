#!/bin/bash

echo "Criando Servidor..."

#Variáveis fixas 
IMAGEM_AMI="ami-042e8287309f5df03"
TIPO_INSTANCIA="t2.micro"

#Identificando Subnet
SUBRED_ID=$(aws ec2 describe-subnets --query "Subnets[0].SubnetId" --output text)

echo $SUBRED_ID
#Criando grupo de segurança
GRUPO=$(aws ec2 create-security-group --group-name "grupo02" --description "grupo_01" --output text)

#Definindo politicas do grupo(Liberando portas 22,80)
aws ec2 authorize-security-group-ingress --group-id $GRUPO --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id $GRUPO --protocol tcp --port 80 --cidr 0.0.0.0/0


aws ec2 run-instances --image-id $IMAGEM_AMI --instance-type $TIPO_INSTANCIA --security-group $GRUPO_ID --subnet-id $SUBRED_ID --user-data file://confg_serv.sh

IP_PUBLICO=$(aws ec2 describe-instances --query "Reservations[0].Instances[1].PublicIpAddress" --output text)

echo "Acesse -> http://$IP_PUBLICO/"
