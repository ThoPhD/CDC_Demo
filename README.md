# CDC Demo

This repository demonstrates the implementation of Change Data Capture (CDC) in a sample project.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Setup](#setup)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview
CDC (Change Data Capture) is a technique used to track and capture changes in a database. This project showcases how to implement CDC in a real-world scenario.

## Features
- Real-time data change tracking
- Integration with modern databases
- Scalable and efficient architecture

## Setup
1. Clone the repository:
    ```bash
    git clone git@github.com:ThoPhD/CDC_Demo.git
    ```
2. Navigate to the project directory:
    ```bash
    cd CDC_Demo
    ```

## Usage
1. Start the application:
    ```bash
    docker-compose up -d
    ```
2. Follow the instructions in the terminal to interact with the CDC demo.
- Open Kafka UI: http://localhost:8080
- Grant permission for .sh files
    ```bash
    chmod +x register_postgres_cdc.sh update_postgres_cdc.sh
    ```
- Run
    ```bash
    ./register_postgres_cdc.sh
    ```
- Update CDC register tables:
    ```bash
    ./update_postgres_cdc.sh
    ```
## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.
