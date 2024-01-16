module "eks" {
  source                   = "./modules/k8s"
  cluster_name             = var.eks_cluster_name
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.public_subnets
}

data "aws_availability_zones" "available" {
  state           = "available"
}

module "vpc" {
  source          = "./modules/vpc"
  name            = var.vpc_name
  cidr            = var.cidr
  azs             = data.aws_availability_zones.available.names
  private_subnets = var.private_subnet_cidrs
  public_subnets  = var.public_subnet_cidrs

  enable_nat_gateway = var.enable_nat_gateway
}

resource "aws_s3_bucket" "this" {
  bucket        = var.resources_name
  force_destroy = true
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  rule {
    id     = "standard-rule"
    status = "Enabled"

    transition {
      days          = 30
      storage_class = var.storage_class
    }
  }

  bucket = aws_s3_bucket.this.id
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_guardduty_detector" "this" {
  enable = true
}

resource "aws_db_instance" "app-dab" {
  allocated_storage    = 10
  db_name              = var.db_name
  engine               = var.database_type
  engine_version       = var.engine_version
  instance_class       = var.instance_type
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  storage_encrypted    = true
}

