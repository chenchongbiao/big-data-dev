use mysql;
create user 'hive'@'%' identified by 'root';
grant all privileges on *.* to 'hive'@'%' with grant option;
flush privileges;