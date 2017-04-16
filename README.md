#Symfony docker container for development and fun
##1. Preparing
Install docker, docker-compose, docker-machine
```bash
$ sudo apt-get install docker docker-compose docker-machine
```
Before building images copy `.env.dist` to `.env` and configure database and other variables.

Build images
```bash
$ docker-compose build
```
Run containers
```bash
$ docker-compose up
```
If you want run containers and de attach terminal use `-d` option.


Add to host file `127.0.0.1 symfony.dev`.
##Symfony
For using app_dev.php remove or change `app_dev.php` file if needed.


For clear dev cache use aliases:
```bash
$ docker-compose run php-fpm sfcc
```
Also use `sfccp` for prod. For composer install use `ci`.
##Phpstorm remote xdebug
Change xdebug port to 9001 in `Settings | Languages & Frameworks | PHP | Debug`

If you want you can add docker to PhpStorm in `Settings | Build, execution, deployment | Docker`
##Usage
To remove unnecessary docker images use
```bash
$ ./.remove_all.bash
```
Don`t forget to make it executable
```bash
chmod +x .remove_all.bash
```