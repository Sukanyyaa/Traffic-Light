# 🚦 Traffic Light Control System using FSM & Verilog HDL

##  Project Overview
This project simulates a **Traffic Light Control System** using a **Finite State Machine (FSM)** approach, implemented in **Verilog HDL**. It models a real-world intersection with systematic light transitions, timing control, and state-based logic.

---
## Technologies Used
- Verilog HDL  
- FSM (Finite State Machine)  
- EDA Playground (Simulation & Testing)

---

## System Description
- The system controls **Red, Yellow, and Green lights** for a two-way intersection.
- Operates through a **Moore FSM** with clearly defined states and transitions.
- Each light remains ON for a fixed duration (simulated with counters).

## FSM Details
- **States**: `S0` (Red), `S1` (Red+Yellow), `S2` (Green), `S3` (Yellow)
- **Transitions** occur based on clock cycles (e.g., 5-sec intervals)

## FSM State Encoding
The states are encoded in 2-bit binary values for each direction:
`00` → Green
`01` → Yellow
`10` → Red


## 📂 File Structure

