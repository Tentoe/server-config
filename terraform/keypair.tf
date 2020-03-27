resource "openstack_compute_keypair_v2" "default" {
  name       = "default"
  public_key = var.public_key
}
