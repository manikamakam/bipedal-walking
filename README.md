# Modelling and Simulation of a Biped Walking Robot

This project aimed to model and simulate static walking of bipedal robot (performed in both 2 dimensions and 3 dimensions). 

## Prerequisites
* MATLAB
* Simulink
* Simscape Multibody Toolbox 
* Simscape Multibody Contact Forces Library
* Simscape Multibody Multiphysics Library

*For convenience, local copies of the Simscape Multibody Multiphysics Library and Simscape Multibody Contact Forces Library have been included in the repository.*

## Running the Simulation

**Step 1** Run 'TrajectoryGeneration_2D.m' ('TrajectoryGeneration_3D.m' for 3 dimensional model). This calculates the foot trajectories and the corresponding joint angles. You'll see the following output. 

<p align="center">
	<img src="https://github.com/p-akanksha/bipedal-walking/blob/master/2D_LeftLegAngle.PNG" width="350">
	<img src="https://github.com/p-akanksha/bipedal-walking/blob/master/2D_RightLegAngle.PNG" width="350">
</p>


**Step2** Open 'BipedWalking_2D.slx' ('BipedWalking_3D.slx' for 3 Dimensional model) and run it. 
