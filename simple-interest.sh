#!/bin/bash

# Simple Interest Calculator
# Author: Student
# Version: 1.0

echo "======================================="
echo "   SIMPLE INTEREST CALCULATOR"
echo "======================================="

# Get user input
read -p "Enter the principal amount: $" principal
read -p "Enter the annual interest rate (%): " rate
read -p "Enter the time period (years): " time

# Validate input
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Principal must be a positive number."
    exit 1
fi

if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Interest rate must be a positive number."
    exit 1
fi

if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Time period must be a positive number."
    exit 1
fi

# Calculate simple interest
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Calculate total amount
total=$(echo "scale=2; $principal + $interest" | bc)

# Display results
echo "======================================="
echo "              RESULTS"
echo "======================================="
echo "Principal Amount:    $$principal"
echo "Annual Rate:         $rate%"
echo "Time Period:         $time years"
echo "---------------------------------------"
echo "Simple Interest:     $$interest"
echo "Total Amount:        $$total"
echo "======================================="
