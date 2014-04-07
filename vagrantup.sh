#!/usr/bin/env bash

export VM_MEMORY=1024

cp puppet/modules/base/files/nexus{BUILD}.properties puppet/modules/base/files/nexus.properties

vagrant up --provision
