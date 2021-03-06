resource "openstack_compute_flavor_v2" "nano" {
  name  = "nano"
  ram   = "512"
  vcpus = "1"
  disk  = "5"
}
resource "openstack_compute_flavor_access_v2" "access_nano" {
  tenant_id = data.openstack_identity_project_v3.project.id
  flavor_id = openstack_compute_flavor_v2.nano.id
}

resource "openstack_compute_flavor_v2" "micro" {
  name  = "micro"
  ram   = "1024"
  vcpus = "1"
  disk  = "10"
}

resource "openstack_compute_flavor_access_v2" "access_micro" {
  tenant_id = data.openstack_identity_project_v3.project.id
  flavor_id = openstack_compute_flavor_v2.micro.id
}

resource "openstack_compute_flavor_v2" "medium" {
  name  = "medium"
  ram   = "4096"
  vcpus = "2"
  disk  = "50"
}

resource "openstack_compute_flavor_access_v2" "access_medium" {
  tenant_id = data.openstack_identity_project_v3.project.id
  flavor_id = openstack_compute_flavor_v2.medium.id
}

resource "openstack_compute_flavor_v2" "large" {
  name  = "large"
  ram   = "8192"
  vcpus = "4"
  disk  = "50"
}

resource "openstack_compute_flavor_access_v2" "access_large" {
  tenant_id = data.openstack_identity_project_v3.project.id
  flavor_id = openstack_compute_flavor_v2.large.id
}

resource "openstack_compute_flavor_v2" "fw" {
  name  = "fw"
  ram   = "1024"
  vcpus = "2"
  disk  = "20"
}

resource "openstack_compute_flavor_access_v2" "access_fw" {
  tenant_id = data.openstack_identity_project_v3.project.id
  flavor_id = openstack_compute_flavor_v2.fw.id
}