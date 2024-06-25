
# Parking Management System

A Verilog-based project that manages the parking spaces in a parking lot, distinguishing between university and non-university cars. This project includes the design and simulation of a parking management system using Verilog HDL.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Directory Structure](#directory-structure)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Simulation](#simulation)
- [Contributing](#contributing)
- [License](#license)

## Overview
This project implements a parking management system in Verilog. It tracks the number of parked and vacated cars, with separate counts for university and non-university cars. The system also ensures that the parking spaces do not exceed their maximum capacities.

## Features
- Tracks university and non-university parked cars
- Ensures maximum capacity limits
- Real-time tracking and management

## Directory Structure
```plaintext
parking-management-system/
│
├── README.md
├── docs/
│   ├── images/
│   │   └── (images for documentation)
│   └── (additional documentation)
├── src/
│   └── main.v
├── test/
│   └── testbench.v
└── LICENSE
