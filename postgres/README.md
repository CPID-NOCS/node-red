<div  Align="justify">

# PostgreSQL

Nesta pastas temos os aruivos de backup do postgres.

<div><img src="https://miro.medium.com/v2/resize:fit:610/1*lZrXmWJRDLqIImJThs5Lrw.png" width=250> </div>

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

## Modo de execução

A execução do backup é implementada no lançamento do container por meio do docker compose.

## Configuração .env
A configuração do container do postgres é feita a partir das variaveis de ambiente implementadas no .env, neste arquivo temos as seguintes variaveis;

- **HOST_DB**: nome dado pelo container na rede, Ex: ***postgres***.
- **PORT_DB**: porta a ser utilizada pelo contianer, Ex: ***5432***.
- **NAME_DB**: nome db, Ex: ***noc_solucoes***. (nome do DB a ser criado pelo backup)
- **USER_DB**: usuario do banco de dados, Ex: ***postgres***.
- **PASSWORD_DB**: senha do banco de dados, as "" servem para validar caracteres especiais, Ex: ***"postgres"***.

## Arquivos

### backup_20240313
> arquivo de backup .sql com as configurações das tabelas do banco de dados.

## O que é

O PostgreSQL é um banco de dados relacional de software livre com suporte de 30 anos de desenvolvimento, sendo um dos bancos de dados relacionais mais estabelecidos disponíveis. A popularidade do PostgreSQL com desenvolvedores e administradores se deve à sua flexibilidade e integridade notáveis. Por exemplo, o PostgreSQL suporta consultas relacionais e não relacionais, e a sua natureza de código aberto significa que uma comunidade dedicada de mais de 600 colaboradores melhora constantemente o sistema de base de dados.

## Autor
| [<img src="https://avatars.githubusercontent.com/u/56831082?v=4" width=115><br><sub>Arthur Coelho Estevão</sub>](https://github.com/arthurcoelho442) |
| :---: |

---
</div>