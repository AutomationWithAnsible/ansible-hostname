#!/bin/bash
set -e
echo "Running travis "
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

SETUP_VERSION="v1.0.0"
#SETUP_VERBOSITY="vv"

## Install Ansible 2.0
ANSIBLE_VERSIONS_0="2.0.2.0"
INSTALL_TYPE_0="pip"
ANSIBLE_LABEL_0="v2.0"

## Install Ansible 2.2
ANSIBLE_VERSIONS_1="2.2.0.0"
INSTALL_TYPE_1="pip"
ANSIBLE_LABEL_1="v2.2"

# Whats the default version
ANSIBLE_DEFAULT_VERSION="v2.2"

## Create a temp dir
filename=$( echo ${0} | sed 's|/||g' )
my_temp_dir="$(mktemp -dt ${filename}.XXXX)"

curl -s https://raw.githubusercontent.com/ahelal/avm/${SETUP_VERSION}/setup.sh -o $my_temp_dir/setup.sh

## Run the setup
. $my_temp_dir/setup.sh