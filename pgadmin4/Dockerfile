# Estágio de construção
FROM dpage/pgadmin4:7.6

# Defina um rótulo personalizado para o nome da imagem
LABEL app_name="api-pgadmin4"
LABEL app_version="latest"

COPY pgpass /tmp/pgpass

COPY servers.json /pgadmin4/servers.json

USER root

# Instalação do gettext
RUN apk add --no-cache gettext
