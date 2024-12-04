sudo yum update -y  # For Amazon Linux 2
sudo amazon-linux-extras install java-openjdk11 -y  # For Amazon Linux 2
java -version
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
sudo yum install jenkins -y  # For Amazon Linux 2
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
