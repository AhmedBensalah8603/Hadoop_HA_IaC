#!/bin/bash
# Install Java (required for Hadoop)
echo "Installing Java..."

# Check if Java is already installed
if ! java -version &>/dev/null; then
  sudo apt update
  sudo apt install -y openjdk-8-jdk wget 
  echo "Java installation complete!"
else
  echo "Java is already installed."
fi

# Checking if Java is installed and configuring environment variables
echo "Checking Java installation..."
java -version

echo "Configuring Java environment variables..."
cat <<EOL >> ".bashrc"
### JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=\$JAVA_HOME/bin:\$PATH
EOL


# Reload .bashrc to apply changes
source .bashrc

echo "Java installation and environment setup completed!"

