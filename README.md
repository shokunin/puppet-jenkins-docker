puppet-jenkins-docker
=====================

Spin up a jenkins box that can build and test docker container in a pipeline


setup
-----

```
git clone https://github.com/shokunin/puppet-jenkins-docker

# requires ruby bunder installed
bundle install

# download the puppet modules
cd puppet
r10k puppetfile install

# startup
cd ..
vagrant up

```

