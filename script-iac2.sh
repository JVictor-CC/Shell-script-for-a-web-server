#!/bin/bash

branch_name="main" 

usage(){ 
  printf "\n\nApache-server [-r|--repository] <repository_name>\n"
  printf "Options:\n\n"
  printf " -r | --repository           Url of the repository (required)\n"
  printf " -b | --branch	       Branch of the repository (Optional)\n"
  printf " The default branch is >main"
  printf "\n\n"
  exit 1
}

while [ $# -gt 0 ]; do
  case "$1" in
     -r | --repository)
	url=$2
	array=$(echo $url | tr "/" " ")
	aux=(${array[@]})
	repo_name=${aux[3]}
	zip=${aux[7]}
	shift
	;;
     -b | --branch)
	branch_name=$2
	shift
	;;
     -h | --help)
	usage
	;;
     *)
	usage
	;;
  esac
  shift
done


echo "Atualizando Servidor"
apt-get update
apt-get upgrade -y
echo "Instalando pkgs necessários"
apt-get install apache2 -y
apt install unzip -y

echo "Baixando e copiando os arquivos da aplicação"

rm -rf /var/www/html/*

cd /tmp
wget "$url"
unzip "$zip"
cd "$repo_name"-"$branch_name"
cp -R * /var/www/html/

echo "Finalizado"
