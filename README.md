# Modelling and Simulation of a Biped Walking Robot

This project aimed to model and simulate static walking of bipedal robot (performed in both 2 dimensions and 3 dimensions). In this project, we develop a kinematic model of the robot and generate stable trajectories for walking. These models and trajectories are then validated with the help of simulations. 

These three steps of kinematic model development, trajectory generation and validation (simulation) are followed for both two and three dimensional walking. The reports concludes with a discussion of how this work can be taken forward.

## Prerequisites
* MATLAB
* Simulink
* Simscape Multibody Toolbox 
* Simscape Multibody Contact Forces Library
* Simscape Multibody Multiphysics Library

*For convenience, local copies of the Simscape Multibody Multiphysics Library and Simscape Multibody Contact Forces Library have been included in the repository.*

## Running the Simulation

**Step 1** Run 'TrajectoryGeneration_2D.m' ('TrajectoryGeneration_3D.m' for 3 dimensional model). This calculates the foot trajectories and the corresponding joint angles. You'll see the following output. 

![alt text](2D_LeftLegAngle.PNG?raw=true "Title")
![alt text](2D_RightLegAngle.PNG?raw=true "Title")

**Step2** Open 'BipedWalking_2D.slx' ('BipedWalking_3D.slx' for 3 dimensional model) and run it. 

---

## Multiphysics and Contact Libraries
For convenience, local copies of the Simscape Multibody Multiphysics Library and
Simscape Multibody Contact Forces Library have been included with this submission.