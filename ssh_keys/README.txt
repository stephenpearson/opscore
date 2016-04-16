Insert an RSA SSH keypair here named virsh and virsh.pub:

Example:

ssh-keygen -t rsa -b 2048 -f virsh -N ''
cat virsh.pub >> ~/.ssh/authorized_keys
chmod go-rwx ~/.ssh/authorized_keys

