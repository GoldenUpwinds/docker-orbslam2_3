#!/bin/bash

FOLDER=/media/yicheng/Data/Dataset/Scube/230608
xhost +local:root
#使用核显输出 启动更快
# sudo docker run -it --runtime=nvidia -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    # -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    # -v "$FOLDER:/data" kalibr
#容器带有宿主机nvidia驱动 避免无法连接diaplay"0"
sudo docker run -it  --name orb_test --runtime=nvidia --gpus all -e "DISPLAY" -e "QT_X11_NO_MITSHM=1" \
    -v "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    -v "$FOLDER:/data" test_orb_slam    \