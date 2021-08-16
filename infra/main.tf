# Google Cloud Storage bucket with the CV pdf(s)
# * <name> must be the domain name
# * DNS must be validated with https://search.google.com/search-console
# * TXT record <name>, contents 'google-site-verification=...' (from above)
# * CNAME record <name>, contents 'c.storage.googleapis.com'
# * Service Account email running this must be a domain owner
#  (https://cloud.google.com/storage/docs/domain-name-verification#additional_verified_owners)

resource "google_storage_bucket" "cv_site" {
  name          = var.cv_domain
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  website {
    main_page_suffix = var.cv_file
  }
}

# Google Cloud Storage bucket IAM binding
# Give 'roles/storage.legacyObjectReader' to 'allUsers' because
# 'roles/storage.objectViewer' allows bucket listing

resource "google_storage_bucket_iam_binding" "cv_site_binding" {
  bucket = google_storage_bucket.cv_site.name
  role   = "roles/storage.legacyObjectReader"
  members = [
    "allUsers"
  ]
}