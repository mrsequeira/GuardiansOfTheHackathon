[![Build Status](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon.svg?branch=master)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon)
[![Test Coverage](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon/badges/coverage.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![Issue Count](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon/badges/issue_count.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![Code Climate](https://codeclimate.com/github/codeclimate/codeclimate/badges/gpa.svg)](https://codeclimate.com/github/mrsequeira/GuardiansOfTheHackathon)
[![GitHub issues](https://img.shields.io/github/issues/mrsequeira/GuardiansOfTheHackathon.svg?style=plastic)](https://github.com/mrsequeira/GuardiansOfTheHackathon/issues)
[![security](https://hakiri.io/github/mrsequeira/GuardiansOfTheHackathon/master.svg)](https://hakiri.io/github/mrsequeira/GuardiansOfTheHackathon/master)
 [![Known Vulnerabilities](https://snyk.io/test/github/mrsequeira/GuardiansOfTheHackathon/badge.svg)](https://snyk.io/test/github/mrsequeira/GuardiansOfTheHackathon) 

[![Build history](https://buildstats.info/travisci/chart/mrsequeira/GuardiansOfTheHackathon?branch=master)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon/builds)
[![Build history](https://buildstats.info/travisci/chart/mrsequeira/GuardiansOfTheHackathon)](https://travis-ci.org/mrsequeira/GuardiansOfTheHackathon/builds)


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
