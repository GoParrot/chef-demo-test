**CHEF DOCKER DEMO**

**STEPS TO SETUP ENV(on linux/mac only)**

---------------------------------------------
test-node containers root password for ssh is root(super secret)

docker-compose up -d -> if you start without -d you will have to exit the log streaming with ctrl+z (or you will kill compose process)

docker exec -it chefdk bash

in container execute: - curl -Ok https://chef-server:$SSL_PORT/knife_admin_key.tar.gz; tar xf knife_admin_key.tar.gz; knife ssl fetch; echo; knife user list; echo; knife client list

NOTE0: You will have to wait for Server to get up, otherwise you will get connection refused or you will download html page; it shouldn't take more then 5mins(1st time could take longer due to builing of image)

NOTE2: if you have any connection issue, try knife configure -i and go thru the setup and/or check knife.rb file

STANDALONE DK - for stand alone DK, run Dockerfile with:

docker build -t chefdk . && docker run -it -v $(pwd):/root/chef-repo -p 8100:80 chefdk bash

Starting with multiple clients: docker-compose up -d --scale test-node=n

bootstraping(connecting) node to server(with user/pass) cmd:

knife bootstrap test-node --ssh-user root --ssh-password root --sudo --use-sudo-password --node-name node1-ubuntu / adding with privite key change --ssh-password with --identity-file ~/.ssh/private_key

test with: knife node list

OR you can user connect_nodes.sh to bootstrap 1 or more test-node(nodes will be named by their container name)

-------------------------------------------------------