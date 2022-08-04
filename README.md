# Quadrotor Model and Control

<p align="center">
  <img src="https://user-images.githubusercontent.com/40195016/182947670-38365403-d8f1-4365-8d66-408d3d772560.jpg" />
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
  \psi &= -\pi \text{ rad} \\
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



### Changing the initial and desired configurations
Both the initial and desired configurations can be modified in the ```parameters.m``` script.

## Usage 
In order to execute the simulation, the script ```parameters.m``` should be run together with the ```quadrotor_model.slx``` simulink file.

## Singularities
Sometimes, due to the quasi-holonomic constraints of the quadrotor, and that we are using Euler angles, the simulation may fall into warnings and errors while choosing the initial or desired configurations.
That's why **it's recommended to be careful with the election of the configurations.** If this may be the case, the best way is to restart in the default configurations. However, this is up to you.
