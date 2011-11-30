#!/bin/bash

# Fix various paths to get chef-solo working
#export PATH=$PATH:/opt/omni/lib/ruby/gems/1.8/gems/chef-0.10.4/bin
#export GEM_PATH=/opt/omni/lib/ruby/gems/1.8
#export GEM_HOME=/opt/omni/lib/ruby/gems/1.8

# Set path so git works
#export PATH=$PATH:/opt/omni/bin

INTERVAL=1800
SPLAY=120 # Random interval to inititally sleep to stagger chef runs
LOGFILE=/var/log/chef/solo.log
NODENAME=$(hostname)

CHEF_ROOT="/var/chef-solo"
# Which repositories to update with git
REPOS="$CHEF_ROOT/scripts $CHEF_ROOT/config $CHEF_ROOT/common"
# Path to node configs
NODEPATH="$CHEF_ROOT/config/nodes"

# Use a custom wrapper for ssh with git
export GIT_SSH=./resources/git-ssh-wrapper.sh
