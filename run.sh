#!/bin/bash

/etc/init.d/mysqld start
mysql -e "create database ecs"
mysql -e "create table ecs.versionTable (version int(3))"
mysql -e "insert into ecs.versionTable (version) values (001)"
