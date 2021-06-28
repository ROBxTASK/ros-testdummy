FROM ros:kinetic

# install additional packages
RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
      iputils-ping xterm vim \
      ros-${ROS_DISTRO}-rqt* \
      ros-${ROS_DISTRO}-common-tutorials \
      ros-${ROS_DISTRO}-turtlesim

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/ros_entrypoint.sh" ]
