FROM osrf/ros:noetic-desktop-full

RUN apt-get update && DEBIAN_FRONTEND=noninteractive\
    apt-get install -y \
        cmake gcc g++ git wayland-protocols \
        libglew-dev libeigen3-dev

RUN git config --global http.sslVerify false

# Install Pangolin v0.6
RUN cd ~ &&\
    git clone -b v0.6 https://github.com/stevenlovegrove/Pangolin.git &&\
    cd Pangolin &&\
    mkdir build && cd build &&\
    cmake .. &&\
    make -j &&\
    make install &&\
    cd ~ && rm -rf Pangolin

# ORB-SLAM2 针对opencv4版本修改后orbslam2
RUN cd ~ &&\
    mkdir catkin_ws && cd catkin_ws &&\
    git clone https://github.com/GoldenUpwinds/ORB-SLAM2-noetic.git &&\
    cd ORB-SLAM2-noetic &&\
    ./build.sh &&\
    echo 'export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/root/catkin_ws/ORB-SLAM2-noetic/Examples/ROS' >> ~/.bashrc &&\
    source ~/.bashrc &&\
    ./build_ros.sh