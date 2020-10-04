#!/bin/bash

if [[ ! -f 'roles_data.yaml' ]]; then
  openstack overcloud roles generate -o ~/roles_data.yaml Controller ComputeOvsDpdkSriov ComputeSriov
fi

openstack overcloud deploy --templates \
    --timeout 90 \
    -r ~/roles_data.yaml \
    -n ~/ovn/network_data.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-dpdk.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/services/neutron-ovn-sriov.yaml \
    -e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml \
    -e ~/ovn/debug.yaml \
    -e ~/ovn/api-policies.yaml \
    -e ~/ovn/environment.yaml \
    -e ~/ovn/ml2-ovs-dpdk.yaml \
    -e ~/containers-prepare-parameter.yaml
