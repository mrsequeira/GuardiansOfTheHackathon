# Guardians of the Hackathon 
* Description of the project here

## Technologies:
* Rack: a Ruby Webserver Interface`
* ++;

## Connect to machine instructions
``` bash
# Use git bash or other command interpreter on the project directory 
vagrant up # instanciate the machine
vagrant ssh # ssh into the machine
```

## Basics:
``` ruby
cd /vagrant
rails s # http://localhost:3000/
before action #To controll routes via permissions(admin,etc)
# Ver rotas em: xxxx/router.rb
rails routes # Mostrar rotas para controladorses
api namespace #gerar automaticamente a versão de uma api,por exemplo, no ficheiro de rotas
```

## Connect to postgresSQL
```bash
sudo -su postgres
psql
\l #list all of the tables, views, and sequences in the database
\connect database_name
SELECT * FROM table_name;
\q #Exit
```
To add:
* Services (job queues, cache servers, search engines, etc.)

### If vagrant ask you the password
Password will be: vagrant
https://laracasts.com/discuss/channels/general-discussion/fortgot-vagrant-password?page=1