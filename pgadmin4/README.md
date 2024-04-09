<div  Align="justify">

# pgAdmin

Nesta pastas temos os aruivos de configuração do pgAdmin.

<div><img src="https://coffops.com/wp-content/uploads/2020/12/pgadmin.png" width=250> </div>

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

## Modo de execução

A execução do pgadmin e registro dos servidores é implementada no lançamento do container por meio do docker compose.

## O que é

pgAdmin é um popular administração e desenvolvimento da plataforma Open Source para o PostgreSQL. Atualmente é conhecido por ser o mais avançado banco de dados Open Source no mundo.

<div align="center">
    <img src="https://www.pgadmin.org/static/COMPILED/assets/img/screenshot.png" width=650><br>    
</div>

## Funcionalidade

Ao iniciar o container do pgadmin os servidores pré-cadastrados nos arquivos de configuração pgpass e servers.json, são configurados.

## Configuração
A configuração do container do pgAdmin é feita a partir das variaveis de ambiente implementadas no .env, contudo tando o .pgpass e o servers.json tão utilizam das variaveis de ambiente para implementar as configurações, neste arquivo temos as seguintes variaveis;

#### pgAdmin
- **PORT_PGADMIN**: porta a ser utilizada pelo contianer, Ex: ***5050***.
- **EMAIL**: email de acesso ao pgadmin, Ex: ***admin@admin.com***.
- **PASSWORD**: senha de acesso ao pgadmin, Ex: ***admin***.
- **PASSWORD_REQUIRED**: indica se o pgadmin sera iniciado sem a necessidade de se colocar senha quando False, Ex: ***'False'***.

#### Banco Local
- **HOST_DB**: nome dado pelo container na rede, Ex: ***postgres***.
- **PORT_DB**: porta a ser utilizada pelo contianer, Ex: ***5432***.
- **NAME_DB**: nome da base de dados criada, Ex: ***noc_solucoes***. (criando pelo postgres)
- **USER_DB**: usuario do banco de dados, Ex: ***postgres***.
- **PASSWORD_DB**: senha do banco de dados, as "" servem para validar caracteres especiais, Ex: ***"postgres"***.

#### Banco Remoto
- **HOST_RDB**: endereço banco remoto, Ex: ***201.62.44.66***.
- **PORT_RDB**: porta banco remoto, Ex: ***8101***.
- **NAME_RDB**: nome banco remoto, Ex: ***noc_solucoes***. (criando pelo postgres)
- **USER_RDB**: usuario do banco remoto, Ex: ***node_nocs_user***.
- **PASSWORD_RDB**: senha do banco remoto, as '' servem para validar caracteres especiais, Ex: ***'ddf#r4$gfb@A!#gbs'***.

## Arquivos

### servers.json
> O formato de arquivo JSON usado ao importar ou exportar servidores é bastante simples e contém simplesmente uma lista de servidores, com vários atributos. Os seguintes atributos devem estar presentes em cada definição de servidor: Nome, Grupo, Porta, Nome de usuário, SSLMode, MaintenanceDB e um de Host, HostAddr ou Serviço, o PassFile é definido a partir do .pgpass.

O exemplo a seguir mostra um servidor minimamente definido:

```json
{
    "Servers": {
        "1": {
            "Name": "Minimally Defined Server",
            "Group": "Server Group 1",
            "Port": 5432,
            "Username": "postgres",
            "Host": "localhost",
            "SSLMode": "prefer",
            "MaintenanceDB": "postgres",
            "PassFile": "/tmp/pgpass",
        }
    }
}
```

### .pgpass
> O arquivo .pgpass no diretório pode conter senhas a serem usadas pelo servers.json se a conexão exigir uma senha (e nenhuma senha tiver sido especificada de outra forma).

Este arquivo deve conter linhas no seguinte formato:
````
hostname: port: database: username:password
````

### Dockerfile
Executa a copia dos aquivos para dentro do container

## Autor
| [<img src="https://avatars.githubusercontent.com/u/56831082?v=4" width=115><br><sub>Arthur Coelho Estevão</sub>](https://github.com/arthurcoelho442) |
| :---: |

---
</div>