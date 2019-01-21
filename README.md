[![Build Status](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon.svg?branch=master)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon)
[![Test Coverage](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon/badges/coverage.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![Issue Count](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon/badges/issue_count.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![GitHub issues](https://img.shields.io/github/issues/mrsequeira/GuardiansOfTheHackathon.svg?style=plastic)](https://github.com/mrsequeira/GuardiansOfTheHackathon/issues)
[![security](https://hakiri.io/github/mrsequeira/GuardiansOfTheHackathon/master.svg)](https://hakiri.io/github/mrsequeira/GuardiansOfTheHackathon/master)
 [![Known Vulnerabilities](https://snyk.io/test/github/mrsequeira/GuardiansOfTheHackathon/badge.svg)](https://snyk.io/test/github/mrsequeira/GuardiansOfTheHackathon) 

[![Build history](https://buildstats.info/travisci/chart/mrsequeira/GuardiansOfTheHackathon?branch=master)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon/builds)
[![Build history](https://buildstats.info/travisci/chart/mrsequeira/GuardiansOfTheHackathon)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon/builds)

### Backend:
[![Heroku](https://heroku-badge.herokuapp.com/?app=guardianshackatum)](https://guardianshackatum.herokuapp.com/api/v1/)


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

rails g scaffold_controller <name> # generate controller for a certain model
```

## Connect to postgresSQL
```bash
sudo -su postgres 
psql  -d vagrant_development -c  "SELECT * FROM users;"
OR
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
Advise: Use Postman or... use the stone age way as described:(can be util for frontend request using axios or fetch)
###  Create a user:
```bash
1. http://localhost:3000/api/v1/register/
	body example(json format):
	{
		"email": "example@ipt.pt",
		"password" : "example"
	}
2. Sended email confirmation
3. http://localhost:3000/api/v1/login/ # Obatin JWT (this was divided for security reasons)
	body example(json format):
	{
		"email": "example@ipt.pt",
		"password" : "example"
	}
```
### Forgot password(need email):
```bash
1. http://localhost:3000/api/v1/forgot/
2. Sended email to reset password
3. http://localhost:3000/api/v1/reset/
	body example(json format):
	{
		"password" : "newexample"
	}
```

### Requests for routes needing authorization:
```bash
http://localhost:3000/api/v1/participants/
	body example(json format):
	{
		"Authorization" : "Bearer <tokenhere>"
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

Forget to create branch and have already commited files?(Use stash on addition!!!!)
https://stackoverflow.com/questions/9529078/how-do-i-use-git-reset-hard-head-to-revert-to-a-previous-commit

### Merge development branch before doing pull request
git pull origin development
