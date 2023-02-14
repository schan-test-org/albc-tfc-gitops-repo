data "http" "crds" {
  url = local.CRDS_URL
  request_headers = {
    Accept = "text/plain"
  }
}
