resource "google_project" "terraform_project" {
  name       = var.project_name
  project_id = "${var.project_name}-kobeieii"
  folder_id  = var.folder_id
  billing_account = var.billing_account_id
}