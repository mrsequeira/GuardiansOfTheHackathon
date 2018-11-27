# README 
Software Engineering: 
* até 28 janeiro    

Vou no header_js.jsx para colocar o react a bombar

## Coisas que vou precisar sempre:
``` ruby
#Authentication
before action
# Ver rotas em: xxxx/router.rb
rails routes # Mostrar rotas para controladores
api namespace #gerar automaticamente a versão no ficheiro de rotas
```

## WHAT IS???(Basic you maybe don't know)
* Rack: a Ruby Webserver Interface``
Ruby version: 5.2.xx

## System dependencies
* Devise
https://www.youtube.com/watch?v=7v2EMmfBJL8&index=42&list=WL&t=519s 



## Migrate from SQLite3 to PostgreSQL
https://devcenter.heroku.com/articles/sqlite3 
1. Install Postgre on the machine
2. rails new -d postgresql
3. Install pg gem https://bitbucket.org/ged/ruby-pg/wiki/Home
rake db:setup
rake db:migrate
```bash
sudo -u postgres psql postgres
\z #list all of the tables, views, and sequences in the database
\connect database_name
SELECT * FROM table_name;
\q #Exit
```

## Configuration
### To add:
* Criar base de dados automatica etc etc

## Setup postreSQL db:
rake db:create && rake db:migrate

ref: https://stackoverflow.com/questions/21801837/psql-fatal-role-vagrant-does-not-exist


### If vagrant ask you the password
Password will be: vagrant
https://laracasts.com/discuss/channels/general-discussion/fortgot-vagrant-password?page=1

### Rbenv: https://github.com/rbenv/rbenv

```bash
sudo apt install rbenv #Enviroment install
rbenv init
```

## Inicializar o server em Rails https://guides.rubyonrails.org/getting_started.html 
```ruby
rails s # http://localhost:3000/

```


* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

