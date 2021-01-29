#!/bin/bash
set -e

# update apt
apt-get update

# install python3
apt-get install -y -qq python3 python3-apt

# install aptitude
apt-get install -y libssl-dev apt-transport-https

# upgrade pip3
curl -sL https://bootstrap.pypa.io/3.5/get-pip.py -o /usr/bin/get-pip
chmod a+x /usr/bin/get-pip
rm -rf /root/.cache/pip
# make sure pip is configured correctly
cat << 'EOF' > /etc/pip.conf
[global]
ignore-requires-python = true
EOF
/usr/bin/python3 /usr/bin/get-pip pip==19.2.3
hash pip3

pip3 install ansible==2.10.3
pip3 install jmespath netaddr botocore boto boto3 google-auth pyVim pyVmomi requests
