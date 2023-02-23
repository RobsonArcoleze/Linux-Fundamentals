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
