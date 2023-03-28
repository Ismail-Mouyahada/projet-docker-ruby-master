![Screenshot 2023-03-28 195716](https://user-images.githubusercontent.com/66369128/228327228-869d2506-73dd-4110-9e8f-ad1989fda5de.png)

# TD Docker 
## Pilote & Enseignant : Monsieur LERVILLE Fabien

#### Group : Ismail Mouyahada & Stanislas Thiebaud

 # Mini projet Docker avec Ruby on Rails

Créer un mini projet sur docker qui retourne “ Bonjour les DI 21 “ avec Ruby on rails

  1. Créer une image Docker Ruby on Rails
  Construire une image Docker avec Ruby et Rails en utilisant le Dockerfile suivant :

    FROM ruby:2.6.3
    RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
    RUN gem install rails -v 5.2.4
    COPY . /app
    WORKDIR /app
    ENTRYPOINT ["rails", "s", "p", "5000"]

  2. Créer une application Rails
  Créer une application Rails avec la commande :
  rails new . --api --database=postgresql
  3. Modifier le Dockerfile
  Remplacer la ligne COPY . /app par :
  COPY . /app
  4. Construire l'image Docker
  Construire l'image avec la commande :
  docker build -t rails-api .
  5. Lancer le conteneur Docker
  Lancer le conteneur avec la commande :
  docker run -p 5000:5000 rails-api
  6. Vérifier le résultat
  Accéder à [http://localhost:5000/hello](http://localhost:5000/hello)
  Vous devriez voir :
  Bonjour les DI 21

# Dockerfile

    FROM ruby:2.6.3
    RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
    RUN gem install rails -v 5.2.4
    COPY . /app
    WORKDIR /app
    ENTRYPOINT ["rails", "s", "p", "5000"]

# docker-compose.yml

    version: '3'
    services:
    rails-api:
    build: .
    ports:
    - 5000:5000
