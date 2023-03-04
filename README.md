# Linux-Fundamentals

## Criando uma VM

- Utilizando o Virtual box: Ubuntu Server; configuração de rede: Placa em modo Bridge; install openssh: sudo apt-get install openssh-server;
- Utilizando a AWS: EC2; Ubuntu server; habilitar conexão para todos os endereços, baixar o arquivo Ubuntu-AWS.pem


## Acessando as máquinas

### Acesso remoto via Windows

- Instalar o putty; ...


### Acesso remoto via Linux

- Abrir o terminal e digitar: ssh nomeDaMaquina@IPdaMaquina

### Acessando máquina virtual em nuvem (Putty)



### Acessando máquina virtual em nuvem (Terminal)

- Abrir o terminal onde consta a pasta .pem, conceder permissões: chmod 600 Ubuntu-AWS.pem

- Acessando a maquina: ssh -i Ubuntu-AWS.pem nomeDaMaquina@IpDaMaquina

## Navegando pelo sistema


- pwd - mostra a pasta em que você está


- cd .. - Retorna um diretório


- cd / - Volta para a raiz


- ls - Listar arquivos


- ls | more - Teclando enter, passa por toda a lista. Este comando é ultil quando não se tem barra de rolagem


- ls p* - Lista todos os arquivos que começam com a letra especificada, e sua arvore


- ls g?o* - Indica que nessa busca a primeira letra deve ser 'g', a segunda pode ser qualquer letra, a terceira tem que ser 'o', e depois qualquer caracter


- Touch - Cria arquivos (arquivo1.txt)


- ls arquivo[1-3]* - Lista arquivos de de 1 a 3


- ls arquivo[1,5]* - lista apenas os arquivos 1 e 5


- ls arquivo[^1,5]* - Lista todos os arquivos negando 1 e 5


- find -name - o comando find irá buscar todos os arquivos ou diretórios com o nome passado, ex: find -name arq*, e busca a partir do diretório que você 
está


- mkdir - Cria diretórios

- mkdir 'nome composto' - Cria nome composto


- rmdir + diretório - Apaga o diretório


- rm - apaga arquivo


- rm -rf(r=recursivo, f=force) - Apaga o diretório e todo o conteúdo que estiver dentro.

- --help - O comando seguido de --help abre uma guia de ajuda
- ls -l - Lista longa
- ls -a - Lista arquivos ocultos
- ls -h - Mostra o tamanho dos arquivos em k, G ...
- man - man + o comando te dá uma ajuda em forma de texto
- cat - serve para ler um arquivo
- sudo - Usado para fazer operações de administrador
- sudo passwd + nome de Usuário - Para atribuir uma senha a um usuário existente
- sudo su

**sshd** Serviço de acesso remoto

- nano - é um editor de texto

**Habilitando acesso remoto via ssh para usuário root**

sudo nano etc/ssh/sshd_config

Authentication:

``` 
PermitRootLogin yes

``` 
	
- systemctl - pode ser usado para controlar e gerenciar serviços sistema

- systemctl status sshd - mostra se o ssh está ativo no sistema. Mostra os logs também

- systemctl restart sshd - Restarta o o sshd

- history - Lista o histórico de comandos utilizados pelo usuário


## Editores de texto


- vi - vi leia-me.txt 'Se o arquivo existir ele abre, caso não, ele cria'; Pressione a tecla 'I' para iserir um texto; pressione 'ESC' para sair do modo de inserção, para salvar aperte as teclas ':' e depois aperte 'w, serve para salvar', 'q, quit (para sair)'

- nano - nano é muito simples, auto explicativo

## Gerenciando Usuários no Linux


- useradd + nome - Cria um usuário
- userdel -f + nome  - Exclui um usuário
- useradd joao -m(cria a pasta de usuário) -c "João da Silva"(Cria o nome completo de usuário) -s /bin/bash -> Para escolher o terminal


- useradd + nome -c "nome+sobrenome" -m  -e 01/03/2023 -> '-e' cria uma data de expiração para o usuário

- usermod -> Utilizado para realizar alterações em usuários

**Adicionando usuário com senha**

Para criar um usuário com senha em um unico comando é necessário que essa senha esteja incriptada

- useradd convidado -c "Convidado Especial" -s /bin/bash -m -p $(openssl passwd -crypt senha)


## Criando Scripts

- Criar um diretório -> mkdir /scripts

- cd /scripts

- nano criar_user.sh

