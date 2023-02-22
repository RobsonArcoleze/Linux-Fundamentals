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

