#!/bin/bash

openstack overcloud container image prepare   \
  --namespace docker-registry.engineering.redhat.com/rhosp13  \
  --prefix "openstack-" \
  --tag 2019-12-12.1 \
  --env-file docker_registry.yaml

