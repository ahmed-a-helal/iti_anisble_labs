#! /bin/bash

# Adding the New User Ansible with encrypted pass
sudo useradd  -p'$1$ekykTdPh$oqYQ/gokTzA11HDFVsK1I/' -m  -s /usr/bin/bash ansible 

# giving the user sudo previlage
sudo usermod ansible -aG sudo

# adding the authorized_key
sudo -u ansible -- mkdir -p /home/ansible/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+l+R8f7tQRqo3IEr73zv7wqx3tRQhLPNpQsjC+aSVFp6+fk9XFxrJKmfJwLN9sdQ46AYrO2LtgUdXZ3rmffNGBYeDC76Is3Per451i/IVUAxzltZz0aBZ5UEfyYleSONUBaWEHXSk19uRGwLKdl6KXFHGHaw3CaA+TJZPxPZ+fMQbKqNgDMpnsq2VS+SJne2nmdWHR4Wqz2dfo/pFmsD+Yoxo9CbghrQ2vG0vXuiz5k64us8Dw8akLQ9R8Bz4RywuCi+xt64SuDmw+LigaqruZpnhqq0JjkuR2nR4i8wXPeY6/xLZbAwjPzMXwyQ6g7lKTDROoCt2c9LEvHYo80I8G1DCkyKwoy8FJtWDn6M6WPIeOQDuq72lg42FKwlkjn/bV7IGmM5GZ1bE9Gha1vMVBgMzNkeAZtetrHXdO3BxQWLTvxP7L+a+wztf5gHQ4hm6zdNpHECXGidKZitYtTMJR45dJKbXUCKNmnggmZ8iVnWDXxuI+/5gG4UO0dorjMs= attia@rocky.dance.party' \
 | sudo -u ansible -- tee  -a  /home/ansible/.ssh/authorized_keys

# Enabling password logging through ssh (disabled by default)
#echo 'PasswordAuthentication yes'|sudo  tee -a  /etc/ssh/sshd_config.d/passwrd_allow.conf
sudo service sshd restart