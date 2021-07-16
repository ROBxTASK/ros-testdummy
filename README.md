# ros-testdummy

Container for testing distributed ROS Actions, Services and Messaging


## Steps to start this demonstrator from root directory:

Step 1) Build Docker:
"./build-docker.sh"

Step 2) Create Network:
"docker network create staging_rosnet_default"

Step 3) Run Server:
"./run.sh"

Step 4) Check for running docker image:
"docker ps"


## Instead of run.sh you can start client and server independantly in separate shells to see all output:

Server) "docker-compose up -d ros-testdummy-action-server #xterm rqt" (use "#xterm rqt" if you have local server)

Client) "docker-compose up ros-testdummy-action-client"
