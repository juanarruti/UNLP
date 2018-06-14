#!/bin/bash

# Instalacion MySQL 5.7 - Engine MyRocks, TokuDB - SO Red Hat 7

sudo su -
setenforce 0
yum -y install http://www.percona.com/downloads/percona-release/redhat/0.1-4/percona-release-0.1-4.noarch.rpm
yum -y install Percona-Server-server-57
yum -y install Percona-Server-rocksdb-57
yum -y install Percona-Server-tokudb-57

# Setear IO scheduler a noop
echo "deadline">/sys/block/xvda/queue/scheduler

# Deshabilitar transparent hugepage para TokuDB
echo never > /sys/kernel/mm/transparent_hugepage/enabled
echo never > /sys/kernel/mm/transparent_hugepage/defrag

# Descargar my.cnf inicial para MySQL del repositorio GitHub
yum -y install wget
wget https://raw.githubusercontent.com/juanarruti/UNLP/master/my.cnf.1
mv -f ./my.cnf.1 /etc/my.cnf

# Iniciar la base de datos
service mysql start

# Modificacion de la password random creada al inicio
mysql -u root -p$(grep password /var/log/mysqld.log | awk '{ print $11 }') -e "ALTER USER USER() IDENTIFIED BY 'Welcome2018*';" --connect-expired-password

# Descargar my.cnf con accessos para root 
wget https://raw.githubusercontent.com/juanarruti/UNLP/master/my.cnf.2
mv -f ./my.cnf.2 /etc/my.cnf

# Instalacion de engine MyRocks
ps-admin --enable-rocksdb -u root

# Instalacion de engine TokuDB
ps-admin --enable-tokudb -u root

# Restart MySQL
service mysql restart

# Es necesario correr nuevamente el script para instalar el engine TokuDB
ps-admin --enable-tokudb -u root

# Instalacion sysbench
yum -y install sysbench

# END
