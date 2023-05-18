# RT2_assignment_2
Substitute the Node A of RT1_assignment_2 with a node made with jupyter

Andrea Bolla - 4482930


# Introduction
In this assignment, I developed, by using **ROS**, three nodes and the lauch file:
- (A) A node implemented with **jupyter**, using **widgets** the user know : the position of the robot and all targets that have been set and cancelled in the environment - the distance of the closest obstacle 
- (B) A service node that, when called, prints the number of goals reached and cancelled;
- (C) A node that subscribes to the robot’s position and velocity (using the custom message) and prints the distance of the robot from the target and the robot’s average speed. Use a parameter to set how fast the node publishes the information.
-  Create a launch file to start the whole simulation. Set the value for the frequency with which node (C) publishes
the information.
- For more information see the repository RT1_assignment_2



# Nodes
There are six nodes in the package:

- `bug_as.py` is the action server node that calls the  services to move the robot to the goal position
- `go_to_point_service.py` is the service node to move the robot to the goal position
- `wall_follow_service.py` is the service node to avoid obstacles

and the other three node implemented by myself

- `Number_Goal_rc_nodeB.py` is the service node that, when called, prints the number of goals reached and cancelled 
-  `Dist_Speed_nodeC.py` is the node that subscribes to the robot’s position and velocity from the */pos_and_vel* topic as a custom message and prints the distance of the robot from the target and the robot’s average speed with a frequency setted as a parameter in the lauch file


After the program has started, you can interact with four windows:

- **Rviz** is a ROS visualization 
- **Gazebo** is the 3D simulator environment with the obstacles and the robot 
- **Dist_Speed_nodeC.py** is the window where distance from target and average speed of the robot are showed

- To know the number of goals reached and canceled, type on another tab:

      rosservice call /n_goal
      
- You can set the frequency from the launch file `assignment1.launch` inside of the `launch` folder, by changing the value and relaunch the program.

# Installing and Running
-  First of all, you have to install **xterm**:

       sudo apt install xterm

- after that, download my package  `assignment_2_2022 `inside the `src` folder of your ROS workspace

- now run the master by typing:

      roscore 

- from another tab, go to your ROS workspace run the command:

      catkin_make

- to run new code, type the following command:

      roslaunch assignment_2_2022 rt2_assignment2.launch
      
- then run the **jupyter** node `Node_A_jupyter.ipynb`


If you want the old version instead:

- to run the same code inside the RT1_assignment_2 repository , type the following command:

      roslaunch assignment_2_2022 assignment1.launch
    

# LAB1 - DOXYGEN
You can find the Doxygen documentation inside the docs folder in the repository RT1_assignment_2

# LAB2 - JUPYTER
Here you can find `Node_A_jupyter.ipynb`, the Node A written in Jupyter

# LAB3 - Reserch
Here you can find the research

# Improvment
- Improve user interface by being more clear in how set the inputs and give error message if the inputs are wrong
- Improve the node B, distance and average speed are not in real time and are not very accurate

# GRAPH
Be sure that all the nodes and topics are active and connected like this!
![rosgraph2.png](https://github.com/boez98/RT2_assignment_2/blob/main/rosgraph2.png

# How the Node works
- In the section `12 All Widgets`:
      -  you can set or cancel the goal
      -  you can see a widget with the goal coordinate and the update number of goal reached/canceled
      -  you can see the distance from the nearest wall/obstacle
- In the section `13 Live pos and vel` you can see the live position and velocity of the robot
- In the section `14 Movement graph` you can see the robot trajectory, my idea was also to add the various goal position and the wall position detected from lasers
