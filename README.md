# Recursive Dynamic Simulator (ReDySim) module for dynamic simulation of closed chain floating-base robotic systems
The Recursive Dynamics Simulator (ReDySim) is a MATLAB-based recursive solver for dynamic analysis of robotic and multibody systems. The more details regarding this software is available at its [webiste](http://redysim.weebly.com/). This module has increased the capability of this software for dynamic analysis of closed chain floating-base robotic system such as space robot. This is developed to carry out simulations for my M.Tech thesis work at [IIT Jodhpur](http://www.iitj.ac.in/) while working with [Prof. Suril V. Shah](http://surilshah.weebly.com/). The objective of is to provide a comprehensive modeling framework for capturing and manoeuvering of orbiting objects using a multi-arm robotic system mounted on a satellite. This framework provides a technique for proper debris disposal, thereby preventing their possible collision with active satellites. This also offers a technique for On-Orbit Servicing (OOS) operations such as refuel, repair and refurbishment of on-orbit satellites by an astronaut.

# System Specs:
- [MATLAB](https://matlab.mathworks.com/) 2009 or higher

# Steps for Simulation of a robotic system:

**1.** Enter the input parameters such as type of mechanism, i.e., open or closed, modified-DH parameters (See [appendix-A](https://github.com/deepakraina99/redysim-floating-base-robot/blob/master/Appendix%20A_DH%20parameter.pdf)), inertia tensors, masses etc., in the file inputs.m and save the file.

**2.** Enter the initial conditions and integration parameters such as initial state variable, integration tolerances, etc. in the file initials.m and save the file.

**3.** Enter initial and final joint positions in the function file trajectory.m and save the file.

**4.** User also needs to specify jacobian and its derivative in jacobian.m to simulate closed-loop systems; however, simulation of open-loop system does not require jacobian.m as the input.

**5.** Ensure that the parameters are properly entered in the files inputs.m, initials.m, trajectory.m and jacobian.m.

**6.** Run file run_me.m to simulate the system and to generate the plots for joint motions and energy. It will also animate the system using the simulation data. It actually runs runfor.m (for simulation), plot_motion.m (for motion plot), energy.m (for energy calculation) and plot_en.m (for energy plot).

**7.** Ensure that both the timevar.dat and statevar.dat files are in the program folder containing file animate.m. Run file animate.m in order to animate system using the simulation data. This file is specific to the system under study and hence need to be modified depending on the system or mechanism.

The more details regarding the software are provide in [manual](https://github.com/deepakraina99/redysim-floating-base-robot/blob/master/Manual_Floating-base_ForDyn.pdf). User may also run another demos by simply copying the files from the folders fivebar and sixbar mechanism and paste in the main folder containing the file run_me.m in order to simulate either of them. 

## Citations
Please cite our [Springer](https://link.springer.com/chapter/10.1007/978-981-10-8597-0_48) paper if you use this repository in your publications:
```
@incollection{raina2019modeling,
  title={Modeling and Estimation of Closed-Loop Impact for Multi-arm Space Robot While Capturing a Tumbling Orbiting Object},
  author={Raina, Deepak and Gora, Sunil and Shah, Suril Vijaykumar},
  booktitle={Machines, Mechanism and Robotics},
  pages={561--570},
  year={2019},
  publisher={Springer}
}
```
