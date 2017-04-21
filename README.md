# Symfony docker container for development and fun
## General explanation
This little helper will manage creation of local development env with docker. It includes
php-fpm, nginx and mysql containers. Feel free to add or remove any containers you want.

I use this as a gitmodule to my main project, but you can just download this as zip file 
and extract in your existing symfony project, or empty directory and create fresh project
as explained below.
## Getting started
Before getting up ensure that you have `docker` and `docker-compose` installed in your
system.

If this is existing project just run `./config.sh`, it will create `.env`
file for you with you user, so no issues with rights for files created inside container.

If this is new project then run `./crete_symfony.sh`, this will create `.env` file and install symfony project inside container.
And this is you new fresh installed symfony application.
 
To get you project up just run `docker-compose up -d` (`-d` means deattach from terminal). 
Don\`t forget to add your domain name in hosts file like this `127.0.0.1    symfony.dev`.
  
To stop all containers run `docker-compose down`, this will properly shut down all containers
and remove all not-needed files.
 
To rebuild containers after some changes in `Dockerfile` files run `docker-compose build`

For using your app_dev.php you may need make some changes to `app_dev.php` file to use it with
remote address.

If you want completly remove all containers and images execute `./remove_all.sh`

## Execute commands inside container
Any bash command you need you can execute directly in container, for example to clear
symfony cache use: 
```bash
$ docker-compose run php-fpm php bin/console cache:clear
```
This is realy long command, so in container there some shortcuts for frequently used commands
`sfcc` shortcut for `php bin/console cache:clear`

`sfccp` shortcut for `php bin/console cache:clear -env=prod`

`ci` shortcut for `composer install`

So, for example, to install composer dependencies you can type `docker-compose run php-fpm ci`.
But for really lazy people like me this is still to long. You can add this code to your 
`.bashrc` file to type even less:
```bash
# Runs symfony console command with arguments at php-fpm container
function ds() {
	docker-compose run php-fpm php bin/console $@
	return
}
export -f ds

# Runs custom command at php-fpm container
function d() {
	docker-compose run php-fpm $@
	return
}
export -f d
```
After this upgrade install composer dependencies in container is just type `d ci`. As 
example of using symfony console command lets create some new doctrine entity
`ds doctrine:generate:entity`, yep its this simple.

## Integration with PhpStorm
### Xdebug
Inside container there is installed and configured xdebug php extension. All you need to do
just configure incoming port for xdebug, in PhpStorm this is in section
`Settings | Languages & Frameworks | PHP | Debug`. Don\`t forget to fix path mapping. 

### Docker integration
You can add docker to phpstorm, to see logs etc. Located under
`Settings | Build, execution, deployment | Docker`

##Docker machine
If you prefer use docker-machine or in you os you could not use without docker-machine.
First start new Virtualbox machine `docker-machine create test`. Now you need to know 
ip address. Type `docker-machine ip symfony-docker-machine`. Then ensure that terminals
from what you use `docker-compose` commands have right env variables: 
`eval $(docker-machine env symfony-docker-machine)`. Don\`t forget to edit your host file.
For some strange reason in linux mount of shared folders are screwed, so you have
manually set up shared folders in virtual box, fyl then change `WORKING_DIR` relative to
virtual box guest. As example for project in `/home/user/project` we will create shared
folder in virtual box wit mounting path `/home/app`, and then change `WORKING_DIR` in .env
file to `/home/app`.