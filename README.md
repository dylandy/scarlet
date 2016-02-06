#Scarlet Template
---
Scarlet is a web-application framework with simple MVC architecture.

##Dependencies

1. Ruby > 2.0
1. gem bundler ( if ruby version > 2.2 )
1. mysql server  

##Getting started
---
* install the dependencies

```
$ bundle install
```

* config database setting in config folder
* create database

```
$ rake db:create
```

* add database migration

```
$ ./bin/scarlet generate db_migration_name

> this will create a migration file in *db/migrate/*
> after writing the migration file remember to migrate your database 
> rake db:migrate
> after migrate your database create a model in app/model folder
```

* add your routing rules in *config/routes*
* start server 

```
$ ./bin/scarlet server start
```

* stop server

```
$ ./bin/scarlet server stop
```

* restart server

```
$ ./bin/scarlet server restart
```

* you can start a console to validate the code for your ORM and your model  

```
$ ./bin/scarlet console
```

##TODO

1. wrap the framework into gem
1. show all existing routing in CLI tool

##LICENSE

The scarlet framework is released under the MIT license.