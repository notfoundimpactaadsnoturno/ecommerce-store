# Bem-vindo ao ecommerce-store

### **Neste documento vamos mostrar como executar o projeto localmente.**

### **Para executá-lo é necessário que tenha instalado o docker**

Após baixar a branch master do nosso repositório

Acesse a pasta ecommerce-store e navegue para ecommerce-store\EcommerceStore\docker

Abra o terminal CMD como Administrador e execute o comando

docker-compose -f producao.yml up

Feito este passo serão necessários alguns minutos para o download das imagens, compilação e inicialização dos containers.

Serão criado alguns containers, dentre eles um container de SQL-SERVER que terá uma carga de produtos para os testes, este processo pode demorar 1 ou 2 minutos, neste processo, nossa API de pedidos pode não subir, isso ocorre devido o banco ainda não ter sido provisionado, basta aguardar a inserção dos dados do banco e o container da API de pedidos subirá normalmente.

Feito isso, basta acessar localhost e o aplicativo abrirá, pode ser que de uma mensagem de BAD REQUEST devido ao container demorar um pouco para responder, porém ele abrirá normalmente alguns segundos depois.

[docker](https://docs.docker.com/engine/install/centos/)

[docker-compose](https://docs.docker.com/compose/install/)
