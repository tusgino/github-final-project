#!/usr/bin/env bash
# Simple Interest Calculator
# SI = (P * R * T) / 100

set -euo pipefail

echo "=== Simple Interest Calculator ==="
read -r -p "Enter the principal amount: " principal
read -r -p "Enter the rate of interest: " rate
read -r -p "Enter the time period in years: " time

# Basic numeric validation
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] \
  || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] \
  || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: principal, rate, and time must be non-negative numbers." >&2
  exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
  'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo
echo "Simple Interest = $interest"
