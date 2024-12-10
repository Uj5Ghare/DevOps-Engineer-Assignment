#!/bin/bash

sudo apt update && sudo apt install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
docker network create app
docker run -d --name react-app --net app -p 80:3000 uj5ghare/eng-frontend:latest
docker run -d --name node-app --net app -p 8000:8000 uj5ghare/eng-backend:latest
# Now Node.js backend can be accessible with a http://<public-ip>:8000/status API returning status and uptime.