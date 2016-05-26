# Docker Setup for SIME BEF Demoserver

Ce dépôr Docker est un moyen rapide et efficace d'installer
un serveur de démonstration de [SIME BEF] (http://www.bioecoforests.com/index.html)
(Système Intégré de Management Environnemental Bio Eco Forests).

Ce build est basé sur les images officielles :

* [Docker base image](https://hub.docker.com/r/pobsteta/docker-base/)
* [Docker bef-db](https://hub.docker.com/r/pobsteta/bef-db/)
* [Docker bef-sime](https://hub.docker.com/r/pobsteta/bef-sime/)

et utilise

* [docker-compose](https://docs.docker.com/compose/)

pour la définition du lancement des application et mise en place de
l'environnement de production.

L'image est automatiquement construite depuis [GitHub](https://github.com/mbehrle/docker-gnuhealth-demo).

## Installation

### Prerequisites

You need a running docker server and curl for downloading some files.
On a Debian based system this means running

    sudo apt-get install docker.io curl

Add the user that will use docker (i.e. yourself) to the docker group

    sudo useradd myuser docker

Note: You may have to relogin before the group settings will take effect.

Get docker-compose on a recent Debian system with

    sudo apt-get install docker-compose

or install docker-compose refering to the [installation page](http://docs.docker.com/compose/install/) e.g.

    curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose

## Usage

Create a working directory

    mkdir ~/gnuhealth
    cd gnuhealth

Fetch the definition file

    curl -o ./docker-compose.yml https://raw.githubusercontent.com/mbehrle/docker-gnuhealth-demo/master/docker-compose.yml

Run

    docker-compose up

and get yourself a cup of coffee...

The first setup will take some time for

* downloading the images
* importing the GNU Health Demo database

Subsequent calls to `docker-compose up` will run much faster.
Stop the servers with Ctrl+C.

As soon as the servers have started up you can connect with the Tryton client using the credentials
as described in the [GNU Health documentation](http://en.wikibooks.org/wiki/GNU_Health/The_Demo_database#Online_Demo_Database)
with the only difference that you put in your own machine as the server (localhost, if you are
running the client on the same machine)

    Server: <your_machine>:8000
    Database: health30
    User name: admin
    Password: gnusolidario

Note: The version of the Tryton client must match the version of the server (3.8.x).
A suitable client can be installed from distribution packages of your distribution or from the
[Tryton download site](http://www.tryton.org/download.html) for OS X or Windows binaries.

For Debian systems please refer to [packages from debian.tryton.org](http://tryton.alioth.debian.org/mirror.html#distributions)
for the procedures to install the correct version.

### Building and running from source

Todo

## Authors and Credits

This setup was made by [MBSolutions](http://www.m9s.biz) in the hope, that it may be useful
for the GNU Health users. Thanks to the [GNU Health project](http://health.gnu.org/)
for providing this free Health and Hospital Information System.

Parts of this setup were adopted from

* [postgres](https://github.com/docker-library/postgres/) by [Docker Official Image Packaging for Postgres](https://github.com/docker-library/postgres/).


## Support

For any questions about this image and docker setup you may contact us at [support](mailto:info@m9s.biz).
