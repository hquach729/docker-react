# Creating Two Docker file one for Development and one for Production

# Development Docker file

1. Dockerfile.dev -> Development
2. Dockerfile -> Production

### the -f allow us to specify our custom file Dockerfile.dev

3. docker build -f Dockerfile.dev .
4. docker run -it -p 3000:3000 IMAGE_ID
5. docker run -d -it -p 3000:3000 IMAGE_ID

### Setup Docker Volume which point back to our src and public directory

1. If we edit the file it will reflect on the update of our development container

### This is how we map our directory . to the /app directory in our container

### -v /app/node_modules tell container not to reference back to our local files

### without the colon : don't try to map to it

2. docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app hquach729/frontend
