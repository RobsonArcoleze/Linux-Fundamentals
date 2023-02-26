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

**Habilitando acesso remoto via ssh para usuário root

sudo nano etc/ssh/sshd_config

Authentication:
	...
	PermitRootLogin yes
	...
	
- systemctl - pode ser usado para controlar e gerenciar serviços sistema

- systemctl status sshd - mostra se o ssh está ativo no sistema. Mostra os logs também

- systemctl restart sshd - Restarta o o sshd


## Editores de texto


- vi - vi leia-me.txt 'Se o arquivo existir ele abre, caso não, ele cria'; Pressione a tecla 'I' para iserir um texto; pressione 'ESC' para sair do modo de inserção, para salvar aperte as teclas ':' e depois aperte 'w, serve para salvar', 'q, quit (para sair)'

- nano - nano é muito simples, auto explicativo

- history - Lista o histórico de comandos utilizados pelo usuário

