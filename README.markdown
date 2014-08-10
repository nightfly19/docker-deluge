# Docker Deluge

Docker container for runing a [Deluge](http://deluge-torrent.org/) daemon and web GUI.

## Building 

Create the image `nightfly/deluge` by running this is the docker-deluge directory:

```sh
docker build --tag=nightfly/deluge
```

## Volumes

### Torrents
By default all torrent related data is stored in `/torrents`.
In progress torrents live in `/torrents/.in_progress`, completed torrents live directly in `/torrents/`.

## Configuration and State

Most configuration data lives in `/config`. 
The default web GUI password of `deluge` is retained.
Setting changes won't persist across instances. 

Deluge state information is redirected to live in `/torrents/.state`,
so information about current running torrents should persist across instances. 
This might not be desirable for every use case.

## Example Usage

The default password of deluge is not really secure. 
The intended usage is to only expose the web port to localhost, 
so that only people who have shell access to the host machine can SSH forward the relevent port to their local machine

```sh
$ docker run -d --name deluge -v /torrents:/torrents -u 1000 -p 127.0.0.1:8112:8112 nightfly/deluge
```
