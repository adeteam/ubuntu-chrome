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

pip3 install setuptools==51.0.0 cryptography==2.8 wheel==0.29.0 cachetools==3.1.1
pip3 install jmespath netaddr botocore boto==2.49.0 boto3==1.16.49 google-auth pyVim pyVmomi PyYAML==5.3.1 requests
pip3 install ansible-base==2.10.3 ansible==2.10.3
