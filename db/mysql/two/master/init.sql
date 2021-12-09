

grant replication slave,replication client on *.* to 'slave'@'%' identified by "root";
flush privileges;