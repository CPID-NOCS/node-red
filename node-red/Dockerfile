# Estágio de construção
FROM nodered/node-red

# Defina um rótulo personalizado para o nome da imagem
LABEL app_name="api-node-red"
LABEL app_version="latest"

# Copia o package.json para o diretório /data
WORKDIR /data
COPY package.json .

# Instala as dependências no diretório /data
RUN npm install --unsafe-perm --no-update-notifier --no-fund --only=production

# Move para o diretório padrão do Node-RED
WORKDIR /usr/src/node-red

# Copia os arquivos necessários para o diretório /data
COPY settings.js /data/settings.js
COPY flows_cred.json /data/flows_cred.json
COPY flows.json /data/flows.json