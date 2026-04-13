# 2DOF Robotic Arm Simulation — MATLAB

A real-time inverse kinematics simulation of a 2-degree-of-freedom planar robotic arm tracking a circular trajectory in MATLAB.



## Demo

The arm tracks a circular path using inverse kinematics while four live plots update in real time:

- Joint angles (θ₁, θ₂)
- Joint angular velocities (ω₁, ω₂)
- End-effector tracking error
- Animated arm with traced path



## Features

- Real-time animation with dark theme visualization
- Inverse kinematics solver (elbow-up configuration)
- Live joint angle and velocity plots
- End-effector path tracing
- Tracking error monitoring



## Requirements

- MATLAB R2018b or later
- No additional toolboxes required



## How to Run

1. Clone the repository:
```bash
   git clone https://github.com/NIKILSRUJAN/2DOF_Robotic_Arm_Simulation.git
```
2. Open MATLAB and navigate to the project folder
3. Run the script:
```matlab
   run('robotic_arm.m')
```



## Parameters

| Parameter | Value | Description |
|-----------|-------|-------------|
| `L1` | 1.0 m | Length of link 1 |
| `L2` | 1.0 m | Length of link 2 |
| `xc, yc` | Circle r=0.8 | Target trajectory |
| Points | 500 | Path resolution |



## Project Structure

```
2DOF_Robotic_Arm_Simulation/
├── robotic_arm.m          # Main simulation script
├── Robotic_arm_sim.mp4    # Output animation (recorded)
└── README.md              # Project documentation
```

---

## How It Works

The arm uses **geometric inverse kinematics**:

1. Compute the cosine of joint 2 angle using the law of cosines
2. Resolve joint 1 angle using `atan2`
3. Forward kinematics verifies end-effector position
4. Repeat at 500 points along the circular path



## License

MIT License — free to use and modify.



## Author

Nikil Srujan — [github.com/NIKILSRUJAN](https://github.com/NIKILSRUJAN)
