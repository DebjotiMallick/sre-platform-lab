# Common Role

Prepares all nodes for Kubernetes deployment with essential system configurations:

- Disables swap
- Configures hostname and /etc/hosts
- Loads required kernel modules (overlay, br_netfilter)
- Applies sysctl settings for Kubernetes networking