``` 
#!/bin/bash  ---> Como é um script, obrigatoriamente se inicia assim

echo "Criando usuários do sistema"

useradd guest10 -c "Convidado" -s /bin/bash -m -p $(openssl passwd 72551984)
passwd guest10 -e

useradd guest11 -c "Convidado" -s /bin/bash -m -p $(openssl passwd 72551984)
passwd guest11 -e

useradd guest12 -c "Convidado" -s /bin/bash -m -p $(openssl passwd 72551984)
passwd guest12 -e

useradd guest13 -c "Convidado" -s /bin/bash -m -p $(openssl passwd 72551984)
passwd guest13 -e

echo "Finalizado!!!"

```

- chmod +x + nome do arquivo  --------> Dando permissão para executar

- ./scripts -----> Para executar o arquivo

## Grupos de Usuários

- com um usuário criado -----> usermod -G adm,sudo nomeDeUsuário "-G maiusculo adiciona a vários grupos"

## Criando novos grupos


- groupadd GRP_ADM --------> Comando usado para criar um group


### Criando usuários e adicionando a grupos que já possuir

```
useradd debora -c "Débora Silva" -s /bin/bash -m -p $(openssl passwd 72551984) -G GRP_ADM

```

### Removendo usuários de grupos especificos

```

gpasswd -d mariana sudo ------------> -d deleta do grupo, seguido no nome de usuário e o grupo que deseja remover


```

## Conhecendo sistema de permisões

