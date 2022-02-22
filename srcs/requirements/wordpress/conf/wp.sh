#!bin/env bash
#https://developer.wordpress.org/cli/commands/core/download/
#https://wp-cli.org/
if ! [ -f "/var/www/html/wp-config.php" ]; then
	#https://www.codegrepper.com/code-examples/shell/how+to+install+packages+on+cygwin+from+command+line
	apt-get install curl -y
   	
	apt-get install mariadb-client -y
    
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  	
	chmod +x wp-cli.phar
    
	mv wp-cli.phar /usr/local/bin/wp
	# https://developer.wordpress.org/cli/commands/core/download/#examples
 	wp core download --locale=en_US --path=wp --allow-root 
	cd wp	
    
	wp core config --dbhost=${WORDPRESS_DB_HOST} --dbname=${MYSQL_WP_NAME} --dbuser=${MYSQL_USER_NAME} --dbpass=${MYSQL_USER_PASSWORD} --allow-root
    
	wp core install --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_N} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root

    
	wp user create --allow-root mda-silv_2 mda-silv_2@student.42lisboa.com --role=author --user_pass=12345678
    
	mv * /var/www/html/
fi

exec "$@"

