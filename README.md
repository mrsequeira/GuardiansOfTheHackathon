# GuardiansOfTheHackathon 
* <Description of the project here>

## Deployment instructions
``` bash
# Use git bash or other command interpreter on the project directory and:
vagrant up # instanciate the machine
cd /vagrant # change directory
bundle install # install all libraries located on Gemfile
rails s # start server
```

## Temporary fix if you have problems with postgres authentication: (To be automated)
https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge
``` bash
sudo vim /etc/postgresql/10/main/pg_hba.conf # Change md5 local authentication to trust
sudo service postgresql restart
```

### How to Setup postreSQL db:
``` bash
rake db:create && rake db:migrate
```
##### ref: https://stackoverflow.com/questions/21801837/psql-fatal-role-vagrant-does-not-exist


## Basics:
``` ruby
rails s # http://localhost:3000/
#Authentication
before action
# Ver rotas em: xxxx/router.rb
rails routes # Mostrar rotas para controladores
api namespace #gerar automaticamente a versão de uma api,por exemplo, no ficheiro de rotas
```

## WHAT IS THIS??? (Basic you maybe don't know)
* Rack: a Ruby Webserver Interface``
Ruby version: 5.2.xx

## Connect to postgresSQL
```bash
sudo -u postgres psql postgres
\z #list all of the tables, views, and sequences in the database
\connect database_name
SELECT * FROM table_name;
\q #Exit
```

### If vagrant ask you the password
Password will be: vagrant
https://laracasts.com/discuss/channels/general-discussion/fortgot-vagrant-password?page=1

* Data final: até 28 janeiro    


To add:
* Services (job queues, cache servers, search engines, etc.)

