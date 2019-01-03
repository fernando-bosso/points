# README

## Pré requisitos:

### Docker, docker-compose

## Comandos

### docker-compose build web
### docker-compose run --rm web rake db:{create,migrate,seed} (para inicializar a base de dados)
### docker-compose up web (para subir o servidor)

### Acessar via http://localhost:3000

## Informações adicionais

### A pasta monitorada é a pasta ./storage/points, qualquer arquivo adicionado a ela será processado automaticamente caso esteja no formato correto.
