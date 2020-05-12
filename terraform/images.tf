

resource "openstack_images_image_v2" "ubuntu_bionic" {
  name             = "Ubuntu Bionic"
  image_source_url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"

  min_disk_gb = 3
  min_ram_mb  = 512
}

resource "openstack_images_image_v2" "vyos" {
  name             = "vyos"
  image_source_url = "https://downloads.vyos.io/rolling/current/amd64/vyos-rolling-latest.iso"
  container_format = "bare"
  disk_format      = "iso"

  min_disk_gb = 3
  min_ram_mb  = 512
}

resource "openstack_images_image_v2" "CirrOS" {
  name             = "CirrOS"
  image_source_url = "http://download.cirros-cloud.net/0.5.1/cirros-0.5.1-x86_64-disk.img"
  container_format = "bare"
  disk_format      = "qcow2"

  min_disk_gb = 3
  min_ram_mb  = 512
}

resource "openstack_images_image_v2" "vyos" {
  name             = "OPNsense"
  local_file_path = "images/OPNsense-20.1-OpenSSL-dvd-amd64.iso"
  container_format = "bare"
  disk_format      = "iso"

  min_disk_gb = 10
  min_ram_mb  = 1024
}