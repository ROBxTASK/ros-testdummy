#!/bin/bash

set -e

export EXTERNAL_IP=192.168.1.204
export EXTERNAL_IP=172.16.98.111


docker-compose up -d ros-testdummy-action-server xterm rqt

sleep 30 # wait until the server is starting and creating the common workspace

docker-compose up ros-testdummy-action-client

# client run example call (same net, same workspace as in docker-compose.yml required!)
#docker run -ti --network staging_rosnet_default -v "<LOCAL_PATH_TO_REPO>/ros_home:/ros" -e ROS_HOME=/ros --rm robxtask/ros-testdummy:staging /ros/run_client.sh action_ws
