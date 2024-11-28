#!/bin/bash

# Vars
KUBECFG="/home/$USER/.kube/config"

# Install K3s on master
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

# Create .kube directory for the user
echo "Configuring Kubernetes for user $USER..."
mkdir -p "/home/$USER/.kube"
sudo chown "$USER:$USER" "/home/$USER/.kube"
chmod 0755 "/home/$USER/.kube"

# Copy k3s.yaml to user's kube config
sudo cp /etc/rancher/k3s/k3s.yaml "$KUBECFG"
sudo chown "$USER:$USER" "$KUBECFG"
chmod 0600 "$KUBECFG"

# Add KUBECONFIG to user's .bashrc
echo "export KUBECONFIG=$KUBECFG" >> "/home/$USER/.bashrc"

# Add KUBECONFIG to root's .bashrc
echo "export KUBECONFIG=/etc/rancher/k3s/k3s.yaml" | sudo tee -a /root/.bashrc > /dev/null

exec bash

echo "K3s master installation complete."

echo "Your Master Token:"

sudo cat /var/lib/rancher/k3s/server/token
