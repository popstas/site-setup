CREATE DATABASE IF NOT EXISTS `{db}`;
GRANT ALL ON `{db}` . * TO '{user}'@'localhost' identified by '{db_pass}';
