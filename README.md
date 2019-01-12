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

rails g scaffold_controller <name>
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

## Generate ER diagram
```bash
bundle exec erd #It will save a pdf file on root directory
```

## JWT auth: 
Advise: Use Postman or... use the stone age way
```bash
# Create a user:
http://localhost:3000/api/v1/authenticate/
# Obatin JWT (this was divided for security reasons)
http://localhost:3000/api/v1/login/

body example(json format):
{
	"email": "example@ipt.pt",
	"password" : "example"
}

```

## New aproach to use credentials on rails version >5.2
* You need the master.key - Create this file on config folder and paste the key provided by some guy/girl
* config.require_master_key = true - on every enviroment do you wanna use it(It is already done)
* Sleep because if you though this new version of rails would use the same approach as lowers versions, you must be overclocked!
* A pc

### How to use || Add new credentials on the file:
```bash
EDITOR=vim rails credentials:edit #EDIT - you can change your type of editor(i.e. sublime)
# Example: foo: bar
Rails.application.credentials.foo #ACESS - will return bar
```
https://www.engineyard.com/blog/rails-encrypted-credentials-on-rails-5.2

### If vagrant ask you the password
Password will be: vagrant
https://laracasts.com/discuss/channels/general-discussion/fortgot-vagrant-password?page=1

To add:
* Services (job queues, cache servers, search engines, etc.)


## Git free tips:
git show-branch -a
git checkout <branch-to-change>