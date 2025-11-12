#!/bin/bash

# Exit on any error
set -e

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Docker and Docker Compose..."
sudo apt install -y docker.io docker-compose

echo "Adding user to docker group..."
sudo usermod -aG docker $USER

echo "Starting Docker service..."
sudo systemctl enable --now docker

echo "Bringing up all services with Docker Compose..."
docker-compose up -d

echo "All services are up!"
echo "Jenkins: http://localhost:8080"
echo "Nginx/Flask App: http://localhost"
echo "Redis is running on port 6379"
