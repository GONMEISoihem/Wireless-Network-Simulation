# Multicell Wireless Network Simulation

## Overview
This repository contains a simulation of a multicell wireless network, focusing on modeling the distribution of base stations (BSs) using a homogeneous Poisson Point Process (HPPP). The simulation evaluates the performance of a typical user equipment (UE) located at the origin in a downlink scenario. The key features of the simulation include modeling the spatial distribution of BSs, propagation effects, beamforming, and signal fading.

## System Model
### Base Station (BS) Distribution
- **Homogeneous Poisson Point Process (HPPP):** BSs are distributed randomly on a 2D plane. Each BS's location is a random point, and the density of BSs controls how many are present in a given area.

### User Equipment (UE) Distribution
- **UEs:** UEs are also distributed randomly on the plane, independent of the BSs. The typical UE, assumed to be at the origin, is analyzed for performance metrics.

### Propagation Model
- **Line-of-Sight (LoS) and Non-Line-of-Sight (NLoS) Probabilities:** The probability that a link between a UE and a BS is LoS decreases with distance, representing the likelihood that a clear path exists between the UE and the BS.
- **Path Loss:** The signal strength decreases with distance from the BS, and this reduction is modeled based on standard path loss formulas.

### Beamforming
- **Sectorized Beamforming:** Both BSs and UEs use directional antennas with specific beam widths. The beam gain for the desired signal is higher when both the BS and UE are aligned, while the gain is lower for interfering signals.

### Fading Model
- **Small-Scale Fading:** The model includes random variations in signal strength due to small-scale fading, which is modeled using a statistical distribution.

### Power and Signal Strength
- **Transmission Power:** All BSs transmit with the same power level.
- **Received Power:** The downlink received power at the typical UE is determined by the transmitted power, the path loss, and the fading effects. The UE is served by the BS that provides the strongest signal.

## Repository Contents
- **Simulation Code:** The core simulation code implementing the system model described above.
- **Documentation:** Instructions on running the simulation and understanding the output.
## Project Status
This project is a completed baseline simulation of typical multicell wireless network. 
## How to Use
1. Clone the repository:
   ```bash
   git clone https://github.com/GONMEISoihem/Wireless-Network-Simulation.git
