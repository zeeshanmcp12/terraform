locals {
  Project  = "learningtf"
  Location = var.location
  Environment = var.env
  ResourceGroupName = "${var.Project}-${var.location}-${var.env}"
}
