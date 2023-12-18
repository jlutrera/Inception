# INCEPTION

### 1. [Definitions](#definitions)
### 2. [Nginx](#nginx)
### 3. [Wordpress](#wordpress)
### 4. [MariaDB](#mariadb)
### 5. [Virtual  Machine](#Virtual-Machine) 

This project from 42 school aims to broaden your knowledge of system administration by using Docker. In this tutorial you will virtualize several Docker images, creating them in your new personal virtual machine. In this read.me you will have an inception tutorial to know how the project works.

## Important things to read before beginning the project

1. **Don't try to do all the containers** (Nginx, wordpress and mariaDB) at the same time.
You will be lost and you will not understand properly how it works. Do it step by step.

2. **Begin with Nginx** by displaying an index.html page 
	- Learn first how to launch a docker image && to execute this image **without using docker-compose**
	- Learn How to display an html page on http://localhost:80
	- Learn how to display an html page with SSL on http://localhost:443

3. **Do Wordpress**
	- You can begin from here the docker-compose file, you don't need it before

4. **Finish with MariaDB.**
	- You want to try if each container works in general? No worries, you will be able to do it by importing images for wordpress and mariaDB from the hub.  

5. **Useful things to know about Inception.**
	- On my Windows pc, I had to install Ducker Desktop and enable "Use the WSL 2 based engine" in the configuration

