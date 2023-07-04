#!/bin/bash

xhost +local:root
NAME=orb_test #容器的名词
sudo docker start $NAME
sudo docker attach $NAME