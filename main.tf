provider "google" {
  project = "sam-458313"
  zone    = "us-central1-a"
}

resource "google_compute_disk" "nam" {
  name  = "disk-1"
  size  = 20
  type  = "pd-standard"
  zone  = "us-central1-a"
}

resource "google_compute_instance" "name" {
  name         = "instance-99"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }


  network_interface {
    network = "default"
    access_config {}
  }
  metadata = {
  enable-oslogin = "TRUE"
}

}

resource "google_compute_attached_disk" "disk-attach" {
  disk     = google_compute_disk.nam.id
  instance = google_compute_instance.name.id
  
}
