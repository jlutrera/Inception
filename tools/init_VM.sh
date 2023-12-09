##############
# User SetUp #
##############
su
sudo adduser jutrera
usermod -aG sudo jutrera
sudo reboot

##################
# Install Docker #
##################
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

##########################
# Install Docker Compose #
##########################
sudo apt-get update
sudo apt-get install docker-compose-plugin
sudo curl -L https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#############################################
# Allow user to execute without permissions #
#############################################
## INSTEAD ADD TO DOCKER GROUP
sudo chmod 666 /var/run/docker.sock

########################
# Add Hosts to machine #
########################
sudo cat << EOF >> /etc/hosts
#Inception Setup
127.0.0.1 jutrera.42.fr
EOF
