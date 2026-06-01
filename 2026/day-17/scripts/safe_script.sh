#!/bin/bash

set -e

echo "Starting safe script..."

mkdir /tmp/devops-test || echo "Directory already exists or failed to create"

cd /tmp/devops-test || { echo "Failed to enter directory"; exit 1; }

touch demo.txt || { echo "Failed to create file"; exit 1; }

echo "Hello DevOps" > demo.txt || { echo "Failed to write to file"; exit 1; }

echo "File created successfully in /tmp/devops-test"

