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


**Criando usuários e adicionando a grupos que já possuir**

```
useradd debora -c "Débora Silva" -s /bin/bash -m -p $(openssl passwd 72551984) -G GRP_ADM

```

**Removendo usuários de grupos especificos**

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


**Trocando o dono e grupo do diretorio**

```
chown nomeDoUsuario:nomeDoGrupo diretorio ------>

----> chown debora:GRP_ADM /adm/

OBS: Só é possivel realizar essa alteração se estiver logado como root, ou adm acessando através do sudo

```

**Alterando as permissões de um diretório ou arquivo**

![img 3](https://github.com/RobsonArcoleze/Linux-Fundamentals/blob/main/img/leitura-gravacao-execucao.png)

```
chmod 777 ---> Permissão total para dono, group e outros
chmod 750 ---> Permissão total para dono, RX para group, nenhuma permisão para outros
chmod 700 ---> Permissão total para dono, nenhuma permissão para group e outros


Ex: chmod 755 /adm/ -------> Dono permissão total, grupo pode ler e executar, outros pode ler e executar;

```