The 3 github which helped me a lot for the project : [llescure](https://github.com/llescure/42_Inception), [malatini](https://github.com/42cursus/inception) and [vbachele](https://github.com/vbachele/Inception) 

# DEFINITIONS

## Useful links
- [Best practices for building containers](https://cloud.google.com/architecture/best-practices-for-building-containers)
- [Tutorial about docker-compose](https://openclassrooms.com/en/courses/7905646-optimize-your-deployment-with-docker-containers)
- [What is Docker in general](https://www.educative.io/blog/docker-compose-tutorial)
- [What is Docker network](https://www.aquasec.com/cloud-native-academy/docker-container/docker-networking/)

## What is Docker ?
Docker is a platform for developing, shipping, and running applications in containers. Containers are lightweight, standalone, and executable packages that include everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Docker provides a way to package and distribute applications and their dependencies in a consistent and reproducible manner across different environments.

Here's a brief explanation of how Docker works:

- Docker Engine: At the core of Docker is the Docker Engine, which is a lightweight and portable runtime. It runs on the host machine's operating system and manages the containers.

- Docker Image: A Docker image is a lightweight, standalone, and executable package that includes the application code, runtime, system libraries, and settings. Images are the building blocks for containers and can be created manually or using a Dockerfile, which is a script that specifies the steps to create an image.

- Containerization: Containers are instances of Docker images. They run in isolated environments on the host machine, ensuring consistency and reproducibility across different environments. Containers share the host machine's kernel but have their own file systems, processes, and network interfaces.

- Docker Hub (or Registry): Docker Hub is a cloud-based registry service that allows you to share and distribute Docker images. You can store your images on Docker Hub or other container registries, making it easy to share your applications with others.

- Docker Compose: Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to describe the services, networks, and volumes in a YAML file and then use a single command to start and run your entire application stack.

- Docker Swarm and Kubernetes: Docker Swarm and Kubernetes are container orchestration tools that help manage and scale applications running in containers. They automate the deployment, scaling, and management of containerized applications, making it easier to handle large and complex systems.

In summary, Docker simplifies the process of developing, packaging, and deploying applications by using containers. It provides a consistent and reproducible environment, making it easier for developers to collaborate and deploy applications across different environments.

## Docker vs. Virtual Machines
Docker and virtual machines (VMs) are both technologies used for virtualization, but they have distinct differences in their architectures and use cases. Here are some benefits of Docker over traditional virtual machines:

### Resource Efficiency:

- Docker: Containers share the host operating system's kernel and, therefore, are more lightweight compared to VMs. Each container includes only the application and its dependencies, reducing resource overhead.
- Virtual Machines: VMs require a full operating system (OS) for each instance, leading to higher resource consumption. Running multiple VMs on a host can result in significant overhead.
### Faster Startup Times:

- Docker: Containers can start almost instantly because they leverage the host OS kernel. This makes them well-suited for applications with dynamic scaling requirements.
- Virtual Machines: VMs typically take longer to start as they involve booting a full OS. This can impact the scalability and responsiveness of applications.
### Isolation and Portability:

- Docker: Containers encapsulate the application and its dependencies, providing process-level isolation. This isolation allows for consistent behavior across different environments, making Docker containers highly portable.
- Virtual Machines: VMs provide stronger isolation by running a separate OS instance for each machine. While this isolation is beneficial for security, it can result in larger and less portable deployments.
### Resource Utilization:

- Docker: Containers can efficiently use resources since they share the host OS's kernel. This means that more containers can run on the same hardware without the overhead associated with running multiple operating systems.
- Virtual Machines: VMs require a hypervisor to manage each instance, leading to increased resource utilization and potential performance overhead.
### Easier Scalability:

- Docker: Docker and container orchestration tools like Kubernetes make it easy to scale applications horizontally by quickly deploying additional containers.
- Virtual Machines: Scaling VMs usually involves cloning or deploying additional VM instances, which is a comparatively slower process.
### Consistent Development and Production Environments:

- Docker: Docker ensures that the development environment is consistent with the production environment, reducing the likelihood of "it works on my machine" issues.
- Virtual Machines: Developers working on VMs might face challenges related to environment inconsistencies between development and production.
### Easier Maintenance and Updates:

- Docker: Containers can be versioned, making it easy to roll back to previous versions or update applications without affecting the entire system.
- Virtual Machines: VMs require more effort to manage updates and maintain consistency across multiple instances.

In summary, Docker provides advantages such as resource efficiency, faster startup times, and better scalability compared to traditional virtual machines. It is particularly well-suited for microservices architectures, continuous integration/continuous deployment (CI/CD) pipelines, and environments where fast and efficient scaling is essential. However, the choice between Docker and VMs depends on specific use cases, security requirements, and existing infrastructure considerations.
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
Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to describe the services, networks, and volumes that make up your application in a single YAML file. With Docker Compose, you can define the entire application stack, including the different services, their configurations, and how they interact with each other. Here's a brief explanation of how Docker Compose works:

- Compose File: You start by creating a docker-compose.yml file, which is a YAML configuration file that defines your application's services, networks, and volumes. In this file, you specify details such as the Docker images to use, container configurations, environment variables, ports to expose, and dependencies between services.

- Service Definitions: Each service in your application is defined as a separate block in the docker-compose.yml file. A service represents a containerized application or component, such as a web server, database, or any other service your application requires.

- Networking: Docker Compose automatically creates a default network that connects all the services defined in the docker-compose.yml file. This allows services to communicate with each other using the service names as hostnames.

- Volumes: Docker Compose can also define volumes to persist data between container restarts. This is useful for databases or any service that needs to store data beyond the container's lifecycle.

- Configuration Overrides: Docker Compose allows you to override default configurations for different environments, making it easy to switch between development, testing, and production settings by using different docker-compose.yml files or environment variables.

- Commands: Using the Docker Compose command-line interface (CLI), you can perform various actions, such as starting and stopping containers, building images, scaling services, and viewing logs. The most common command is docker-compose up, which starts the services defined in the docker-compose.yml file.

- Scaling: Docker Compose makes it easy to scale services by specifying the desired number of replicas for a particular service. This is useful for applications that require multiple instances of a service to handle increased load or provide high availability.

- Interoperability: Docker Compose is designed to work seamlessly with other Docker tools, such as Docker Swarm for orchestration and Docker Hub for image sharing. It also integrates well with Docker's ecosystem, making it a versatile tool for managing multi-container applications.

In summary, Docker Compose simplifies the process of defining, managing, and running multi-container Docker applications by using a declarative YAML file. It's a valuable tool for both development and production environments, providing consistency and reproducibility across different stages of the application lifecycle.

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

## Images with and without docker compose
The primary difference between using Docker images with Docker Compose and using them without it lies in how containerized applications are orchestrated, configured, and managed.

### Docker Image Without Docker Compose:
- Manual Configuration: When using Docker images without Docker Compose, you typically need to manually run the docker run command to start individual containers. This involves specifying various parameters such as image name, ports, volumes, and environment variables on the command line.

- Isolation: Containers started without Docker Compose may not be as well-connected or isolated from each other. You would need to manage networking and dependencies between containers explicitly.

- Limited Automation: The process of starting and managing containers is more manual, and there is limited automation for defining and linking multiple services.

### Docker Image With Docker Compose:
- Declarative Configuration: Docker Compose allows you to define the entire application stack in a declarative manner using a docker-compose.yml file. This file contains service definitions, network configurations, and volume mappings, making it easier to understand and manage the entire application.

- Orchestration: Docker Compose provides orchestration capabilities, allowing you to define the relationships and dependencies between different services. It automatically creates a network that links the containers, making it simpler for them to communicate.

- Environment Variables and Configuration Overrides: Docker Compose enables you to specify environment variables in the docker-compose.yml file, simplifying the configuration of containers. Additionally, you can use different configuration files or environment-specific variables for development, testing, and production settings.

- Single-Command Operations: With Docker Compose, you can perform common operations like starting, stopping, and scaling the entire application stack with a single command (docker-compose up, docker-compose down, etc.).

- Service Scaling: Docker Compose makes it easy to scale services by defining the desired number of replicas in the docker-compose.yml file. This is useful for applications that require multiple instances of a service to handle increased load or improve availability.

- Improved Collaboration: Docker Compose facilitates collaboration by providing a standardized way to share and reproduce the entire application stack. This is particularly beneficial in team environments and during the development lifecycle.

In summary, while Docker images can be used both with and without Docker Compose, the latter provides a higher level of abstraction and automation for managing multi-container applications. Docker Compose simplifies the process of defining, deploying, and scaling containerized applications, making it a valuable tool for development, testing, and production environments.
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

### Why TLS/SSL certification?
TLS (Transport Layer Security) and its predecessor SSL (Secure Sockets Layer) are cryptographic protocols that provide secure communication over a computer network, commonly the internet. The primary reason for using a TLS or SSL certificate is to ensure the confidentiality, integrity, and authenticity of data exchanged between a user's web browser and a web server. Here are the key reasons for using TLS/SSL certificates:

- Encryption of Data:

TLS/SSL protocols encrypt the data transmitted between a user's browser and the web server. This encryption prevents unauthorized parties from intercepting and reading sensitive information, such as login credentials, personal details, and financial transactions.
- Confidentiality:

TLS/SSL ensures the confidentiality of data by encrypting it during transmission. Even if intercepted, encrypted data is meaningless without the corresponding decryption key.
- Integrity of Data:

TLS/SSL provides data integrity, meaning that the data transmitted between the client and the server cannot be tampered with during transit. Any alteration to the data would be detected, ensuring that the received information is the same as what was sent.
- Authentication:

SSL/TLS certificates are used to authenticate the identity of the server to the client and, in some cases, vice versa. This helps users ensure that they are connecting to the legitimate and intended website, reducing the risk of man-in-the-middle attacks.
- Trust and Credibility:

Websites with valid SSL/TLS certificates show a padlock icon in the browser's address bar and use the "https://" protocol. This visual indication informs users that the connection is secure and establishes trust. Sites with valid certificates are also less likely to be flagged as potentially harmful by browsers.
- Compliance with Data Protection Regulations:

Many data protection regulations and standards, such as the General Data Protection Regulation (GDPR), require the protection of sensitive data during transmission. Using TLS/SSL helps websites comply with these regulations and avoid legal consequences.
- Secure Transactions:

For e-commerce websites and other platforms handling financial transactions, SSL/TLS certificates are essential. They ensure that sensitive financial information, such as credit card details, is transmitted securely, protecting users from potential fraud.
- SEO Benefits:

Search engines, such as Google, take into account the use of SSL/TLS as a ranking factor. Websites with SSL/TLS certificates may receive a slight boost in search engine rankings, contributing to better visibility in search results.
- Protection Against Session Hijacking:

TLS/SSL protects against session hijacking attacks by encrypting session data. This helps prevent attackers from intercepting and using session information to impersonate users.
- Encrypted Authentication:

When mutual TLS (mTLS) is employed, both the server and the client authenticate each other using certificates. This adds an extra layer of security, ensuring that both parties are who they claim to be.

In summary, TLS/SSL certificates are crucial for securing the communication between clients and servers, protecting sensitive data, establishing trust, and complying with legal and regulatory requirements. They play a vital role in ensuring a secure and trustworthy online experience for users.

If you're encountering a warning message while trying to access a website, there could be various reasons for it. Common warning messages related to security often indicate issues with the SSL/TLS certificate or the overall security of the connection. Here are some reasons why a warning message might appear:

- Expired SSL/TLS Certificate:

SSL/TLS certificates have a validity period, typically ranging from a few months to a few years. If the certificate has expired, browsers will display a warning message to inform users that the connection is not secure.
- Mismatched Domain or Common Name:

SSL/TLS certificates are issued for specific domain names (or subdomains). If the certificate's Common Name (CN) or Subject Alternative Name (SAN) does not match the domain of the website being accessed, a warning is displayed. This often happens in situations like accessing a site by its IP address instead of its domain name.
- Self-Signed Certificate:

If a website is using a self-signed certificate instead of one issued by a trusted Certificate Authority (CA), browsers will display a warning. Self-signed certificates are not automatically trusted, and users need to explicitly accept the risk when accessing such sites.
- Insecure Cipher Suites:

Browsers may display warnings if the server uses outdated or insecure cipher suites during the SSL/TLS handshake. This is a security measure to protect against vulnerabilities in cryptographic protocols.
- Mixed Content:

If a webpage is served over HTTPS but includes resources (like images, scripts, or stylesheets) loaded over HTTP, browsers may display warnings about mixed content. Modern browsers prefer to load all resources securely to prevent potential security risks.
- Man-in-the-Middle (MitM) Attacks:

If there is suspicion of a man-in-the-middle attack, where an unauthorized entity intercepts the communication between the user and the server, browsers may display a warning. This can happen if the SSL/TLS connection is tampered with.
- Revoked Certificate:

If the SSL/TLS certificate has been revoked by the Certificate Authority before its expiration date, browsers may display a warning. Revocation can occur due to compromised private keys or other security incidents.
- Untrusted Certificate Authority:

If the SSL/TLS certificate is issued by a Certificate Authority that is not recognized or trusted by the user's browser, a warning may appear. Users are advised to be cautious when encountering such situations.
- HSTS (HTTP Strict Transport Security) Issues: 

If a website has HSTS enabled but encounters issues with its SSL/TLS configuration, browsers may display warnings. HSTS enforces the use of HTTPS and may cause access issues if there are problems with the secure connection.

If you encounter a warning message, carefully consider the nature of the warning and the context of the website you are visiting. In many cases, warnings are legitimate security measures to protect users from potential threats. If you are a website owner or administrator, addressing SSL/TLS certificate issues promptly is crucial for maintaining a secure and trustworthy online presence.
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
mysql -p // To connect on mysql CLI as root
mysql -u $USER -p // To connect on mysql CLI as $USER
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
mysql -u (user) -p
```c
	SHOW DATABASES; // show the databes
	use 'wordpress'; // go in the wordpress databse
	SHOW TABLES; // show all the tables from the database you selected
	SELECT user, host FROM mysql.user; // display users from mysql database
```

# VIRTUAL-MACHINE

Install a virtual machine (using VirtualBox) with the Debian 12 ISO image. We will install the operating system in graphical mode, with the domain [login].42.fr and SSH service.

## SSH service

To connect via SSH from the host, configure port 4242 on the virtual machine:
1. Settings -> Network -> Adapter1 -> Advanced -> Port Forwarding (4242 for Host and Guest Port)
2. In the VM terminal:
```c
	su -
	apt-get install sudo
	sudo nano /etc/ssh/sshd_config:
		- #Port 22 -> Port 4242
		- #PermitRootLogin prohibit-password -> PermitRootLogin no
	sudo nano /etc/ssh/ssh_config:
		- #Port 22 -> Port 4242
	sudo service ssh restart
	sudo service ssh status
```
3. To test the connection from the host:
```c
	ssh jutrera@localhost -p 4242
```

## Install necessary programs
1. Vim. Because I prefer it to "nano."
2. Make. To execute Makefiles
3. Git
4. Docker
5. Docker-Compose

## Change domain name
1. sudo nano /etc/hosts:
```c
	127.0.0.1 jutrera.42.fr
```

## Change machine's public and private keys
To clone the 42 repository, we need to configure the public key for our profile.
1. To generate the public and private keys:
```c
	sudo ssh-keygen
```
2. Copy the private key (id_rsa) to /.ssh/
3. Copy the public key (id_rsa.pub) to the 42 profile
