# Visual Servoing of UR-Robot
Using this package, one can perform vision based control of UR5 robot in  real and simulated environment of Gazebo

#### System Specs:
- Ubuntu 14.04 LTS (64 bits)
- ROS Indigo
- Gazebo7
- Clone the code and do catkin_make

GitLab Link : [Code](https://www.google.com)

# How to do Visual Servoing in real environment?

## Initial Steps:
**1.** Connect Robot through LAN to your laptop.
**2.** Connect realsense-camera to your laptop using USB port. 

** Connect to robot**
```sh
$ roslaunch ur_modern_driver ur5_bringup.launch robot_ip:=10.42.0.202
```

** Connect to realsense-camera ** 
```sh
$ roslaunch realsense_camera sr300_nodelet_rgbd.launch
```

** Object-tracker **
Tracks the object (ball) using the camshift tracking algorithm
```sh
$ rosrun object_detection camshift_only_tracker
```
OR

Tracks the object (ball) using the camshift tracking and uses Kalman-filter as and when object is occuluded.
```sh
$ rosrun object_detection camshift_kalman_tracker
```

** Visual-servoing control **
Tracking using centroid of ball
```sh
$ rosrun ur5_vs new_ibvs_two_features
```
Tracking using centroid and depth of ball
```sh
$ rosrun ur5_vs new_ibvs_three_features
```

# How to do Visual Servoing in simulated environment?

## Initial Steps:
**1.** Remove Gazebo2 (default) and install Gazebo7.

** Set up the simulated world in Gazebo**
```sh
$ roslaunch ur_gazebo ur5_my_world.launch
```

** Object-tracker **
Tracks the object (ball) using the camshift tracking algorithm
```sh
$ rosrun object_detection camshift_only_tracker
```

** Visual-servoing control **
Tracking using centroid of ball
```sh
$ rosrun ur5_vs gazebo_ibvs_two_features
```
Tracking using centroid and depth of ball
```sh
$ rosrun ur5_vs gazebo_ibvs_three_features
```
