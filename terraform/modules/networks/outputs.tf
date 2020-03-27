output "ids" {
  value = {
    for nw in openstack_networking_network_v2.net:
    nw.name => nw.id
  }
}