
data "openstack_images_image_v2" "ubuntu_bionic_docker" {
  name="Ubuntu Bionic Docker"
  most_recent = true
}

resource "openstack_images_image_v2" "ubuntu_bionic" {
  name             = "Ubuntu Bionic"
  image_source_url = "https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"

  min_disk_gb = 3
  min_ram_mb = 512
}
