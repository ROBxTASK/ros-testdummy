FROM ros:noetic

# install additional packages
RUN apt-get update 

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y \
      iputils-ping xterm vim \
      python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential \
      ros-${ROS_DISTRO}-rosidl-generator-py \
      ros-${ROS_DISTRO}-rqt* \
      ros-${ROS_DISTRO}-common-tutorials \
      ros-${ROS_DISTRO}-turtlesim

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/ros_entrypoint.sh" ]
