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