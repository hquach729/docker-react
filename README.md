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
3. docker build -f Dockerfile.dev .

### We need to run -it to have standard input int

### This is how we can run command after a second container is startedff

4. docker run -it hquach729/frontend npm run test,

# Attached to command to already running container

# Allow us to send input in

# Running two instance of the frontend container

CONTAINER ID NAME CPU % MEM USAGE / LIMIT MEM % NET I/O BLOCK I/O PIDS
-3d110c69d708 frontend_web_1 0.00% 210.5MiB / 1.942GiB 10.58% 1.53kB / 0B 77.5MB / 0B 29
9d4146aeb4ab frontend_tests_1 0.40% 107.8MiB / 1.942GiB 5.42% 1.42kB / 0B 60.4MB / 4.1kB 29

# note this is the id of our running container

# which is different from the image id aka hquach729/frontend

1. docker attach 9d4146aeb4ab

# When we have a container running, we use exec, we only connect to the npm that is not running to the test npm

# docker attach only works on the primary process of npm

# docker run will start a container

# it allow us to send input to our shell

1. docker exec -it 9d4146aeb4ab sh

# Docker file with two phase: Build Phase and Run Phase

# Nginx is use for our production build

# git remote show origin

# TRAVIS CLI SETUP

1. Tell travis cli the github repo that we just put together

   1. Tell Travis we need a copy of docker running
   1. Build our image using Dockerfile.dev Note: on why we use dev and production, the production docker file doesn't have test dependency to run our test suite
      a. by that what we mean is that the production Dockerfile and launch nginx and has file in our build folder to copy to it
   1. Tell Travis how to run our test suite
   1. Tell travis how to deploy our code to AWS

### we need to run this to get it exit out of test

1. docker run -e CI=true hquach729/frontend npm run test -- --coverage
1. docker run -e CI=true hquach729/frontend npm run test

access_key_id: $AWS_ACCESS_KEY
secret_access_key: $AWS_SECRET_KEY

# Typical workflow

1. git checkout -b feature
2. Change file
3. git add .
4. git commit -m 'add new text'

# we push the feature branch to github

4. push push origin feature
