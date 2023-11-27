# INCEPTION

### 1. [Definitions](#definitions)
### 2. [Nginx](#nginx)
### 3. [Wordpress](#wordpress)
### 4. [MariaDB](#mariadb)

This project from 42 school aims to broaden your knowledge of system administration by using Docker. In this tutorial you will virtualize several Docker images, creating them in your new personal virtual machine. In this read.me you will have an inception tutorial to know how the project works.

## Important things to read before beginning the project

1. **Don't try to do all the containers** (Nginx, wordpress and mariaDB) at the same time.
You will be lost and you will not understand properly how it works. Do it step by step.

2. **Begin with Nginx** by displaying an index.html page 
	- Learn first how to launch a docker image && to execute this image **without using docker-compose**
	- Learn How to display an html page on http://localhost:80"
	- Learn how to display an html page with SSL on http://localhost:443"

3. **Do Wordpress**
	- You can begin from here the docker-compose file, you don't need it before

4. **Finish with MariaDB.**
You want to try if each container works in general? No worries, you will be able to do it by importing images for wordpress and mariaDB from the hub.  

The 3 github which helped me a lot for the project : [llescure](https://github.com/llescure/42_Inception), [malatini](https://github.com/42cursus/inception) and [vbachele](https://github.com/vbachele/Inception) 

5. **Useful things to know about Inception.**
- On the mac, Apache service is installed by default. I deleted Apache from my computer to avoid any problem with nginx
- If you are at 42 on their computer you should stop these services which are running by default
```c
sudo service nginx stop
sudo service mariadb stop
sudo service apache2 stop
sudo service mysql stop
```

# DEFINITIONS

## Useful links
- [Best practices for building containers](https://cloud.google.com/architecture/best-practices-for-building-containers)
- [Tutorial about docker-compose](https://openclassrooms.com/en/courses/7905646-optimize-your-deployment-with-docker-containers)
- [What is Docker in general](https://www.educative.io/blog/docker-compose-tutorial)
- [What is Docker network](https://www.aquasec.com/cloud-native-academy/docker-container/docker-networking/)

## What is Docker ?
Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.
Docker provides the ability to package and run an application in a loosely isolated environment called a container.

## How to install Docker
For this project, I need to use WSL on my laptop and I had to install Docker:
- I went directly to the docker website and I downloaded [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)
- I installed docker on the machine
- I tested to run a dockerfile thanks to the command docker run hello-world

## What is a Dockerfile ?
Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

## How to write a Dockerfile
- Create a filename Dockerfile
- Write your command inside the doc
- Build the Dockerfile with the command "docker build -t "nameYouChoose"."
- Execute the Dockerfile with the command: docker run "nameYouChoose"

Here are the most common types of instructions:

- FROM [image] - defines a base for your image. exemple : FROM debian
- RUN [command] - executes any commands in a new layer on top of the current image and commits the result. RUN also has a shell form for running commands.
- WORKDIR [directory] - sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it in the Dockerfile. (You go directly in the directory you choose)
- COPY [src] [dest] - copies new files or directories from [src] and adds them to the filesystem of the container at the path [dest].
- CMD [command] - lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one CMD, and only the last CMD instance is respected when multiple ones exist.

## What is Docker-compose ?
Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

## Commands
### Docker-compose commands
```c
- docker-compose up -d --build, //Create and build all the containers and they still run in the background
- docker-compose ps, //Check the status for all the containers
- docker-compose logs -f --tail 5, //see the first 5 lines of the logs of your containers
- docker-compose stop , //stop a stack of your docker compose
- docker-compose down, //destroy all your ressources
- docker-compose config, //check the syntax of you docker-compose file
```

### General commands
```c
- docker ps or docker ps -a //show the names of all the containers you have + the id you need and the port associated.
- docker pull "NameOfTheImage" // pull an image from dockerhub
- docker "Three first letter of your docker" // show the logs of your last run of dockers
- docker rm $(docker ps -a -q) //allow to delete all the opened images
- docker exec -it "Three first letter of your docker" /bin/bash // to execute the program with the shell
```

### Running containers
```c
- docker run "name of the docker image" //to run the docker container
- docker run -d, // run container in background
- docker run -p,// publish a container's port to the host
- docker run -P, // publish all exposed port to random ports
- docker run -it "imageName", // the program will continue to function, and it will be possible to interact with the container
- docker run -name sl mysql, //give a name for the container instead an ID
- docker run -d -p 7000:80 test:latest
```

### Images
```c
- docker image rm -f "image name/id", //delete the image, if the image is running you need to kill it first.
- docker image kill "name", //stop a running image,
```

# NGINX

## How to set up (our web server)
- Nginx is a webserver which stores hmtl, js, images files and use http request to display a website.
- [nginx.conf](<http://nginx.org/en/docs/beginners_guide.html>) document will be used to config our server and the right proxy connexion.

## Configure .conf file
### Useful links
- [Location explanations](<https://www.digitalocean.com/community/tutorials/nginx-location-directive>)
- [What is a proxy server](<https://www.varonis.com/fr/blog/serveur-proxy>)
- [All Nginx definitions](<http://nginx.org/en/docs/http/ngx_http_core_module.html>)
- [Nginx command line](<https://www.nginx.com/resources/wiki/start/topics/tutorials/commandline/>)
- [PID 1 signal handling && Nginx](https://cloud.google.com/architecture/best-practices-for-building-containers#signal-handling)
- [What is TLS ?](https://en.wikipedia.org/wiki/Transport_Layer_Security)

### Listen && Location
- Listen will indicate to the server which request it has to accept:
	Listen can take ports and adresses : example Listen 80;
- The location directive within Nginx server block allows to route request to correct location within the file system.
	The directive is used to tell Nginx where to look for a resource by including files and folders while matching a location block against an URL.

## Steps to add in localhost by configuring  (This point works only on the Mac and not the VM)
1. I added to my /var/www/ directory an index html file
2. I configured the default file in etc/nginx/conf.d/
3. I added a server bracket with a location to var/www/ in the doc.

## How to change your localhost by your_login.42.fr
1. Go to the file /etc/hosts (on Windows:  C:/Windows/System32/drivers/etc/hosts)
2. Add the following line : "127.0.0.1 your_login.42.fr"

## FastCGI (or how to process PHP with Nginx)
### Useful links
- [What is http](https://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol)
- [Difference between http && tcp](https://www.goanywhere.com/blog/http-vs-tcp-whats-the-difference#:~:text=TCP%20contains%20information%20about%20what,data%20in%20the%20stream%20contains.)
- [PHP Fast CGI Examples](https://www.nginx.com/resources/wiki/start/topics/examples/phpfcgi/)
- [Why using fastcgi_pass 127.0.0.1:9000](https://serverfault.com/questions/1094793/what-is-this-nginx-location-for-php-fpm-fastcgi-pass-127-0-0-19000-really-doing)
- [Install Nginx with php-fpm in video](https://www.youtube.com/watch?v=I_9-xWmkh28&ab_channel=ProgramWithGio)
- [Fast CGI explanations commands](https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx)

PHP-FPM (for Fast-CGI Process Manager) runs as an isolated service when you use PHP-FPM.
	Employing this PHP version as the language interpreter means requests will be processed via a TCP/IP socket,
	and the Nginx server handles HTTP requests only, while PHP-FPM interprets the PHP code. Taking advantage of two separate services is vital to become more efficient.
	It features with Wordpress


# WORDPRESS 

## Useful links
- [What is the wordpress CLI](https://www.dreamhost.com/wordpress/guide-to-wp-cli/#:~:text=The%20WP%2DCLI%20is%20a,faster%20using%20the%20WP%2DCLI.)  
- [Know more about wp-config.php](https://wpformation.com/wp-config-php-et-functions-php-fichiers-wordpress/)  
- [php-fpm configuration](https://myjeeva.com/php-fpm-configuration-101.html)  

## Steps to create your Wordpress image
1. **Create your Dockerfile**
	- Download php-fpm
	- Copy the www.conf file in php/7.3/fpm/pool.d/
	- Create the php directory to enable php-fpm to run
	- Copy the script and launch it
	- Go to the html directory
	- Launch php-fpm

2. **Create a script**
	- Download Wordpress
	- Create the configuration file of Wordpress
	- Move files from Wordpress in the html directory
	- Give the 4th environmental variables for Wordpress

3. **Create a www.conf**
	- You need to edit www.conf and place it in /etc/php/7.3(the usual version of php on 42 VM)/fpm/pool.d and wp-content.php to disable access to the Wordpress installation page when you access your site at https://your_login.42.fr
	- Put listen = 0.0.0.0:9000 to listen to all ports
	- Increase the number for the pm values in order to avoid a 502 page


# MARIADB

MariaDB will be the database to store information about our wordpress users and settings.
In this section we have to create the Mariadb image and create 2 users.

## Useful links
- [Import-export databases](https://www.interserver.net/tips/kb/import-export-databases-mysql-command-line/)  
- [Create and give permissions to a user](https://www.daniloaz.com/en/how-to-create-a-user-in-mysql-mariadb-and-grant-permissions-on-a-specific-database/)  
- [Why create /var/run/mysqld directory](http://cactogeek.free.fr/autres/DocumentationLinux-Windows/LinuxUbuntu/ProblemeMYSQL-mysqld.sockInexistant.pdf)  
- [How to give all privileges for a user on a database](https://chartio.com/resources/tutorials/how-to-grant-all-privileges-on-a-database-in-mysql/)  
- [How to import a database](https://www.journaldunet.fr/web-tech/developpement/1202663-comment-importer-un-fichier-sql-dans-mysql-en-ligne-de-commande/)  

## Useful commands
```c
mysql -uroot // To connect on mysql CLI
SELECT User FROM mysql.user; // To see all the users
USE wordpress // To connect on your wordpress database
mysqldump -u username -p databasename > filename.sql // To export the file
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql // To import the file
```

## Steps to create your MariaDB image
1. **Create a Dockerfile**
	- Download mariadb-server && mariadb-client
	- To run MariaDB on your container, you have to copy your .sh and the .sql on the /var/local/bin/
	- Give the right to execute your mysqld (which is the daemon for mysql)
	- Launch your script to install MariaDB
	- Then do a CMD to enable the database to listen to all the IPV4 adresses.

2. **Create a script**
	- mariadb.sh initializes the MySQL data directory and creates the system tables that it contains, if they do not exist
	- In this script we downloaded MariaDB on the container, we have to install it and create the root user.
	- Then we launch the command line to give all the privileges to the root user. The function GRANT from mysqlcli (sql command line) gives access (or all access) to a user.

3. **Create your file.sql (two options)** 
	1. You create the database, the user and you give all privileges to the user
	as [malatini](https://github.com/42cursus/inception/blob/validated/srcs/requirements/mariadb/config/create_db.sql) did
	2. You export your own wordpress.sql as I did (and Lea did !!!!)
		- Step 1: Create your admin user on wordpress:
		You might don't know what it is, no problem! It means you will export your admin user from your database in order to put it in your .sql file.
			- Go to your Wordpress website (localhost:443) and create your user by using the same username and password as your .env file.
		- Step 2: Export your admin user.sql
		You have to go on your MariaDB container and do the following command
			- mysqldump -u 'username' -p 'databasename' > filename.sql *it will export your user on the filename.sql, please change username, databasename by what you put in your .env file*
			- You have a file called filename.sql in your current directory
			- "cat filename.sql" in your container and copy past to your .sql project.
			- Your .sql is ready now to be imported
		- Step 3: relaunch your docker-compose
			- TADA you will be directly in your website by passing the phase of installation !

## Commands to check if all is working
```c
	SHOW DATABASES; // show the databes
	use 'wordpress'; // go in the wordpress databse
	SHOW TABLES; // show all the tables from the database you selected
	SELECT wp_users.display_name FROM wp_users; // display username from wordpress database
	SELECT *  FROM wp_users; // select
```