```

drwxr-xr-x   4 root root       4096 fev 28 00:59 boot

A primeira letra indica o Tipo 'd' = diretório, '-' = arquivo

```
![img 1](https://github.com/RobsonArcoleze/Linux-Fundamentals/blob/main/img/sistema%20de%20permiss%C3%B5es.png)


![img 2](https://github.com/RobsonArcoleze/Linux-Fundamentals/blob/main/img/significado.png)


### Trocando o dono e grupo do diretorio

```
chown nomeDoUsuario:nomeDoGrupo diretorio ------>

----> chown debora:GRP_ADM /adm/

OBS: Só é possivel realizar essa alteração se estiver logado como root, ou adm acessando através do sudo

```

### Alterando as permissões de um diretório ou arquivo

![img 3](https://github.com/RobsonArcoleze/Linux-Fundamentals/blob/main/img/leitura-gravacao-execucao.png)

```
chmod 777 ---> Permissão total para dono, group e outros
chmod 750 ---> Permissão total para dono, RX para group, nenhuma permisão para outros
chmod 700 ---> Permissão total para dono, nenhuma permissão para group e outros


Ex: chmod 755 /adm/ -------> Dono permissão total, grupo pode ler e executar, outros pode ler e executar;

```

## Gerenciamento de Pacotes Linux (UBUNTU-DEBIAN)

- apt-get ---------> Não é muito amigavel

- apt ----------> Amigável com o usuário
  - apt list -----> Lista tudo que tenho disponivel para baixar
  - apt list --installed --------> Lista os programas que tenho na minha máquina
  - apt list --upgradeable ------> Lista o que pode ser atualizado
  - apt list
  - apt search apache -----------> Verifica se o apache está disponivel
  - apt install -----------------> Instala um programa
  - apt remove +nome -y ---------> Desinstala um programa, '-y' é utilizado para que o terminal não pergunte se quer desinstalar
  - apt edit-sources ------------> Utlizado para adicionar um repo que não consta no repo oficial do Ubuntu, ex: DB Oracle
  
  
### Atualização do Sistema Operacional

O ideal é que seja feita em ambiente de teste utillizando uma máquina virtual, pode-se tirar um snapshot antes da atualização e realizar o upgrade (Em produção é muito importante tomar cuidado com atualização)

  - apt upgrade -----> Verifica atualização
  - apt update ------> Realiza a atualização
  
  
### Gerenciamento de Pacotes (FEDORA RED HAT CenTOS)


- dnf -------> Parecido com apt
- yum -------> Parecido com apt-get  


### Realizando a instalação de arquivos DEB


Fiz o download do Chrome e desejo instalá-lo, como fazer isso pelo terminal: 

  - Abra um teminal no diretório do arquivo com extensão .deb (Esta extensão é utilizada por softwares baseados em Debian).
  - sudo apt install ./nomeDoArquivo.deb
  
  
## Gerenciamento de discos linux


No linux cada disco é nomeado da seguinte forma 'sda'----> Caso haja partições 'sda1', 'sda2'...etc;

**Visualizando discos disponiveis**

- lsblk
- fdisk -l ------> '-l' usado para listar os discos


### Particionando e formantando discos via terminal

- Particionando
  - fdisk /dev/sdb
  
- Formatando
  - mkfs.ext4 /dev/sdb
  
  
### Montando e desmontando discos


- mount /dev/sdb /mnt/disco2/-----------> Comando mount é usando para montar o disco, /mnt/disco2/ são diretórios criados pelo usuário para alocar o disco

- umount /dev/sdb ----------> Desmonta o disco


### Montando discos automaticamente

Logado como root, use o seguinte código:

- nano /etc/fstab/

```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
/dev/disk/by-id/dm-uuid-LVM-jyEOcJ0vVQ2afWnjjfmjf8CjYWBgIyH17czmznQetNmOaHnJwxe>
# /boot was on /dev/sda2 during curtin installation
/dev/disk/by-uuid/80398b7e-f297-4e39-a28b-b0de7fa61454 /boot ext4 defaults 0 1
/swap.img       none    swap    sw      0       0

"Estou Montando meu disco automáticamente"
/dev/sdb /disk2 ext4 defaults 0 0 -----> disk2 é um diretório criado pelo usuário, ext4 é o formato do disco, parametros defaults usado par backup

```  

## Copiando arquivos e manipulando processos


### Copiando arquivos


**Comando + origem + destino**

- cp /home/robson/bancodedados.mdf /disk2/

- cp /home/robson/*.txt /disk2/

- cp -i -------> pergunta se quer sobrepor arquivos com nomes iguais

- cp -r -------> Copia tudo recursivamente

- cp -v -------> Ativa o modo verboso, mostra o que está acontecendo durante a cópia


### Movendo arquivos
  
**Comando + origem + destino**

- mv /home/robson/bancodedados.mdf /disk2/

O comando mv tabém pode ser usado para renomear arquivos:

- mv bancodedados.mdf banco_de_dados.mdf


### Iniciando, Visualizando e Encerrando um Processo

comando usado para mostrar processos em execução

- ps ------> ps sozinho, só mostra processos do usuário logado 

- ps aux

  - a ------> Mostra os processos de todos os usuários
  - u ------> Fornece o nome do usuário e o horário que ele iniciou o processo
  - x ------> Mostra os processos que foram executados fora do console

```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.9 100796  9880 ?        Ss   mar02   0:01 /sbin/init
root           2  0.0  0.0      0     0 ?        S    mar02   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   mar02   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<   mar02   0:00 [rcu_par_gp]
root           5  0.0  0.0      0     0 ?        I<   mar02   0:00 [slub_flushwq
root           6  0.0  0.0      0     0 ?        I<   mar02   0:00 [netns]
root           8  0.0  0.0      0     0 ?        I<   mar02   0:00 [kworker/0:0H
root          10  0.0  0.0      0     0 ?        I<   mar02   0:00 [mm_percpu_wq
root          11  0.0  0.0      0     0 ?        S    mar02   0:00 [rcu_tasks_ru
root          12  0.0  0.0      0     0 ?        S    mar02   0:00 [rcu_tasks_tr
root          13  0.0  0.0      0     0 ?        S    mar02   0:00 [ksoftirqd/0]
root          14  0.0  0.0      0     0 ?        I    mar02   0:08 [rcu_sched]
root          15  0.0  0.0      0     0 ?        S    mar02   0:00 [migration/0]
root          16  0.0  0.0      0     0 ?        S    mar02   0:00 [idle_inject/
root          18  0.0  0.0      0     0 ?        S    mar02   0:00 [cpuhp/0]
root          19  0.0  0.0      0     0 ?        S    mar02   0:00 [kdevtmpfs]
root          20  0.0  0.0      0     0 ?        I<   mar02   0:00 [inet_frag_wq
root          21  0.0  0.0      0     0 ?        S    mar02   0:00 [kauditd]
root          22  0.0  0.0      0     0 ?        S    mar02   0:00 [khungtaskd]

```

**Matando um processo**

- kill + PID ------> Usado quando se sabe o nome do processo

- killall chrome --------> Mata todos os processos com esse nome

Logado como root, posso descobrir quem mais está logado

- w --------> Mostra os usuários logados, mas não mostra o PID

- who -a ---> Mostra os usuários logados e o PID



## Servidores com Linux


### Servidor de arquivos

1- Baixar o samba


2- Criar uma pasta 'publica' com permissão total


3- editar configurações
``` nano /etc/samba/smb.conf ```   


4- Precisa reiniciar o Samba
  - O samba é executado em segundo plano, no linux serviços executados em segundo plano são chamados de **'daemon'**
  
  O comando utilizado para reiniciar, fechar e iniciar serviços em segundo plano:
  
  - systemctl restart smbd
  
  Comando utilizado para que toda a vez que o sistema seja reiniciado o serviço suba sozinho
  
  - systemctl enable smbd

## Criando um Servidor WEB com Linux

Instalando o apache2

- apt install apache2 -y

- Verificar o status: systemctl status apache2

## Fim

Este repositório foi construido com base no curso de Linux Fundamentals da Dio


## Autor

Robson Arcoleze

https://www.linkedin.com/in/robsonarcoleze/





