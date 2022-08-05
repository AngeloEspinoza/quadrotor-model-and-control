# Quadrotor Model and Control

<p align="center">
  <img src="https://user-images.githubusercontent.com/40195016/182947670-38365403-d8f1-4365-8d66-408d3d772560.jpg" alt="drawing" width="450"/>
</p>

<p align = "center">
  Fig.1. Quadrotor with the applied forces over the rotors.
</p>


## Description 
A simulation of Teppo Luukkonen's paper [Modelling and control of quadcopter](https://scholar.google.com.mx/scholar_url?url=https://www.researchgate.net/file.PostFileLoader.html%3Fid%3D576d16ed93553b24b5721a9a%26assetKey%3DAS%253A376462596165634%25401466767085787&hl=es&sa=X&ei=2i3sYollhJjLBIWnqJgD&scisig=AAGBfm3lte7Y3M6Gfo7VZ3fVAyK0Pd9Wkw&oi=scholarr) in MATLAB/Simulink.

Since the quadrotor is considered a rigid body,  the dynamic equation that rules the quadrotor can be obtained with the Newton-Euler equations 

$$m\ddot{\xi} = G + RT_{B}$$

where $m$ is the mass of the quadrotor, $\ddot{\xi}$ is the acceleration of the quadrotor, $G$ is the gravitational constant, $R$ is the rotation matrix, and $T_{B}$ is the thrust of the rotors.

In order to control the quadrotor, a simple linear controller was used, the well-known PID controller, that can be described as 

$$u = -K_pe(t) - K_d \dot{e}(t) - K_i \int_0^t{e(\tau)}d\tau$$

where $u$ is the control input, $K_p, K_i$, and $K_d$ are the gains for the proportional, integral and derivative parts, respectively, $e$ is the error of the system, and $\tau$ is the variable of integration that 
takes into account the from the instant $0$ to the current instant $t$. 

### Current Initial Configuration
The quadrotor begins by default with $\phi, \theta, \psi$ and the $altitude$ in a certain position for testing purposes.

$$
\begin{align}
  \phi &= -0.1\text{ rad} \\
  \theta &= -0.9\text{ rad} \\
  \psi &= -3 \text{ rad} \\
  altitude &= 0\text{m}
\end{align}
$$

where $\phi$ is the roll angle or the rotation around the $x$-axis, $\theta$ is the pitch angle or the rotation around the $y$-axis, and $\psi$ is the yaw angle or the rotation around the $z$-axis.


### Desired Final Configuration
The goal configuration of the quadrotor can be modified simply by 

$$
\begin{align}
  \phi &= -0.3\text{ rad} \\
  \theta &= 0\text{ rad} \\
  \psi &= -\pi \text{ rad} \\
  altitude &= 5\text{m}
\end{align}
$$

where $\phi$ is the roll angle or the rotation around the $x$-axis, $\theta$ is the pitch angle or the rotation around the $y$-axis, and $\psi$ is the yaw angle or the rotation around the $z$-axis.

This is a figure with the trajectory of the drone along the time with the previous initial and desired configurations:

<p align="center">
  <img src="https://user-images.githubusercontent.com/40195016/182979284-d1def38b-7bfd-4444-8f48-00f35d651e68.svg" alt="drawing" width="550"/>
</p>

<p align = "center">
  Fig.2. Positions in $x, y$ and $z$ of the quadrotor after 10 seconds of simulations.
</p>

### Changing the initial and desired configurations
Both the initial and desired configurations can be modified in the ```parameters.m``` script.

## Plots
At the end of each simulation plots with the results will be displayed in order to see the behavior of the quadrotor along the time $t$. For this, I've implemented charts of the three Euler angles to see what's going on. It's also worth to point out that the same plots can be seen in the Simulink simulation through the scopes placed at the right part of the diagram.

<p align="center">
  <img src="https://user-images.githubusercontent.com/40195016/182979211-934d1000-aaf2-42c2-9636-d21dcf2ea121.svg" alt="drawing" width="330"/>
  <img src="https://user-images.githubusercontent.com/40195016/182979214-7c0532ac-f1e7-4d59-9a41-12ec0a7b5f57.svg" alt="drawing" width="330"/>
  <img src="https://user-images.githubusercontent.com/40195016/182979220-3071e7e8-5718-41c8-8e44-4da0d921d400.svg" alt="drawing" width="330"/>
</p>

<p align = "center">
  Fig.3. Left: Current and desired roll angle $\phi$ and $\phi_d$. Center: Current and desired pitch angle $\theta$ and $\theta_d$. Right: Current and desired yaw angle $\psi$ and $\psi_d$.
</p>

It may be the case that $x-y$ and $y-z$ plots get open at the beginning of each simulation, to avoid this, simply delete the **X-Y graphs** in the diagram at ```quadrotor_model/Quadrotor System```.

## Usage 
In order to execute the simulation, the script ```parameters.m``` should be run together with the ```quadrotor_model.slx``` simulink file.

## Singularities
Sometimes, due to the quasi-holonomic constraints of the quadrotor, and that we are using Euler angles, the simulation may fall into warnings and errors while choosing the initial or desired configurations.
That's why **it's recommended to be careful with the election of the configurations.** If this may be the case, the best way to start again is to restart with the default configurations previously mentioned. However, this is up to you.
