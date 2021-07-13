# Docker file for Production, A Bunch of Instruction that tell Docker how to build and run in image in a Container
# Build Phase of OS image
# These are the instruction given to the docker to build an image and have it run in a docker container.
# Think of a container as an individual computer running a particual os and program

# Create a simple os called apline with node built in
# we need node to be able to use npm to install package and dependecies
FROM node:alpine

# This is the director where we will put our local files into a docker image file system
WORKDIR '/app' 

# Copy the package.json file locally which contain dependency and package to be install on the docker container
COPY package.json . 

# Once our image container is launch and running, we can run npm install inside that container to install the package
# and dependencies
RUN npm install

# We then copy everything from our source local folder to our container, we can ignore file and directory using a .dockerignore file
COPY . .

# create a build folder for our react app to be use in production
# Note this container wont be run, instead we just copy over the build folde
RUN npm run build 

# Takes the build folder in our WORKDIR '/app' and copy it to another container call nginx 
FROM nginx

COPY --from=0 /app/build /usr/share/nginx/html


