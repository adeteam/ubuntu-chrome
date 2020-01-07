FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN curl -fsSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN add-apt-repository -y ppa:ansible/ansible
RUN add-apt-repository "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
RUN add-apt-repository "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main"

RUN apt-get update -qq
RUN apt-get install -y google-chrome-stable
RUN apt-get install -y fontconfig fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-symbola fonts-noto ttf-freefont
RUN apt-get install -y ansible python python-pip
RUN apt-get install -y google-cloud-sdk jq
RUN pip install jmespath netaddr botocore boto boto3 google-auth pyVim pyVmomi requests

# install latest git
RUN add-apt-repository ppa:git-core/ppa
RUN apt-get update -qq && apt-get install -y git

# remove and clean up apt
RUN add-apt-repository -r "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main"
RUN add-apt-repository -r "deb http://packages.cloud.google.com/apt cloud-sdk-xenial main"
RUN apt-get update -qq
RUN apt autoremove --purge
RUN rm -rf /var/lib/apt/lists/*
RUN apt clean
RUN rm -rf /tmp/*