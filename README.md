<div  Align="justify">
	
# Sumario
- [Node-red](#node-red)
	- [Mode de Execução](#mode-de-execucao)
	- [Funcionalidade Node-red](#funcionamento-node-red)
		- [Ferramentas](#ferramentas)
			- [Nodes](#nodes)
			- [Flows](#flows)
			- [Subflows](#subflows)
	- [Implementação](#implementação)
		- [Receive Data](#receive-data)
		- [Postgres](#postgres)
		- [Subflows](#subflows)
			- [MQTT](#mqtt)
			- [Tratamento da Mensagem](#tratamento-da-mensagem)
			- [Formatação](#formatacao)
			- [Verifica cadastro](#verifica-cadastro)
			- [phase](#phase)
			- [Cria Instancia](#cria-instancia)
			- [Envio ao Banco](#envio-ao-banco)
			- [Sincronismo Medições](#sincronismo-medicoes)
			- [Sincronismo Local](#sincronismo-local)
			- [Sincronismo tamanho banco local](#sincronismo-tamanho-banco-local)
- [Conclusão](#conclusao)
- [Autor](#autor)
- [Anexos](#anexos)
	- [Anexo I - Aedes MQTT](#anexo-1)
	- [Anexo II - Não nulos](#anexo-2)
	- [Anexo III - Existe dados](#anexo-3)
	- [Anexo IV - convert payload](#anexo-4)
	- [Anexo V - Reconfigurção](#anexo-5)
	- [Anexo VI - Transformação String](#anexo-6)
	- [Anexo VII - Identificação fase](#anexo-7)
	- [Anexo VIII - Junção (Monofasico/Bifasico/Trifasico)](#anexo-8)
	- [Anexo IX - Junção e Alteração](#anexo-9)
	- [Anexo X - Recuperação](#anexo-10)
	- [Anexo XI - Remoção](#anexo-11)
	- [Anexo XII - Formatação](#anexo-12)
	- [Anexo XIII - Contador de mensagens](#anexo-13)
	- [Anexo XIV - Duplica](#anexo-14)
	- [Anexo XV - postgresql](#anexo-15)
	- [Anexo XVI - Verifica Cadastro no banco](#anexo-16)
	- [Anexo XVII - postgresql](#anexo-17)
	- [Anexo XVII - Segregação](#anexo-18)
	- [Anexo XVII - Identificação instalação](#anexo-19)
	- [Anexo XVII - Cria instancia Monofasico](#anexo-20)
	- [Anexo XVII - Cria instancia Bifasico](#anexo-21)
	- [Anexo XVII - Cria instancia Trifasico](#anexo-22)
	- [Anexo XVIII - Parametros](#anexo-23)

# <a name=“node-red”><a/>Node-red

Repositorio contendo todos os arquivos de configuração, palette e desenvolvimento do node-red para recebimento tratamento e disposição dos dados de medição de consumo ao banco dde dados.

<div><img src="https://cdn.xingosoftware.com/elektor/images/fetch/dpr_1/https%3A%2F%2Fwww.elektormagazine.com%2Fassets%2Fupload%2Fimages%2F42%2F20200612144414_Node-Red-official-logo.png" width=250> </div>

![Badge em Desenvolvimento](http://img.shields.io/static/v1?label=STATUS&message=EM%20DESENVOLVIMENTO&color=GREEN&style=for-the-badge)

## <a name="mode-de-execucao"><a/>Modo de execução

Para executar essas configurações no Node-RED, é preciso ter instalado o Node-RED e o Postgres via Docker, como mostrado neste outro repositório ([instalação Docker](https://hub.docker.com/r/arthurcoelho442/monitor)).

**Atualização do sistema**

```
sudo apt-get update && apt-get upgrade -y
```


**Entre no modo de navegação root**
```
sudo su
```

**Navegue até a pasta do node-red**
```
cd /home/pi/node-red
```

**Inicialize o repositorio**
```
git init
```

**Adicione o repositorio remoto**
```
git remote add origin https://github.com/CPID-NOCS/node-red.git
```

**Limpe o repositorio local**
```
git clean -f
```

**Pegue as alterações do repositorio remoto**
```
git pull -f origin main
```
pronto basta entrar com suas credenciais e logo logo as configurações serãao baixadas.

## <a name=“funcionamento-node-red”><a/>Funcionamento Node-Red

Node-RED é uma plataforma open-source baseada em Node.js para desenvolver aplicativos IoT (Internet of Things) e integração de sistemas. Ele permite que os usuários criem fluxos de trabalho visualmente, conectando nós pré-construídos de uma vasta biblioteca, chamados de nodes.

Os usuários podem criar um fluxo de trabalho usando uma interface gráfica de arrastar e soltar para conectar os nodes e criar uma lógica de programação. Os nodes podem ser usados para realizar ações como processamento de dados, controle de dispositivos, leitura e gravação em bancos de dados, envio e recebimento de dados via MQTT, HTTP, entre outros protocolos.

Os fluxos criados podem ser facilmente implantados em diferentes plataformas, incluindo nuvem, dispositivos locais e até mesmo em Raspberry Pi. Node-RED é altamente personalizável e extensível, permitindo que os usuários adicionem seus próprios nodes e personalizem os existentes para atender às suas necessidades.

Após a instalação, ao acessar a ferramenta você terá os seguintes componentes na tela.

- Lado esquerdo: Paleta com todos os Nodes (Nós) instalados.
- Centro: Ambiente de desenvolvimento. Onde ficam os Flows criados com suas automações baseado em nós.
- Lado direito: Você tem um conjunto de informações, área de ajuda, área de debug, configurações de layout.

<img src="https://github.com/CPID-NOCS/node-red/blob/master/Imagens/introducao.png" width=850><br>

> ### <a name=“ferramentas”><a/>Ferramentas

#### <a name=“nodes”><a/>Nodes

Nodes são os blocos de construção básicos do Node-RED, cada um representando uma função ou serviço específico. Os nodes são organizados em categorias, como entrada (input), saída (output), processamento (processing) e controle (function), e podem ser facilmente adicionados ao fluxo de trabalho arrastando e soltando da biblioteca de nodes.

<div align="center">
    <img src="https://www.rodened.com/images/nodes.png" width=750><br>    
</div>

Os nodes incluem recursos como entrada de dados, conversão de dados, processamento de dados, saída de dados e controle de fluxo. Eles também podem ser personalizados e estendidos pelos usuários para atender às suas necessidades específicas.

#### <a name=“flows”><a/>Flows

Flows são o conjunto de nodes que formam o fluxo de trabalho em Node-RED. Os fluxos são criados arrastando e soltando os nodes na interface gráfica e conectando-os para criar uma lógica de programação visual. Os fluxos podem ser facilmente modificados, adicionando ou removendo nodes ou reorganizando sua conexão.

|<img src="https://nodered.org/images/nr-image-1.png" width=450><br> | <img  src="https://forum.homeassistantbrasil.com.br/uploads/default/original/2X/1/1483c06a67a6dd6f57d9358058b23fe5806839ca.png" width=500><br> |
| :---: | :---: |

O Node-RED suporta a importação e exportação de fluxos, o que permite compartilhar e reutilizar fluxos entre usuários. Além disso, o Node-RED inclui um recurso de versionamento de fluxo que permite salvar e recuperar versões anteriores do fluxo.

#### <a name=“subflows”><a/>Subflows

Subflows são fluxos menores que podem ser encapsulados e reutilizados em um fluxo maior. Eles são úteis quando um conjunto de nodes é usado várias vezes em diferentes fluxos, permitindo que o usuário crie um subfluxo separado que pode ser adicionado a outros fluxos.

<div align="center">
    <img src="https://raw.githubusercontent.com/Steveorevo/node-red-contrib-actionflows/master//actionflows/demo/deployed.jpg?raw=true" width=750><br> 
</div>

Os subflows funcionam como nodes, mas contêm seu próprio conjunto de nodes e conexões. Eles podem ser facilmente criados arrastando e soltando nodes e conexões para um novo fluxo e salvando-o como um subfluxo. Os subfluxos são então adicionados ao fluxo principal arrastando e soltando como um único node.

## <a name=“implementação”><a/>Implementação

Inicialmente, temos todos os nodes separados em dois fluxos: o **Receive Data** e o **Postgres**. No primeiro fluxo, o **Receive Data**, temos o processo de recebimento, tratamento e adição de informações. Já no segundo, o **Postgres**, temos os nodes responsáveis pela comunicação entre o Node-RED e o banco de dados PostgreSQL. 

```mermaid
    graph TD;    
    A[Recebimento da mesagem contendo apenas uma medição via MQTT] --> B[Tratamento da mensagem] ;
    B --> C[Junção de todas as medições];
    C --> D[formatação com adição de medições calculadas];
```

É importante ressaltar que em ambos os fluxos são utilizados subflows para simplificar o processo. Abaixo, seram destacados as funcionalidades e configurações de cada fluxo.

>### <a name=“receive-data”><a/>Receive Data

<div align="center">
    <img src="https://github.com/CPID-NOCS/node-red/blob/master/Imagens/flow-receive-data.png" width=600><br>
</div>

O fluxo de dados no receive se da na aquisição dos dados que veem via mqtt no subflow ***MQTT***, sendo que as mensagens eviadas pelos medidores da IE veem de forma separada, como por exemplo no medidor trifasico são enviados os dados separadamente, potencia ativa, potencia retiva, potencia aparente, corrent, tensão, fator de potencia, defasagem, etc, cada um em uma mensagem separada, logo no subflow ***Tratamento da mensagem*** as mensagem são tratadas e unidas para posteriormente serem formatadas no subflow ***Formatação***.

Logo abaixo temos uma mensagem que chega do medidor referente à corrente de fase A:

```json
{
  "packet": {
    "cmd" : "publish",
    "retain": false,
    "qos": 0,
    "dup" : false,
    "length" : "58",
    "topic" : "Trifasico",
    "payload": buffer[42]
  }
  "client":{}
}
```

Percebe-se que esta mensagem, além de conter o payload no formato buffer, contém também todos os dados do MQTT, como configuração de tópico, subtop, entre outros, sendo simplificada para se tornar:
```json
{
  "id" : "publish",
  "topic" : "Trifasico",
  "current_A": 0.83
}
```

Contudo, é unida a outras mensagens, tornando-se:

```json
{
    "id": "5",
    "topic": "Trifasico",
    "active_power_A": 67.93,
    "active_power_B": 121.27,
    "active_power_C": 30.11,
    "reactive_power_A": 59.5,
    "reactive_power_B": 97.7,
    "reactive_power_C": 4.59,
    "apparent_power_A": 90.27,
    "apparent_power_B": 155.72,
    "apparent_power_C": 30.46,
    "voltage_A": 128.04,
    "voltage_B": 128.25,
    "voltage_C": 128.75,
    "current_A": 0.84,
    "current_B": 1.22,
    "current_C": 0.3,
    "power_factor_A": 0.75,
    "power_factor_B": 0.77,
    "power_factor_C": 0.98,
    "voltage_current_angle_A": -90.03,
    "voltage_current_angle_B": 38.72,
    "voltage_current_angle_C": -90.03,
    "frequency": 59.97,
    "angle_voltage_A_B": 119.54,
    "angle_voltage_A_C": 240.18,
    "angle_voltage_B_C": 120.27,
    "temperature": 35.89
} 
```
Essa mensagem contém apenas os valores que serão utilizados para criar a instância de inserção dos dados no banco de dados.

>### <a name=“postgres”><a/>Postgres

<div align="center">
    <img src="https://github.com/CPID-NOCS/node-red/blob/master/Imagens/flows-postgres.png" width=600><br>
</div>

O fluxo do Postgres funciona como uma ferramenta de conexão entre o Node-RED e o banco de dados, permitindo diversas interações com o banco. Por exemplo, é possível verificar o cadastro de um determinado usuário, sincronizar as tabelas locais com as informações do banco remoto, solicitar quais fases estão associadas a determinada medição, manter o banco de dados com uma quantidade específica de dados para evitar sobrecarga de memória e, por fim, inserir os dados medidos no banco de dados remoto.

Dentro desse fluxo, temos vários subfluxos que facilitam o trabalho com o banco de dados. Por exemplo, o subfluxo ***Verifica cadastro*** e ***phase*** fazem requisições ao banco remoto para averiguar informações. O subfluxo ***cria instancia*** é responsável por criar a instância no formato correto para inserção no banco de dados, e dentro dele, temos o subfluxo oculto ***sincronismo medições***, que detecta discrepâncias entre medições locais e remotas e envia as medições locais faltantes para o banco remoto.

Temos também o subfluxo ***envia ao banco***, que envia a medição já instanciada para o banco local e remoto, e o subfluxo oculto ***sincronismo local***, que mantém as tabelas locais de cadastro atualizadas com o banco remoto. Por fim, o subfluxo ***sincronismo tamanho banco local*** mantém o tamanho do banco de dados local em um tamanho fixo.

Para termos um funcionamento adequado dos nodulos responsaveis pela comunicação com o postgresql, temos 4 configurações a serem efetuadas, logo abaixo temos o nó e qual configuração deve ser feita nele:
	
<img src="https://user-images.githubusercontent.com/56831082/225421968-c96b500e-1e16-48e9-bfa2-9093759b8164.png" width=135><br>
	
|<img src="https://user-images.githubusercontent.com/56831082/225422893-139e72af-4a6e-45d2-aff4-38fa75513808.png"><br><sub>Local</sub> | <img src="https://user-images.githubusercontent.com/56831082/225422904-bba64b54-7486-463e-8d6b-ad9557a4470c.png"><br><sub>Remoto</sub>|
| :---: | :---: |

<img src="https://user-images.githubusercontent.com/56831082/225421982-4e365e48-6f93-4bb0-913a-2e15bd18cd66.png" width=135><br>

|<img src="https://user-images.githubusercontent.com/56831082/225423581-d22b451d-b92d-4c74-b121-832b6113a40c.png"><br><sub>Local-Connection</sub> | <img src="https://user-images.githubusercontent.com/56831082/225423590-d27d0139-3865-4bc1-b2dc-de5640f114f0.png"><br><sub>Local-Security</sub>|
| :---: | :---: |
|<img src="https://user-images.githubusercontent.com/56831082/225423596-ed72cf45-7990-483f-9403-f38ca76e4ca9.png"><br><sub>**Remoto-Connection**</sub> | <img src="https://user-images.githubusercontent.com/56831082/225423608-41da729e-3c66-4187-8b7a-2b06570547a6.png"><br><sub>**Remoto-Security**</sub>|

Perceba que no banco local o host é dado como postgres, pois o node-red esta no docker e esta na mesma rede do conteiner postgres.
	
>### <a name=“subflows”><a/>Subflows

Agora vamos entrar em detalhes do funcionamento de cada subflow conttido nas dependencias do node-red.

#### <a name=“mqtt”><a/>MQTT

O subflow ***MQTT*** tem a função de capturar as mensagens recebidas pelo Node-RED local por meio do MQTT na porta 1883. Para garantir a qualidade das mensagens, o subflow transmite apenas aquelas que não possuem falhas, como mensagens nulas ou com payload vazio.

<div align="center">
    <img src="https://github.com/CPID-NOCS/node-red/blob/master/Imagens/subflow-MQTT.png" width=850><br>
</div>

O fluxo do subflow começa com um node chamado **Aedes MQTT** (configuração no [Anexo-I](#anexo-1)), que funciona como um mosquito broker e coleta todas as mensagens que chegam na porta 1883 da Raspberry Pi. Em seguida, a mensagem passa pelo node **Não nulos** (configuração no [Anexo-II](#anexo-2)), que verifica se a mensagem não está vazia e se está conectada. Essas informações são cruciais para garantir a consistência das mensagens recebidas. Por fim, a mensagem passa pelo node **Existe dados** (configuração no [Anexo-III](#anexo-3)), que verifica se o payload da mensagem contém dados ou está vazio.

Além desses nodes, o subflow ***MQTT*** também possui nodes de status que informam a situação atual do node (conectado ou desconectado) e um node de aviso que informa caso ocorra algum problema em qualquer node do subflow.

#### <a name=“tratamento-da-mensagem”><a/>Tratamento da mensagem
O subfluxo ***Tratamento da mensagem*** é separado em dois fluxos: 

- Uma *Reconfiguração* que altera o formato da mensagem inicial, removendo informações que não são relevantes e remontando o objeto para uma melhor representação;

- E um *Identificação de Tópico e Junção*, que junta as mensagens de acordo com o tópico;

<div align="center">
    <img src="https://user-images.githubusercontent.com/56831082/225388516-8f52fca6-135b-4a26-a2fe-4a34ac3d677c.png" width=900><br>
</div>
	
O objeto inicial chega no formato:
```json
{
  "packet": {
    "cmd" : "publish",
    "retain": false,
    "qos": 0,
    "dup" : false,
    "length" : "58",
    "topic" : "Trifasico",
    "payload": buffer[42]
  }
  "client":{}
}
```
e passa a ter o seguinte formato após a reconfiguração no primeiro fluxo:
```json
{
	"id":"5",
	"topic":"Trifasico",
	"variable":"IA",
	"value":1.08,
	"unit":"A"
}
```
Esse processo é realizado através dos nodos **convert payload** (configuração no [Anexo-IV](#anexo-4)), que converte o formato payload de buffer para um objeto JSON, e posteriormente as informações irrelevantes são removidas e o payload é reorganizado pelo nodulo **Reconfiguração** (configuração no [Anexo-V](#anexo-5)). Por fim, a mensagem é transformada em uma string JSON no nodulo **Trasformação String** (configuração no [Anexo-VI](#anexo-6)) para facilitar a união com as mensagens seguintes no fluxo de *Identificação de Tópico e Junção*. A união ocorre de forma diferente para cada tipo de módulo (monofásico, bifásico e trifásico), pois temos uma quantidade diferente de mensagens a serem unidas. Cada mensagem é identificada pelo nodulo **Identificação de fase** (configuração no [Anexo-VII](#anexo-7)), através do tópico em que a mensagem foi publicada. A união é realizada pelos nodulos **Junção Monofásico**, **Junção Bifásico** e **Junção Trifásico** (configuração de ambos no [Anexo-VIII](#anexo-8)).

Após a união, é necessário modificar a mensagem resultante, que chega no seguinte formato:
```
{"id":"5","topic":"Trifasico","variable":"PA","value":94.87,"unit":"W"},{"id":"5","topic":"Trifasico","variable":"PB","value":117.4,"unit":"W"},{"id":"5","topic":"Trifasico","variable":"PC","value":64.71,"unit":"W"},...}
```
Para isso removemos as junções `"},{"` e alteramos o formato basico de cada menagem, no caso da corrente de Fase A, a mensagem ´{"id":"5","topic":"Trifasico","variable":"IA","value":1.08,"unit":"W"}´ passa a ser `{"id":"5", topic":"Trifasico", "variable":"IA", value":1.08, unit":"A"}` e é unida as outras. Isso é feito pelo nodulo **Junção e Alteração** (configuração no [Anexo-IX](#anexo-9)).

Recuperação da Mensagem resultante de Json String para Json Object:
```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 90.69,
	"unit": "oC",
	"active_power_B": 28.73,
	"active_power_C": 60.69,
	"PT": 180.09,
	"reactive_power_A": 78.39,
	"reactive_power_B": 0.15,
	"reactive_power_C": -4.32,
	"QT": 74.25,
	"apparent_power_A": 119.85,
	"apparent_power_B": 28.73,
	"apparent_power_C": 60.8,
	"ST": 194.72,
	"voltage_A": 127.26,
	"voltage_B": 127.71,
	"voltage_C": 127.94,
	"current_A": 1.04,
	"current_B": 0.3,
	"current_C": 0.68,
	"IT": 0.75,
	"power_factor_A": 0.75,
	"power_factor_B": 0.99,
	"power_factor_C": 0.99,
	...
}
```
	
Muitos desses valores não são utilizados pelo projeto. Após a recuperação da string JSON para objeto JSON no nodulo **Recuperação** (configuração no [Anexo-X](#anexo-10)), os dados não utilizados, como 'unit', 'PT', 'QT', 'ST', e 'IT', são removidos pelo nodulo "Remoção" (configuração no [Anexo-XI](#anexo-11)), deixando o payload no seguinte formato:
	
```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 90.69,
	"active_power_B": 28.73,
	"active_power_C": 60.69,
	"reactive_power_A": 78.39,
	"reactive_power_B": 0.15,
	"reactive_power_C": -4.32,
	"apparent_power_A": 119.85,
	"apparent_power_B": 28.73,
	"apparent_power_C": 60.8,
	"voltage_A": 127.26,
	"voltage_B": 127.71,
	"voltage_C": 127.94,
	"current_A": 1.04,
	"current_B": 0.3,
	"current_C": 0.68,
	"power_factor_A": 0.75,
	"power_factor_B": 0.99,
	"power_factor_C": 0.99,
	...
}
```
	
#### <a name="formatacao"><a/>Formatação
Este subfluxo é responsável por fazer as formatações necessárias para o banco de dados. Nele, temos um nó chamado **Formatação** (configuração no [Anexo-XII](#anexo-12)), que possui diversas funcionalidades, incluindo a separação das medidas com casas decimais e a representação dos valores em notação científica, onde o número de ponto flutuante se torna um inteiro e o valor que o tornou inteiro é representado em outra propriedade chamada ***sf*** (abreviação para "scientific format").

<div align=center>
	<img src="https://user-images.githubusercontent.com/56831082/225416305-f0331554-fa17-4f5b-8259-cd8eb22f9320.png" width=600><br>
</div>
	
Portanto, uma entrada equivalente a:
	
```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 90.69,
	"active_power_B": 28.73,
	"active_power_C": 60.69,
	...
}
```
	
Torna-se:

```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 9069,
	"active_power_B": 2873,
	"active_power_C": 6069,
	"active_power_A_sf": -2,
	"active_power_B_sf": -2,
	"active_power_C_sf": -2,
	...
}
```
Outras funcionalidades deste nó é realizar o cálculo de medições que alguns módulos não executam, como a potência reativa, a potência aparente, o defasamento, entre outros, além disso temos um fluxo *Contador de mensagens* (configuração dos dois nodulos do fluxo no [Anexo-XIII](#anexo-13)) responsavel por zerar o contador de mensagens caso a varizavel do subflow **zerar** esteja selecionada nas opções de configuração do subflow, como a imagem abaixo mostra.

<div align=center>
	<img src="https://user-images.githubusercontent.com/56831082/225413648-047bb42d-350a-47ac-94e7-d199fbbdc9bf.png" width=400><br>
</div>

#### <a name=“verifica-cadastro”><a/>Verifica cadastro
Este subflow é responsável por verificar se o ID da mensagem que chegou no payload está cadastrado no banco de dados. Caso contrário, a mensagem não pode ser armazenada no banco. Para isso, no início do fluxo, a mensagem é duplicada pelo nó **Duplica** (configuração no [Anexo-XIV](#anexo-14)) pois o segundo nó utilizado, responsável pela verificação, sobrescreve o payload da mensagem. Logo, para não haver perdas, a mensagem é duplicada. No segundo nó **postgreSQL** (configuração no [Anexo-XV](#anexo-15)), temos uma query que busca o ID do mqtt_access referente ao ID do cliente da mensagem. Caso esse ID não seja definido, significa que o ID da mensagem não possui cadastro. Nesse caso, a mensagem é enviada ao subflow ***Sincronismo Local*** para verificar se as tabelas locais estão devidamente atualizadas, essa descisão e tomada pelo nó **Verifica Cadastro no banco** (configuração no [Anexo-XVI](#anexo-16)).

<div align=center>
	<img src="https://user-images.githubusercontent.com/56831082/225420298-4f21f277-3633-4af1-9756-56bd4bec12eb.png" width=950><br>
</div>
	
#### <a name=“phase”><a/>phase

Este subflow funciona de forma similar ao subflow ***Verifica cadastro***, fazendo uma consulta ao banco de dados. Para isso, no início do fluxo, a mensagem é duplicada pelo nó **Duplica** (configuração no [Anexo-XIV](#anexo-14)). No segundo nó **postgreSQL** (configuração no [Anexo-XVII](#anexo-17)), temos uma consulta que busca as fases do circuito de acordo com o mqtt_id da mensagem. Caso nenhuma fase seja encontrada, a mensagem é descartada.
	
<div align=center>
	<img src="https://user-images.githubusercontent.com/56831082/225436012-4d9ac3e6-d664-40fb-a7a1-b56c2bd107f5.png" width=800><br>
</div>

Dessa forma, a mensagem que chega nesse formato:
```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 9069,
	"active_power_B": 2873,
	"active_power_C": 6069,
	"active_power_A_sf": -2,
	"active_power_B_sf": -2,
	"active_power_C_sf": -2,
	...
}
```
se torna:
```json
{
	"id": "5",
	"topic": "Trifasico",
	"active_power_A": 9069,
	"active_power_B": 2873,
	"active_power_C": 6069,
	"active_power_A_sf": -2,
	"active_power_B_sf": -2,
	"active_power_C_sf": -2,
	"phase_A": "C",
	"phase_B": "A",
	"phase_C": "B",
	...
}
```
Lembrando que phase_A, assim como todas medições com "_A" representa a primeira fase. Portanto, se na instalação a primeira fase for a fase C, no código será representada por A, essa indexação é efetuada pelo nó **Segregação** (configuração no [Anexo-XVIII](#anexo-18)), além disso caso haja algum erro e mandada uma mensagem para o subflow ***Sincronismo Local*** para atualizar as tabelas locais de cadastro do banco local.
	
#### <a name="cria-instancia"><a/>Cria Instancia
O subflow ***cria-instancia*** é responsável por criar uma mensagem de inserção no formato SQL com os dados vindos do payload.

<div align="center">
	<img src="https://user-images.githubusercontent.com/56831082/225604769-7679bdfb-df7f-4be7-b033-89d71f7b74ac.png" width=800><br>	
</div>
	
A mensagem que chega no subflow passa por um nó de switch para identificar o tipo de fase do circuito, semelhante ao **identificação fase** do subflow ***Tratamento da mensagem***. No entanto, a identificação é realizada com o objeto JSON, e não com a string JSON. O nó **Identificação instalação** é responsável por essa identificação e está configurado no  [Anexo-XIX](#anexo-19).
	
Após a identificação, a mensagem é encaminhada para a instanciação de acordo com o tipo de instalação. A grande diferença entre as instancias (Monofásica (configuração no [Anexo-XX](#anexo-20), Bifásica (configuração no [Anexo-XXI](#anexo-21) e Trifásica (configuração no [Anexo-XXII](#anexo-22)) está na instanciação das fases B e C.

No caso do monofásico, temos apenas uma tabela de EnergyMeasure e uma de PowerMeasure, referentes à fase A. No bifásico, temos a presença da fase B, resultando em duas tabelas de EnergyMeasure e duas de PowerMeasure. Já no trifásico, temos três tabelas de cada uma, respectivamente. Também temos a tabela de VoltageLagMeasurement presente no bifásico e trifásico, representando a defasagem entre as tensões de cada fase.
	
Portanto, quando um payload chega neste formato em específico, como exemplificado abaixo:
```json
{
	"id":"5",
	"topic":"Trifasico",
	"active_power_A":6773
	,"active_power_B":12008,
	"active_power_C":3042,
	"reactive_power_A":5851,
	"reactive_power_B":9782,
	"reactive_power_C":471,
	"apparent_power_A":895,
	"apparent_power_B":15487,
	"apparent_power_C":3076,
	"voltage_A":12765,
	"voltage_B":12805,
	"voltage_C":12854,
	"current_A":83,
	"current_B":121,
	"current_C":28,
	"power_factor_A":0.75,
	"power_factor_B":0.77,
	"power_factor_C":0.98,
	"voltage_current_angle_A":-9004,
	"voltage_current_angle_B":385,
	"voltage_current_angle_C":-9004,
	"frequency":5997,
	...
}
```
Ele passa a ser tratado de acordo com o tipo de instalação identificado e é instanciado de acordo com as configurações específicas de cada instalação, similar ao formato abaixo:
```SQL
INSERT INTO public.organic_nodes_control_measurement(
	date_time_stamp,	message_counter,	setup_id,	source)
	VALUES ('2023-03-16T12:24:13.473Z', 1, (SELECT id FROM public.organic_nodes_control_setup WHERE (device_id = (SELECT device_id FROM public.organic_nodes_control_mqttdevice WHERE (mqtt_access_id = (SELECT id FROM public.organic_nodes_control_mqttaccess WHERE (mqtt_id = '5')))))), 0);

INSERT INTO public.organic_nodes_control_frequencymeasure(
	frequency,	frequency_sf,	measurement_id)
	VALUES (5997, -2, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = 1 AND date_time_stamp = '2023-03-16T12:24:13.473Z') LIMIT 1));

INSERT INTO public.organic_nodes_control_sensormeasure(
	temperature,	temperature_sf,	measurement_id)
	VALUES (3153, -2, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = 1 AND date_time_stamp = '2023-03-16T12:24:13.473Z') LIMIT 1));
	
INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, ...
```

É importante destacar que a cada mensagem instanciada, é enviada uma mensagem para o subflow ***Sincronismo medições***, a fim de manter a sincronia entre as tabelas de medições locais e remotas. Isso é essencial para garantir a precisão dos dados e evitar erros na sincronização, para que, o subflow irá sincronize antes de enviar novas mensagens para o banco remoto.
	
#### <a name="envio-ao-banco"><a/>Envio ao banco
O subflow ***Envia ao banco*** é um subflow simplificado que contém três nós principais. No primeiro nó do fluxo, adiciona-se os parâmetros de envio da mensagem do postgres, nó **Parametros** (configuração no [Anexo-XXIII](#anexo-23)). Nesse nó, há também uma pequena verificação de uma variável global *sincronismo_remoto* referente à sincronização do banco local com o remoto. Se essa variável for verdadeira, significa que uma sincronização está em andamento, portanto, devemos enviar mensagens somente para o banco local, localizado no segundo output do nó. Caso contrário, os bancos estão sincronizados e a mensagem é enviada para ambos o dois outros nós (NOCS e Local), nós configurados conforme especificado em seções anteriores(verificar seção [Postgres](#postgres)).
	
<div align="center">
	<img src="https://user-images.githubusercontent.com/56831082/225621699-1ff29810-3bc8-4772-bc8e-4d645424d769.png" wigth=800><br>
</div>

Caso haja qualquer erro no banco local, é feita uma sincronização local através do nó de "Sincronização Local", para corrigir qualquer falta de informações de cadastro que o banco local possa estar tendo. Após 1 segundo, a mensagem que ocasionou o erro é reenviada para ser armazenada no banco local.	
		
#### <a name="sincronismo-medicoes"><a/>Sincronismo Medições
	
	
	
	
	
	
#### <a name="sincronismo-local"><a/>Sincronismo Local
#### <a name="sincronismo-tamanho-banco-local"><a/>Sincronismo tamanho banco local

# <a name="conclusao"><a/>Conclusão

Node-RED é uma plataforma poderosa e flexível para a criação de fluxos de trabalho IoT e integração de sistemas. Com seus nodes personalizáveis, fluxos, subflows e outras ferramentas, é possível criar fluxos complexos de maneira visual e fácil de entender. Com a comunidade ativa de desenvolvedores, há sempre suporte para novos nodes e recursos, tornando o Node-RED uma solução escalável para projetos IoT e de integração de sistemas.

# <a name=“autor”><a/>Autor
| [<img src="https://avatars.githubusercontent.com/u/56831082?v=4" width=115><br><sub>Arthur Coelho Estevão</sub>](https://github.com/arthurcoelho442) |
| :---: |

# <a name="anexos"><a/>Anexos
Logo abaixo temos todos os anexos de configuração dos nodes
###
---
### <a name="anexo-1"><a/><div align="center"> Anexo I - Aedes MQTT </div>
<div align="center">
    <img src="https://user-images.githubusercontent.com/56831082/225341250-23ef31f5-1455-49b5-9dcf-1de866b6bcf2.png"><br>
</div>

---
### <a name="anexo-2"><a/><div align="center"> Anexo II - Não nulos</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225341368-05790018-1f95-4c39-a57d-f6fca4bfbff7.png"><br>
</div>
	
---
### <a name="anexo-3"><a/><div align="center"> Anexo III - Existe dados</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225341533-9c9cc8cb-c337-4f1c-840f-75edd16527f3.png"><br>
</div>

---
### <a name="anexo-4"><a/><div align="center"> Anexo IV - convert payload</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225396555-ce37938a-c7e1-477f-bab4-51a6f7cc325f.png"><br>
</div>

---
### <a name="anexo-5"><a/><div align="center"> Anexo V - Reconfigurção</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225396636-08726984-6480-42ce-9b1a-951ddd516efd.png"><br>
</div>

---

### <a name="anexo-6"><a/><div align="center"> Anexo VI - Transformação String </div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225396746-7df89b03-02bc-4353-997d-728c861875de.png"><br>
</div>

---
### <a name="anexo-7"><a/><div align="center"> Anexo VII - Identificação fase</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225400562-aff53b2c-6221-430b-b1fd-e53975087fac.png"><br>
</div>

---
### <a name="anexo-8"><a/><div align="center"> Anexo VIII - Junção (Monofasico/Bifasico/Trifasico)</div>
	
| <img src="https://user-images.githubusercontent.com/56831082/225396933-33cd8ec0-3122-4e3d-8be9-26bca8154986.png"><br><sub>Monofasico</sub> | <img src="https://user-images.githubusercontent.com/56831082/225396953-3b499743-6857-4631-86cf-26a9a929e883.png"><br><sub>Bifasico</sub>| <img src="https://user-images.githubusercontent.com/56831082/225396981-dcd6282b-eda2-40ec-863a-9b62e37565d3.png"><br><sub>Trifasico</sub> |
| :---: | :---: | :---: |

---	
### <a name="anexo-9"><a/><div align="center"> Anexo IX - Junção e Alteração</div>
	
| <img src="https://user-images.githubusercontent.com/56831082/225401425-fe39068c-d40c-49d1-b2d5-661e8ab01f0c.png"><br> | <img src="https://user-images.githubusercontent.com/56831082/225401443-b0b72c79-f5f0-4639-9981-89b10588d804.png"><br>| <img src="https://user-images.githubusercontent.com/56831082/225401458-95f8b920-7f37-4626-a913-0f88e865025c.png"><br> |
| :---: | :---: | :---: |
| <img src="https://user-images.githubusercontent.com/56831082/225401671-8dde46a5-5b66-4aea-b165-0516b2eadf37.png"><br> | <img src="https://user-images.githubusercontent.com/56831082/225401699-ba5ad67b-a5a3-4192-9e9a-5fdb64307aed.png"><br>| <img src="https://user-images.githubusercontent.com/56831082/225401724-fbfbd647-5203-4a6d-af4a-4458a6ef2b2b.png"><br> |

	
---

### <a name="anexo-10"><a/><div align="center"> Anexo X - Recuperação</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225400696-8343b1d6-4857-48a1-aa14-c3dc322f57a4.png"><br>
</div>

---
### <a name="anexo-11"><a/><div align="center"> Anexo XI - Remoção</div>
	
| <img src="https://user-images.githubusercontent.com/56831082/225400843-4cc488ad-d54b-4bd2-a309-66886b2e6aa2.png"><br> | <img src="https://user-images.githubusercontent.com/56831082/225400862-1a386b9b-ad6f-4b6d-89c7-3b51ce3e8ae9.png"><br>|
| :---: | :---: |

---
### <a name="anexo-12"><a/><div align="center"> Anexo XII - Formatação</div>
	
```javascript
/*current*/
/*A*/
if (typeof msg.payload.current_A != "undefined") {
    if (!Number.isInteger(msg.payload.current_A)) {
        let sf = ("" + ("" + msg.payload.current_A).split('.')[1]).length
        msg.payload.current_A = Math.trunc(msg.payload.current_A * Math.pow(10, sf))
        msg.payload.current_A_sf = -1 * sf
    } else
        msg.payload.current_A_sf = 0
}
/*B*/
if (typeof msg.payload.current_B != "undefined") {
    if (!Number.isInteger(msg.payload.current_B)) {
        let sf = ("" + ("" + msg.payload.current_B).split('.')[1]).length
        msg.payload.current_B = Math.trunc(msg.payload.current_B * Math.pow(10, sf))
        msg.payload.current_B_sf = -1 * sf
    } else
        msg.payload.current_B_sf = 0
}
/*C*/
if (typeof msg.payload.current_C != "undefined") {
    if (!Number.isInteger(msg.payload.current_C)) {
        let sf = ("" + ("" + msg.payload.current_C).split('.')[1]).length
        msg.payload.current_C = Math.trunc(msg.payload.current_C * Math.pow(10, sf))
        msg.payload.current_C_sf = -1 * sf
    } else
        msg.payload.current_C_sf = 0
}

/*voltage*/
/*A*/
if (typeof msg.payload.voltage_A != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_A)){
        let sf = ("" + ("" + msg.payload.voltage_A).split('.')[1]).length
        msg.payload.voltage_A = Math.trunc(msg.payload.voltage_A * Math.pow(10, sf))
        msg.payload.voltage_A_sf = -1 * sf
    }else
        msg.payload.voltage_A_sf = 0
}
/*B*/
if (typeof msg.payload.voltage_B != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_B)) {
        let sf = ("" + ("" + msg.payload.voltage_B).split('.')[1]).length
        msg.payload.voltage_B = Math.trunc(msg.payload.voltage_B * Math.pow(10, sf))
        msg.payload.voltage_B_sf = -1 * sf
    } else
        msg.payload.voltage_B_sf = 0
}
/*C*/
if (typeof msg.payload.voltage_C != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_C)) {
        let sf = ("" + ("" + msg.payload.voltage_C).split('.')[1]).length
        msg.payload.voltage_C = Math.trunc(msg.payload.voltage_C * Math.pow(10, sf))
        msg.payload.voltage_C_sf = -1 * sf
    } else
        msg.payload.voltage_C_sf = 0
}

/*voltage_current_angle*/
/*A*/
if (typeof msg.payload.voltage_current_angle_A != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_current_angle_A)) {
        let sf = ("" + ("" + msg.payload.voltage_current_angle_A).split('.')[1]).length
        msg.payload.voltage_current_angle_A = Math.trunc(msg.payload.voltage_current_angle_A * Math.pow(10, sf))
        msg.payload.voltage_current_angle_A_sf = -1 * sf
    } else
        msg.payload.voltage_current_angle_A_sf = 0
}else if (typeof msg.payload.current_A != "undefined"){
    msg.payload.voltage_current_angle_A = ((Math.acos(msg.payload.power_factor_A) * 180) / Math.PI).toFixed(3)
    
    let sf = ("" + ("" + msg.payload.voltage_current_angle_A).split('.')[1]).length
    msg.payload.voltage_current_angle_A = Math.trunc(msg.payload.voltage_current_angle_A * Math.pow(10, sf))
    msg.payload.voltage_current_angle_A_sf = -1 * sf
} 
/*B*/
if (typeof msg.payload.voltage_current_angle_B != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_current_angle_B)) {
        let sf = ("" + ("" + msg.payload.voltage_current_angle_B).split('.')[1]).length
        msg.payload.voltage_current_angle_B = Math.trunc(msg.payload.voltage_current_angle_B * Math.pow(10, sf))
        msg.payload.voltage_current_angle_B_sf = -1 * sf
    } else
        msg.payload.voltage_current_angle_B_sf = 0
} else if (typeof msg.payload.current_B != "undefined") {
    msg.payload.voltage_current_angle_B = ((Math.acos(msg.payload.power_factor_B) * 180) / Math.PI).toFixed(3)

    let sf = ("" + ("" + msg.payload.voltage_current_angle_B).split('.')[1]).length
    msg.payload.voltage_current_angle_B = Math.trunc(msg.payload.voltage_current_angle_B * Math.pow(10, sf))
    msg.payload.voltage_current_angle_B_sf = -1 * sf
} 
/*C*/
if (typeof msg.payload.voltage_current_angle_C != "undefined") {
    if (!Number.isInteger(msg.payload.voltage_current_angle_C)) {
        let sf = ("" + ("" + msg.payload.voltage_current_angle_C).split('.')[1]).length
        msg.payload.voltage_current_angle_C = Math.trunc(msg.payload.voltage_current_angle_C * Math.pow(10, sf))
        msg.payload.voltage_current_angle_C_sf = -1 * sf
    } else
        msg.payload.voltage_current_angle_C_sf = 0
} else if (typeof msg.payload.current_C != "undefined") {
    msg.payload.voltage_current_angle_C = ((Math.acos(msg.payload.power_factor_C) * 180) / Math.PI).toFixed(3)

    let sf = ("" + ("" + msg.payload.voltage_current_angle_C).split('.')[1]).length
    msg.payload.voltage_current_angle_C = Math.trunc(msg.payload.voltage_current_angle_C * Math.pow(10, sf))
    msg.payload.voltage_current_angle_C_sf = -1 * sf
} 

/*active_power*/
/*A*/
if (typeof msg.payload.active_power_A != "undefined") {
    if (!Number.isInteger(msg.payload.active_power_A)) {
        let sf = ("" + ("" + msg.payload.active_power_A).split('.')[1]).length
        msg.payload.active_power_A = Math.trunc(msg.payload.active_power_A * Math.pow(10, sf))
        msg.payload.active_power_A_sf = -1 * sf
    } else
        msg.payload.active_power_A_sf = 0
} else if (typeof msg.payload.current_A != "undefined"){
    msg.payload.active_power_A = msg.payload.current_A * msg.payload.voltage_A * Math.trunc(msg.payload.power_factor_A*100)
    msg.payload.active_power_A_sf = msg.payload.current_A_sf + msg.payload.voltage_A_sf - 2
}
/*B*/
if (typeof msg.payload.active_power_B != "undefined") {
    if (!Number.isInteger(msg.payload.active_power_B)) {
        let sf = ("" + ("" + msg.payload.active_power_B).split('.')[1]).length
        msg.payload.active_power_B = Math.trunc(msg.payload.active_power_B * Math.pow(10, sf))
        msg.payload.active_power_B_sf = -1 * sf
    } else
        msg.payload.active_power_B_sf = 0
} else if (typeof msg.payload.current_B != "undefined") {
    msg.payload.active_power_B = msg.payload.current_B * msg.payload.voltage_B * Math.trunc(msg.payload.power_factor_B * 100)
    msg.payload.active_power_B_sf = msg.payload.current_B_sf + msg.payload.voltage_B_sf - 2
}
/*C*/
if (typeof msg.payload.active_power_C != "undefined") {
    if (!Number.isInteger(msg.payload.active_power_C)) {
        let sf = ("" + ("" + msg.payload.active_power_C).split('.')[1]).length
        msg.payload.active_power_C = Math.trunc(msg.payload.active_power_C * Math.pow(10, sf))
        msg.payload.active_power_C_sf = -1 * sf
    } else
        msg.payload.active_power_C_sf = 0
} else if (typeof msg.payload.current_C != "undefined") {
    msg.payload.active_power_C = msg.payload.current_C * msg.payload.voltage_C * Math.trunc(msg.payload.power_factor_C * 100)
    msg.payload.active_power_C_sf = msg.payload.current_C_sf + msg.payload.voltage_C_sf - 2
}

/*apparent_power*/
/*A*/
if (typeof msg.payload.apparent_power_A != "undefined") {
    if (!Number.isInteger(msg.payload.apparent_power_A)) {
        let sf = ("" + ("" + msg.payload.apparent_power_A).split('.')[1]).length
        msg.payload.apparent_power_A = Math.trunc(msg.payload.apparent_power_A * Math.pow(10, sf))
        msg.payload.apparent_power_A_sf = -1 * sf
    } else
        msg.payload.apparent_power_A_sf = 0
}else if (typeof msg.payload.current_A != "undefined") {
    msg.payload.apparent_power_A = ((msg.payload.active_power_A * Math.pow(10, msg.payload.active_power_A_sf)) / msg.payload.power_factor_A).toFixed(5)
    
    let sf = ("" + ("" + msg.payload.apparent_power_A).split('.')[1]).length
    msg.payload.apparent_power_A = Math.trunc(msg.payload.apparent_power_A * Math.pow(10, sf))
    msg.payload.apparent_power_A_sf = -1 * sf
}
/*B*/
if (typeof msg.payload.apparent_power_B != "undefined") {
    if (!Number.isInteger(msg.payload.apparent_power_B)) {
        let sf = ("" + ("" + msg.payload.apparent_power_B).split('.')[1]).length
        msg.payload.apparent_power_B = Math.trunc(msg.payload.apparent_power_B * Math.pow(10, sf))
        msg.payload.apparent_power_B_sf = -1 * sf
    } else
        msg.payload.apparent_power_B_sf = 0
} else if (typeof msg.payload.current_B != "undefined") {
    msg.payload.apparent_power_B = ((msg.payload.active_power_B * Math.pow(10, msg.payload.active_power_B_sf)) / msg.payload.power_factor_B).toFixed(5)

    let sf = ("" + ("" + msg.payload.apparent_power_B).split('.')[1]).length
    msg.payload.apparent_power_B = Math.trunc(msg.payload.apparent_power_B * Math.pow(10, sf))
    msg.payload.apparent_power_B_sf = -1 * sf
}
/*C*/
if (typeof msg.payload.apparent_power_C != "undefined") {
    if (!Number.isInteger(msg.payload.apparent_power_C)) {
        let sf = ("" + ("" + msg.payload.apparent_power_C).split('.')[1]).length
        msg.payload.apparent_power_C = Math.trunc(msg.payload.apparent_power_C * Math.pow(10, sf))
        msg.payload.apparent_power_C_sf = -1 * sf
    } else
        msg.payload.apparent_power_C_sf = 0
} else if (typeof msg.payload.current_C != "undefined") {
    msg.payload.apparent_power_C = ((msg.payload.active_power_C * Math.pow(10, msg.payload.active_power_C_sf)) / msg.payload.power_factor_C).toFixed(5)

    let sf = ("" + ("" + msg.payload.apparent_power_C).split('.')[1]).length
    msg.payload.apparent_power_C = Math.trunc(msg.payload.apparent_power_C * Math.pow(10, sf))
    msg.payload.apparent_power_C_sf = -1 * sf
}

/*reactive_power*/
/*A*/
if (typeof msg.payload.reactive_power_A != "undefined") {
    if (!Number.isInteger(msg.payload.reactive_power_A)) {
        let sf = ("" + ("" + msg.payload.reactive_power_A).split('.')[1]).length
        msg.payload.reactive_power_A = Math.trunc(msg.payload.reactive_power_A * Math.pow(10, sf))
        msg.payload.reactive_power_A_sf = -1 * sf
    } else
        msg.payload.reactive_power_A_sf = 0
} else if (typeof msg.payload.current_A != "undefined") {
    msg.payload.reactive_power_A = (Math.sqrt(Math.pow((msg.payload.apparent_power_A * Math.pow(10, msg.payload.apparent_power_A_sf)), 2) - Math.pow((msg.payload.active_power_A * Math.pow(10, msg.payload.active_power_A_sf)), 2))).toFixed(5)
    
    let sf = ("" + ("" + msg.payload.reactive_power_A).split('.')[1]).length
    msg.payload.reactive_power_A = Math.trunc(msg.payload.reactive_power_A * Math.pow(10, sf))
    msg.payload.reactive_power_A_sf = -1 * sf
}
/*B*/
if (typeof msg.payload.reactive_power_B != "undefined") {
    if (!Number.isInteger(msg.payload.reactive_power_B)) {
        let sf = ("" + ("" + msg.payload.reactive_power_B).split('.')[1]).length
        msg.payload.reactive_power_B = Math.trunc(msg.payload.reactive_power_B * Math.pow(10, sf))
        msg.payload.reactive_power_B_sf = -1 * sf
    } else
        msg.payload.reactive_power_B_sf = 0
} else if (typeof msg.payload.current_B != "undefined") {
    msg.payload.reactive_power_B = (Math.sqrt(Math.pow((msg.payload.apparent_power_B * Math.pow(10, msg.payload.apparent_power_B_sf)), 2) - Math.pow((msg.payload.active_power_B * Math.pow(10, msg.payload.active_power_B_sf)), 2))).toFixed(5)

    let sf = ("" + ("" + msg.payload.reactive_power_B).split('.')[1]).length
    msg.payload.reactive_power_B = Math.trunc(msg.payload.reactive_power_B * Math.pow(10, sf))
    msg.payload.reactive_power_B_sf = -1 * sf
}
/*C*/
if (typeof msg.payload.reactive_power_C != "undefined") {
    if (!Number.isInteger(msg.payload.reactive_power_C)) {
        let sf = ("" + ("" + msg.payload.reactive_power_C).split('.')[1]).length
        msg.payload.reactive_power_C = Math.trunc(msg.payload.reactive_power_C * Math.pow(10, sf))
        msg.payload.reactive_power_C_sf = -1 * sf
    } else
        msg.payload.reactive_power_C_sf = 0
} else if (typeof msg.payload.current_C != "undefined") {
    msg.payload.reactive_power_C = (Math.sqrt(Math.pow((msg.payload.apparent_power_C * Math.pow(10, msg.payload.apparent_power_C_sf)), 2) - Math.pow((msg.payload.active_power_C * Math.pow(10, msg.payload.active_power_C_sf)), 2))).toFixed(5)

    let sf = ("" + ("" + msg.payload.reactive_power_C).split('.')[1]).length
    msg.payload.reactive_power_C = Math.trunc(msg.payload.reactive_power_C * Math.pow(10, sf))
    msg.payload.reactive_power_C_sf = -1 * sf
}

/*voltage_lag*/
/*AB*/
if (typeof msg.payload.angle_voltage_A_B != "undefined") {
    if (!Number.isInteger(msg.payload.angle_voltage_A_B)) {
        let sf = ("" + ("" + msg.payload.angle_voltage_A_B).split('.')[1]).length
        msg.payload.angle_voltage_A_B = Math.trunc(msg.payload.angle_voltage_A_B * Math.pow(10, sf))
        msg.payload.angle_voltage_A_B_sf = -1 * sf
    }
    else
        msg.payload.angle_voltage_A_B_sf = 0
}
/*AC*/
if (typeof msg.payload.angle_voltage_A_C != "undefined") {
    if (!Number.isInteger(msg.payload.angle_voltage_A_C)) {
        let sf = ("" + ("" + msg.payload.angle_voltage_A_C).split('.')[1]).length
        msg.payload.angle_voltage_A_C = Math.trunc(msg.payload.angle_voltage_A_C * Math.pow(10, sf))
        msg.payload.angle_voltage_A_C_sf = -1 * sf
    } else
        msg.payload.angle_voltage_A_C_sf = 0
}
/*BC*/
if (typeof msg.payload.angle_voltage_B_C != "undefined") {
    if (!Number.isInteger(msg.payload.angle_voltage_B_C)) {
        let sf = ("" + ("" + msg.payload.angle_voltage_B_C).split('.')[1]).length
        msg.payload.angle_voltage_B_C = Math.trunc(msg.payload.angle_voltage_B_C * Math.pow(10, sf))
        msg.payload.angle_voltage_B_C_sf = -1 * sf
    } else
        msg.payload.angle_voltage_B_C_sf = 0
}

/*temperature*/
if (typeof msg.payload.temperature != "undefined") {
    if (!Number.isInteger(msg.payload.temperature)) {
        let sf = ("" + ("" + msg.payload.temperature).split('.')[1]).length
        msg.payload.temperature = Math.trunc(msg.payload.temperature * Math.pow(10, sf))
        msg.payload.temperature_sf = -1 * sf
    } else
        msg.payload.temperature_sf = 0
}

/*frequency*/
if (typeof msg.payload.frequency != "undefined") {
    if (!Number.isInteger(msg.payload.frequency)) {
        let sf = ("" + ("" + msg.payload.frequency).split('.')[1]).length
        msg.payload.frequency = Math.trunc(msg.payload.frequency * Math.pow(10, sf))
        msg.payload.frequency_sf = -1 * sf
    } else
        msg.payload.frequency_sf = 0
} else{
    msg.payload.frequency = 60
    msg.payload.frequency_sf = 0
}

/*date_time_stamp*/
msg.payload.date_time_stamp = new Date()
msg.payload = JSON.parse(JSON.stringify(msg.payload));

/*message_counter*/
var count = flow.get("count") || 0
count += 1
flow.set("count", count)

msg.payload.message_counter     = count

return msg;
```
---
### <a name="anexo-13"><a/><div align="center"> Anexo XIII - Contador de mensagens</div>
	
|<img src="https://user-images.githubusercontent.com/56831082/225415813-955765d0-9607-411c-835a-959d5c736322.png"><br><sub>Verifica</sub>|<img src="https://user-images.githubusercontent.com/56831082/225415841-1f6f79ff-6c02-4082-939f-142eadfd89de.png"><br><sub>Zara contador</sub>|
| :---: | :---: |

---
### <a name="anexo-14"><a/><div align="center"> Anexo XIV -Duplica</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225429013-b1c3c64a-56e2-4551-8ef7-3443d3cc5bbd.png"><br>
</div>

---

### <a name="anexo-15"><a/><div align="center"> Anexo XV - postgresql</div>

**Query**
```sql
	SELECT id FROM public.organic_nodes_control_mqttaccess where mqtt_id = '{{msg.temp.id}}';
```

---
### <a name="anexo-16"><a/><div align="center"> Anexo XVI - Verifica Cadastro no banco</div>
	
<div align="center"> 
	<img src="https://user-images.githubusercontent.com/56831082/225429027-ecfd82dd-b59c-43c5-ac7e-0ad7f93c418a.png"><br>
</div>

---
### <a name="anexo-17"><a/><div align="center"> Anexo XVII - postgresql</div>
	
**Query**
```sql
	(SELECT phase FROM public.organic_nodes_control_circuit WHERE id = (SELECT circuit_id FROM public.organic_nodes_control_setup WHERE device_id = (SELECT device_id FROM public.organic_nodes_control_mqttdevice WHERE (mqtt_access_id = (SELECT id FROM public.organic_nodes_control_mqttaccess WHERE mqtt_id = '{{msg.temp.id}}')))))
```
	
---
### <a name="anexo-18"><a/><div align="center"> Anexo XVIII - Segregação</div>
	
```javascript
var msg2 = {}
msg2.payload = msg.temp

if (typeof msg.payload[0].phase != "undefined"){
    try{
        msg2.payload.phase_A = msg.payload[0].phase[0]
        msg2.payload.phase_B = msg.payload[0].phase[1]
        msg2.payload.phase_C = msg.payload[0].phase[2]
    } catch(e){}
    return msg2;
}
```

---
### <a name="anexo-19"><a/><div align="center"> Anexo XIX - Identificação instalação</div>
	
<div align="center">
	<img src="https://user-images.githubusercontent.com/56831082/225612131-ab817d37-0f29-4c0f-8883-da8a06071543.png"><br>	
</div>

---

### <a name="anexo-20"><a/><div align="center"> Anexo XX - Cria instacia Monofasico</div>
	
```SQL
INSERT INTO public.organic_nodes_control_measurement(
	date_time_stamp,	message_counter,	setup_id,	source)
	VALUES ('{{payload.date_time_stamp}}', {{payload.message_counter}}, (SELECT id FROM public.organic_nodes_control_setup WHERE (device_id = (SELECT device_id FROM public.organic_nodes_control_mqttdevice WHERE (mqtt_access_id = (SELECT id FROM public.organic_nodes_control_mqttaccess WHERE (mqtt_id = '{{payload.id}}')))))), 0);

INSERT INTO public.organic_nodes_control_frequencymeasure(
	frequency,	frequency_sf,	measurement_id)
	VALUES ({{payload.frequency}}, {{payload.frequency_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_sensormeasure(
	temperature,	temperature_sf,	measurement_id)
	VALUES ({{payload.temperature}}, {{payload.temperature_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
	
INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.current_A}},{{payload.current_A_sf}},{{payload.voltage_A}},{{payload.voltage_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.voltage_current_angle_A}},{{payload.voltage_current_angle_A_sf}},{{payload.power_factor_A}},{{payload.active_power_A}}, {{payload.active_power_A_sf}}, {{payload.reactive_power_A}}, {{payload.reactive_power_A_sf}}, {{payload.apparent_power_A}}, {{payload.apparent_power_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

```

---
### <a name="anexo-21"><a/><div align="center"> Anexo XXI - Cria instacia Bifasico</div>
	
```SQL
INSERT INTO public.organic_nodes_control_measurement(
	date_time_stamp,	message_counter,	setup_id,	source)
	VALUES ('{{payload.date_time_stamp}}', {{payload.message_counter}}, (SELECT id FROM public.organic_nodes_control_setup WHERE (device_id = (SELECT device_id FROM public.organic_nodes_control_mqttdevice WHERE (mqtt_access_id = (SELECT id FROM public.organic_nodes_control_mqttaccess WHERE (mqtt_id = '{{payload.id}}')))))), 0);

INSERT INTO public.organic_nodes_control_frequencymeasure(
	frequency,	frequency_sf,	measurement_id)
	VALUES ({{payload.frequency}}, {{payload.frequency_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_sensormeasure(
	temperature,	temperature_sf,	measurement_id)
	VALUES ({{payload.temperature}}, {{payload.temperature_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
	
INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.current_A}},{{payload.current_A_sf}},{{payload.voltage_A}},{{payload.voltage_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.voltage_current_angle_A}},{{payload.voltage_current_angle_A_sf}},{{payload.power_factor_A}},{{payload.active_power_A}}, {{payload.active_power_A_sf}}, {{payload.reactive_power_A}}, {{payload.reactive_power_A_sf}}, {{payload.apparent_power_A}}, {{payload.apparent_power_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_B}}', {{payload.current_B}},{{payload.current_B_sf}},{{payload.voltage_B}},{{payload.voltage_B_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_B}}', {{payload.voltage_current_angle_B}},{{payload.voltage_current_angle_B_sf}},{{payload.power_factor_B}},{{payload.active_power_B}}, {{payload.active_power_B_sf}}, {{payload.reactive_power_B}}, {{payload.reactive_power_B_sf}}, {{payload.apparent_power_B}}, {{payload.apparent_power_B_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_voltagelagmeasure(
	angle, angle_sf,	phase_combination, measurement_id)
	VALUES ({{payload.angle_voltage_A_B}}, {{payload.angle_voltage_A_B_sf}}, '{{payload.phase_A}}{{payload.phase_B}}', (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
```

---
### <a name="anexo-22"><a/><div align="center"> Anexo XXII - Cria instacia Trifasico</div>
	
```SQL
INSERT INTO public.organic_nodes_control_measurement(
	date_time_stamp,	message_counter,	setup_id,	source)
	VALUES ('{{payload.date_time_stamp}}', {{payload.message_counter}}, (SELECT id FROM public.organic_nodes_control_setup WHERE (device_id = (SELECT device_id FROM public.organic_nodes_control_mqttdevice WHERE (mqtt_access_id = (SELECT id FROM public.organic_nodes_control_mqttaccess WHERE (mqtt_id = '{{payload.id}}')))))), 0);

INSERT INTO public.organic_nodes_control_frequencymeasure(
	frequency,	frequency_sf,	measurement_id)
	VALUES ({{payload.frequency}}, {{payload.frequency_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_sensormeasure(
	temperature,	temperature_sf,	measurement_id)
	VALUES ({{payload.temperature}}, {{payload.temperature_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
	
INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.current_A}},{{payload.current_A_sf}},{{payload.voltage_A}},{{payload.voltage_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_A}}', {{payload.voltage_current_angle_A}},{{payload.voltage_current_angle_A_sf}},{{payload.power_factor_A}},{{payload.active_power_A}}, {{payload.active_power_A_sf}}, {{payload.reactive_power_A}}, {{payload.reactive_power_A_sf}}, {{payload.apparent_power_A}}, {{payload.apparent_power_A_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_B}}', {{payload.current_B}},{{payload.current_B_sf}},{{payload.voltage_B}},{{payload.voltage_B_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_B}}', {{payload.voltage_current_angle_B}},{{payload.voltage_current_angle_B_sf}},{{payload.power_factor_B}},{{payload.active_power_B}}, {{payload.active_power_B_sf}}, {{payload.reactive_power_B}}, {{payload.reactive_power_B_sf}}, {{payload.apparent_power_B}}, {{payload.apparent_power_B_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_voltagelagmeasure(
	angle, angle_sf,	phase_combination, measurement_id)
	VALUES ({{payload.angle_voltage_A_B}}, {{payload.angle_voltage_A_B_sf}}, '{{payload.phase_A}}{{payload.phase_B}}', (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
	
INSERT INTO public.organic_nodes_control_energymeasure(
	phase, current, current_sf, voltage, voltage_sf, measurement_id)
	VALUES ('{{payload.phase_C}}', {{payload.current_C}},{{payload.current_C_sf}},{{payload.voltage_C}},{{payload.voltage_C_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_powermeasure(
	phase, voltage_current_angle, voltage_current_angle_sf,	power_factor,	active_power,	active_power_sf,	reactive_power,	reactive_power_sf,	apparent_power,	apparent_power_sf	, measurement_id)
	VALUES ('{{payload.phase_C}}', {{payload.voltage_current_angle_C}},{{payload.voltage_current_angle_C_sf}},{{payload.power_factor_C}},{{payload.active_power_C}}, {{payload.active_power_C_sf}}, {{payload.reactive_power_C}}, {{payload.reactive_power_C_sf}}, {{payload.apparent_power_C}}, {{payload.apparent_power_C_sf}}, (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_voltagelagmeasure(
	angle, angle_sf,	phase_combination, measurement_id)
	VALUES ({{payload.angle_voltage_A_C}}, {{payload.angle_voltage_A_C_sf}}, '{{payload.phase_A}}{{payload.phase_C}}', (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));

INSERT INTO public.organic_nodes_control_voltagelagmeasure(
	angle, angle_sf,	phase_combination, measurement_id)
	VALUES ({{payload.angle_voltage_B_C}}, {{payload.angle_voltage_B_C_sf}}, '{{payload.phase_B}}{{payload.phase_C}}', (SELECT id FROM public.organic_nodes_control_measurement WHERE (message_counter = {{payload.message_counter}} AND date_time_stamp = '{{payload.date_time_stamp}}') LIMIT 1));
```

---
### <a name="anexo-23"><a/><div align="center"> Anexo XXIII - Parametros</div>
	
```javascript
msg.queryParameters = msg.payload

let sinc = global.get("sincronizando_remoto") || false

if (sinc == false)
    return [msg, msg];
else 
    return [null, msg];
```

---
</div>
