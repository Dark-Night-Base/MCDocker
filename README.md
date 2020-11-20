# MCDocker

a docker image based on [MCDReforged](https://github.com/Fallen-Breath/MCDReforged)
 and [docker-minecraft-server](https://github.com/itzg/docker-minecraft-server)

## Features

- [Full MCDReforged functions](https://github.com/Fallen-Breath/MCDReforged)
- [Healthcheck](https://github.com/itzg/docker-minecraft-server#healthcheck)
- [Autopause](https://github.com/itzg/docker-minecraft-server#autopause-experimental)
- [Resource control via docker](https://docs.docker.com/config/containers/resource_constraints/#:~:text=Docker%20provides%20ways%20to%20control%20how%20much%20memory%2C,features%20require%20your%20kernel%20to%20support%20Linux%20capabilities.)

## Requirements

### Install Docker

- Ubuntu: `sudo apt install docker.io`

## How to use

### Build from source

First run:
```Bash
# This will take a while (~5 min), fetch a cup of coffee for yourself.
sudo docker build -t mcdocker:v0 .

# Replace the path to MCDReforged and the TimeZone
sudo docker run -itd -p 25565:25565 -v /path/to/MCDReforged:/data -e ENABLE_AUTOPAUSE=TRUE -e TZ=Asia/Shanghai mcdocker:v0
# Docker should return the id of the container
```

Then the MCDocker should be running in the background. To go back to the container, run:
```Bash
# You can just type the prefix of the id, for example:
#   use 637 instead of 637d85d56033d3caa...
sudo docker attach <container-id>
# Use Ctrl-p + Ctrl-q to exit! Don't use Ctrl-c!
```
Use `Ctrl-p + Ctrl-q` to exit! Don't use ~~`Ctrl-c`~~!

## Notes

### Useful Docker commands

|command|function|
|---|---|
|`docker images`|list images|
|`docker rmi <image id>`|remove image|
|`docker ps -a`|list containers|
|`docker rm <container id>`|remove container|
