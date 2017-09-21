#!/bin/bash
set -e
echo "Running travis "
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

SETUP_VERSION="v1.0.0"
export AVM_VERBOSE="vv"

# 21 September 2017 (@antonu17)
# pip is not work in xenial w/o LC_ALL 
export LC_ALL="C"

## Install Ansible 2.2.3.0 using pip and label it 'v2.2'
export ANSIBLE_VERSIONS_1="2.2.3.0"
export INSTALL_TYPE_1="pip"
export ANSIBLE_LABEL_1="v2.2"

## Install Ansible 2.3.1.0 using pip and label it 'v2.3'
export ANSIBLE_VERSIONS_2="2.3.1.0"
export INSTALL_TYPE_2="pip"
export ANSIBLE_LABEL_2="v2.3"

# Whats the default version
export ANSIBLE_DEFAULT_VERSION="v2.3"

## Create a temp dir
filename=$( echo ${0} | sed 's|/||g' )
my_temp_dir="$(mktemp -dt ${filename}.XXXX)"

curl -s https://raw.githubusercontent.com/ahelal/avm/${SETUP_VERSION}/setup.sh -o $my_temp_dir/setup.sh

## Run the setup
. $my_temp_dir/setup.sh