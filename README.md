## Apache Django Docker Image
A docker image to help deploy python django applications into an Apache server environment.

### Purpose
There are a lot of docker images out there that make it really easy to deploy projects on the Internet.
The purpose of this docker image is to create an environment to make it easy to test a django 
application in a pseudo-production environment, using an Apache server in the Docker image, setting up
mod_wsgi, and setting up static files on the server.

### Setup
1. A default django app is included, named base_site. It has a module named startup as an example.
2. There's a startup.sh script included that helps get things setup, creating a virtualenv for the website
based on python3.6, and also running some django related migrations and commands. 
    1. If you wish to run /admin related commands, you can add the command to create a superuser in the startup script, and allow
    docker-compose to host your db.sqlite file in, or, more likely, you'll have a production db that you can add credentials
    to separately.
3. Run **docker-compose up -d** to build the default image and deploy the application in Apache
4. Additionally, you can use the Dockerfile_no_compose to deploy the application without docker-compose
5. If you decide to replace base_site with your own django application, just change the **ARG WEBSITE_NAME** in the Dockerfile
 to reflect the name of the django application and modify the volume mounts in docker-compose.yml. If you use the Dockerfile_no_compose, you'll have to change some of the copy commands in the Dockerfile.
6. When adding in a new django site, you'll also have to change the apache_django.conf file that is mounted
into apache2. Specifically, entries for WSGIDaemonProcess, WSGIProcessGroup, WSGIScriptAlias, WSGIPythonPath,
and settings in the VirtualHost setup.
7. Currently docker maps from port 80 on the container to port 8000 on the host. You can modify those settings in 
the docker-compose.yml file

### Docker Image Details
1. Built using ubuntu:18.04, bionic
2. Pulls in some standard libraries. ubuntu is a minimal dockerfile, so I ensure that python3.6 is installed,
along with some helpful ones (vim, build_essential) 
3. Installs apache2 and libapache2-mod-wsgi-py3 to install mod_wsgi
 
