# dockerfile-optimize

A simple script that automatically optimizes a Dockerfile into a Dockerfile that has a better layer strategy. 

## Warning

This is not rocket science.

## Purpose

This script optimizes the build of Docker images by automatically creating one big RUN command.  Basically, Docker creates one layer for each RUN command.  If for example you do a "dnf autoremove" at the end of your script, it will not shrink the size of the image as there's a layer with all the files you remove in the end.  It only shrinks the size if they are in one RUN, in one layer.

However, when Docker is building your image during development, it's easier to work with separate RUN commands, as Docker will use caching of each layer, each RUN command.  If something bugs out, Docker will execute the buggy RUN command again and re-use the cached layers of the RUN commands that did pass.  In the optimized version, with only one RUN command, it hence needs to re-do everything.  If you develop with multiple runs, you don't have that problem, but your image size is too big.

This script solves this.  Just run it on your Dockerfile with multiple RUN command and you get back the version with one RUN command.

_Note: the script does not re-arrange your code.  So if there is another copy between two run commands, it will create two layers, separated by the other command._

## Example

See the Dockerfile with comments and multiple RUN commands.  Execute:

````
python ./optimize.py
````

The output will be a Dockerfile.build, optimized as one RUN command.

This is an example of an image that is online on Dockerhub.  https://hub.docker.com/repository/docker/vindevoy/centos8-base

The result:

- Dockerfile image: 100.31 MB
- Dockerfile.build image: 77.36 MB