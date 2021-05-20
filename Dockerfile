# Stage 1: build
FROM ros:noetic AS base
SHELL ["/bin/bash", "-c"]

COPY ./backup /
RUN source /opt/ros/noetic/setup.bash && cd ~/catkin_ws && catkin_make install

# # Stage 2: run
FROM base
SHELL ["/bin/bash", "-c"]
RUN source /opt/ros/noetic/setup.bash && cd ~/catkin_ws
COPY --from=base root/catkin_ws/install /root/catkin_ws/install
RUN cd ~/catkin_ws && source /root/catkin_ws/install/setup.bash
CMD source /root/catkin_ws/install/setup.bash ; roslaunch pkg2 test.launch ; rosrun pkg2 node3.py
