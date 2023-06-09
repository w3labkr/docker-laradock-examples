###
### Copy createdb.sql.example to createdb.sql
### then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and need db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
###
### this sql script is auto run when mariadb container start and $DATA_PATH_HOST/mariadb not exists.
###
### if your $DATA_PATH_HOST/mariadb is exists and you do not want to delete it, you can run by manual execution:
###
###     docker-compose exec mariadb bash
###     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
###

CREATE DATABASE IF NOT EXISTS `laradock` CHARACTER SET utf8mb4 COLLATE 'utf8mb4_unicode_ci' ;

CREATE USER `laradock`@'localhost' IDENTIFIED BY 'secret' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON *.* TO `laradock`@'localhost';

CREATE USER `laradock`@'%' IDENTIFIED BY 'secret' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON *.* TO `laradock`@'%';

FLUSH PRIVILEGES;
