## Apache Django Docker Image
A docker image to help deploy python django applications into an Apache server environment.

### Purpose
There are a lot of docker images out there that make it really easy to deploy projects on the Internet. However,
most of these images are not production ready. They rely on development servers to get things done.
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

### Docker Image Details
1. Built using ubuntu:18.04, bionic
2. Pulls in some standard libraries. Bionic already comes with python3.6 native, but I include the headers
and some additional libraries to be sure
3. Installs apache and libapache2-mod-wsgi-py3 to install mod_wsgi
 
