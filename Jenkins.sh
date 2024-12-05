vim setup_jenkins.sh


#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install Java (required for Jenkins)
echo "Installing Java..."
sudo apt install openjdk-11-jdk -y

# Check Java installation
java -version

# Download Jenkins WAR file
echo "Downloading Jenkins WAR file..."
wget -O jenkins.war http://mirrors.jenkins.io/war-stable/latest/jenkins.war

# Start Jenkins server
echo "Starting Jenkins on port 8080..."
nohup java -jar jenkins.war --httpPort=8080 > jenkins.log 2>&1 &

# Wait for Jenkins to start
echo "Waiting for Jenkins to initialize..."
sleep 30

# Retrieve the initial admin password
if [ -f /root/.jenkins/secrets/initialAdminPassword ]; then
    echo "Retrieving the initial admin password..."
    sudo cat /root/.jenkins/secrets/initialAdminPassword
else
    echo "Jenkins is still initializing or the password file could not be found."
    echo "Check the logs for more details: jenkins.log"
fi

# Display Jenkins access URL
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
echo "Jenkins is running. Access it at: http://$PUBLIC_IP:8080"

echo "Setup complete!"


chmod +x setup_jenkins.sh

./setup_jenkins.sh
