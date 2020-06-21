# IM Demo

## Project Architecture

```
.
├── .dockerignore        # files and folder to be ignored by COPY command
├── Dockerfile           # Dockerfile for building image
├── README.md            # README.md
├── app.py               # Application Code for Flask
└── requirements.txt     # Application Dependency
```


## Docker Commands Explained

#### How to login to Docker Hub
`docker login docker.io`

#### How to pull a image from Docker Hub
`docker pull image_name`
`image_name` is the name of image you want to pull


#### How to build docker image

##### Building with default Dockerfile
`docker build . -t image_name`

`.` is the context folder in our case current folder which contains the `Dockerfile`

##### Building with custom Dockerfile

`docker build . -f Dockerfile.dev image_name`

We assume we have a `Dockerfile.dev` in our context folder



#### How to run a image

##### Running without any run time config 
`docker run image_name`
if `image_name` is not present locally it will be pulled from container registry first, then will be run after downloading

##### How to map host port with container port in runtime
`docker run -p 9000:8000 image_name`

here the format `-p host_port:container_port` so any request to `http://localhost:host_port` will be redirected to `container_port` of the container. In our case `http://localhost:9000` will be served by `5000` port of the container


##### How to pass environment variables in runtime
`docker run -p 9000:8000 -e APP_NAME="Value" image_name`

here we passed an environment variable `APP_NAME` with value `Value`. The format is `-e name_of_env_variable=value_of_variable` if the `value_of_variable` contains a space the encapsulate it in `""`


#### How to push image
`docker push image_name`


#### How to see current containers
`docker ps`
you will see  a container list with container id

**all the closed container or stopped container with be seen just appending `-a` flag** 

`docker ps -a` to see all the containers


#### How to see the images
`docker images` 


#### How to see the files in a containers.

We can't see any file in any images. We have to run a container first  with the image then go into the container console.

`docker exec -it container_id /bin/bash`


`conatainer_id` - conatiner id from `docker ps`
`/bin/bash` - i want to start a bash session

by default the bash will be run in the `WORKDIR` of the container. in our case it's the `/code` folder.


#### How to optimize docker.
After using docker for sometimes, we will be having docker containers and images that we don't use. for that you can use
`docker system prune` this will delete all the dangling images, containers, volumes and stuff.
