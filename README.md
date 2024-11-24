# Starting DOMjudge
A simple guide for starting [DOMjudge](http://domjudge.org) using some helper Bash scripts

## Prerequisites
You need to have docker and docker-compose set up on the machine.


## Starting the domserver
Set the appropriate passwords and envs inside ```.env``` file.
run the command:

``` sh
docker-compose up -f docker-compose-domserver.yaml up
```
Unfortunately I couldn't find a way to be able to set the admin and judgehost passwords using environment variables.
you can access them through these commands.

``` sh
# for admin user password
docker exec -it domserver cat /opt/domjudge/domserver/etc/initial_admin_password.secret
# for judgehost
docker exec -it domserver cat /opt/domjudge/domserver/etc/restapi.secret
```

## Setting up a new worker
First fill in the appropriate parameters inside the ```.env``` file.
You need to enable memory management in cgroups and revert to cgroup v1 to be compatible with the docker image.
The script to do so is provided for debian based distros. You can run:

``` sh
chmod +x config_user_and_grub.sh
./config_user_and_grub.sh #it restarts the computer for changes in boot loader to take effect.
```

You can then run workers on this machine by doing:

``` sh
WORKER_DAEMON_ID=<id-for-your-worker> docker-compose -f docker-compose-judgehost.yaml up
```


## Notes

If you get an error like "You have to remove (or rename) that container to be able to reuse that name.", remove those conflicting containers using ```docker stop``` and ```docker rm``` or ```docker-compose -f <file> down``` commands with the given IDs. ```sudo``` may be needed as well.

## See also

- [domjudge/domserver - Docker Hub](https://hub.docker.com/r/domjudge/domserver)
- [domjudge/judgehost - Docker Hub](https://hub.docker.com/r/domjudge/judgehost)

