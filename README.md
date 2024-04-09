<div  Align="justify">
	
# Envio de medições para banco de dados via Node-red

Este repositório contém todos os arquivos de configuração e documentação do sistema de controle de dispositivos de medição de consumo de energia, vinculado a uma Raspberry Pi. Todas as operações são executadas em um ambiente embarcado, e o envio dos dados para o banco de dados remoto é realizado em tempo real durante as medições.

O sistema possui um fluxo de processamento robusto que oferece proteção contra possíveis falhas, incluindo desconexão de internet, estouro de memória e problemas de sincronização. Para obter mais detalhes sobre as funcionalidades e o modo de utilização, consulte a documentação disponível em cada pasta deste repositório.

<div><img src="https://mir-s3-cdn-cf.behance.net/projects/404/00bea2143465349.Y3JvcCw0ODgxLDM4MTcsMCwzNjI.jpg" width=250> </div>

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

## Dependencias
Para garantir o êxito na execução desta aplicação, é imprescindível possuir o Docker Compose instalado, de acordo com a arquitetura do seu sistema.

> Instruções de instalação: [Docker Compose](https://docs.docker.com/compose/install/)

A aplicação foi desenvolvida e testada para funcionar em um ambiente Raspberry Pi com arquitetura ARM. Embora tenha sido testada com sucesso no Windows 10, não foram realizados testes em outras arquiteturas do Linux (como x86 ou x86_64). Fica a seu critério realizar testes em ambientes diferentes.

## Modo de execução

**Atualização do sistema**
```
sudo apt-get update && apt-get upgrade -y
```

**Cria pasta para trabalho**
```
mkdir /home/pi/Desktop/Compose
```

**Navegue até a pasta**
```
cd /home/pi/Desktop/Compose
```

**Adicione o repositorio remoto**
```
git clone origin https://nocs-2024@dev.azure.com/nocs-2024/organic-nodes/_git/organic-nodes
```

**Pegue as alterações do repositorio remoto**
```
git pull origin Task-67
```

Entrar com suas credenciais e as configurações serão baixadas.

**UP dos containers**
```
docker compose -f docker-compose.yml up -d --build 
```

## Configuração
Com o objetivo de otimizar o código, todas as configurações flexíveis foram centralizadas em um arquivo de variáveis de ambiente, .env. Essa abordagem simplifica a gestão de informações, concentrando-as em um único local. No arquivo .env, é possível definir as portas dos contêineres e as credenciais de acesso ao banco de dados.

Cada contêiner possui sua própria configuração, detalhada nos respectivos README.md's:
### Subpastas

- [README-Node-RED](node-red/README.md)
- [README-pgAdmin](pgadmin4/README.md)
- [README-Postgres](postgres/README.md)

## Autor
| [<img src="https://avatars.githubusercontent.com/u/56831082?v=4" width=115><br><sub>Arthur Coelho Estevão</sub>](https://github.com/arthurcoelho442) |
| :---: |

---
</div>
