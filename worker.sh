#!/bin/bash

# Prompt for master IP and token
read -p "Enter the master node IP address: " MASTER_IP
read -p "Enter the master token: " MASTER_TOKEN

# Install K3s on worker node
echo "Installing K3s worker..."
curl -sfL https://get.k3s.io | K3S_URL="https://$MASTER_IP:6443" K3S_TOKEN="$MASTER_TOKEN" sh -

echo "K3s worker installation complete."
