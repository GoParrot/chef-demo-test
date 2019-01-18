FROM ubuntu:14.04 as chef_dk
LABEL maintainer "Marko Petrovic <mrpetrovic@outlook.com>" desciption "chef workstation image"

ARG serverUrl=https://chef-server:$SSL_PORT/knife_admin_key.tar.gz
ARG dkVer=2.5.3

RUN mkdir -p /root/.chef && mkdir -p /root/chef-repo

WORKDIR /root/.chef
ADD knife.rb .
RUN apt-get update && apt-get install git -y && apt-get install curl -y  &&  apt-get install wget -y && apt-get install -y zsh &&  apt-get install tree -y && apt-get install -y vim

RUN  curl https://omnitruck.chef.io/install.sh | bash -s -- -P chefdk -c stable -v ${dkVer} 

# Uncomment if you want to connect to real chef server by providing server url to admin key
# RUN curl -Ok ${serverUrl} && tar xf knife_admin_key.tar.gz && knife ssl fetch 

EXPOSE 80
