# Install on Master server first

```
wget https://raw.githubusercontent.com/fadil05me/k3s-installer-bash/refs/heads/main/master.sh 
chmod +x master.sh
./master.sh
```

**Reboot the master server after successfully installing k3s**

# Install on Worker server

```
wget https://raw.githubusercontent.com/fadil05me/k3s-installer-bash/refs/heads/main/worker.sh
chmod +x worker.sh
./worker.sh
```

Done
