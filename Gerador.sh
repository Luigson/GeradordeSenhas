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

<<<<<<< HEAD
O comportamento padrão do script é gerar uma senha de 8 caracteres minúsculos."

elif [ "$1" = "-p" ]; then
	echo "Senhas Geradas:"
	cat password.txt

fi

#Script de Salvar a senha em um .txt
if [ -e password.txt ]; then
	echo "$senha" >> password.txt
else
	touch password.txt
	echo "$senha" >> password.txt
=======
O comportamento padrão do script é gerar uma senha de 10 caracteres."
<<<<<<< HEAD

elif [ "$1" = "-c" ]; then
	# Essa linha limpa o arquivo password.txt
	> password.txt

else
	# Essa linha gera uma senha quando o script é executado
	senha=$(cat /dev/urandom | tr -dc "$CARACTERES" | fold -w 10 | head -n 1)

fi

=======
>>>>>>> 5d6741a8bb1ae8e4779e91b9d84842d481d65bc9
fi



# Imprime a senha gerada
# Adicione aqui também a implementação do código que salva a senha no passwords.txt e cria o arquivo caso ele não exista
# Dica: lembre-se de utilizar o operador "-e" junto com a condicional "if"!
>>>>>>> a97adc9a5d60d195b452a6964215d830cc860db3
echo "Senha gerada: $senha"

