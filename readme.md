

Site de l'organisme de formation fictif EcoIt.

## Prérequis

* PHP 8.1
    * symfony 6.0+
* Node.JS 16 +
    * yarn
* Mysql
* Apache ( Xampp, Lamp ...)



## Deploiement local

### Installation
```bash
composer install
yarn install
```


### Base de données

1. Avant d'éxecuter ces commandes il faut créer un fichier , `.env.local` contenant les informations de la base de donée dans la variable `DATABASE_URL`.  Ainsi que `APP_ENV=prod` pour un environement de production.

```bash
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
```

2. Optionel
Le fichier `backup-eco-it.sql` contient un jeu de fausse données. L’installation se fait grâce à la commande `mysqldump nom_de_la_base_de_donnee < backup-eco-it.sql`


### Execution
```bash
yarn run build
symfony console server:start
```


## Deploiement Heroku

```bash
heroku login

heroku create
echo 'web: heroku-php-apache2 public/' > Procfile
git add Procfile
git commit -m "Heroku Procfile"

heroku config:set APP_ENV=prod

heroku addons:create cleardb:ignite
heroku config | grep CLEARDB_DATABASE_URL

heroku run php bin/console doctrine:database:create
heroku run php bin/console doctrine:migrations:migrate

git push heroku main

```