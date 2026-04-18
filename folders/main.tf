resource "google_folder" "tf_1" {
  display_name = "tf-1"
  parent       = "organizations/741174729271"
}

resource "google_folder" "sub_tf_1" {
  display_name = "sub-tf-1"
  parent       = google_folder.tf_1.name
}