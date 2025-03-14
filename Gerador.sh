#!/bin/bash

# Definir conjuntos de caracteres
CARACTERES="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+[]{}|;:,.<>?/~"

# Interpretar os argumentos:
if [ "$1" = "-h" ]; then
  echo -e "Bem vindo ao password-generator! Versão 1.0, (c) 2025, Fulano de Tal,DIMAp, UFRN
Uso: ./password-generator.sh [OPÇÕES]:

Opções:

-p : Listar as senhas geradas
-c : Limpar as senhas do arquivo passwords.txt
-h : Exibir esse menu

O comportamento padrão do script é gerar uma senha de 10 caracteres minúsculos."

elif [ "$1" = "-p" ]; then
	echo "Senhas Geradas:"
	cat password.txt

elif [ "$1" = "-c" ]; then
        # Essa linha limpa o arquivo password.txt
        > password.txt

elif [ "$1" = "--crip" ]; then
	senha=$(cat /dev/urandom | tr -dc "$CARACTERES" | fold -w 10 | head -n 1)
	echo "$senha" >> senha.tmp
	openssl enc -aes-256-cbc -salt -in senha.tmp -out password.enc
	rm senha.tmp

elif [ "$1" = "--decrip" ]; then
	openssl enc -d -aes-256-cbc -salt -in password.enc -out password.dec
	rm password.enc

else
        # Essa linha gera uma senha quando o script é executado
       	senha=$(cat /dev/urandom | tr -dc "$CARACTERES" | fold -w 10 | head -n 1)

	# Imprime a senha gerada
	echo "Senha gerada: $senha"

fi

#Script de Salvar a senha em um .txt
if [ -e password.txt ]; then
	echo "$senha" >> password.txt
else
	touch password.txt
	echo "$senha" >> password.txt
fi
