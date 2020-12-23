# Steps to set up nginx

## Set up

Copy the following dirs from a running nginx container to et default values
docker cp <container>:/etc/nginx ./conf
docker cp <container>:/etc/ssl/private ./certs

These should then be mounted when running the container along with opening up ports 433 and 80

## Changes to conf dir
- Remove default conf from
```etc/nginx/conf.d/```
- Add dirs sites-enabled && sites-available
- Create per service conf files
- symlink the available file to the enabled sites dir
```ln -s ../sites-available/plex.conf .```
- Modify the 'include' statement in the nginx.conf to include the sites-enabled dir
```etc/nginx/
include /etc/nginx/conf.d/sites-enabled/*.conf;```

## Reload the daemon after making changes
- Check config files for syntax errors
```docker exec <container-name> nginx -t```
- The daemon inside the container needs to be restarted
```docker exec <container-name> nginx -s reload```

More details on steps:
https://www.freecodecamp.org/news/docker-nginx-letsencrypt-easy-secure-reverse-proxy-40165ba3aee2/
