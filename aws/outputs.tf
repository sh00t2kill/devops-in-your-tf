output "cluster_name" {
  value       = module.eks.cluster_name
  description = "The name of the EKS cluster"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "The private subnets you are running"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "The public subnets you are running"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The VPC you are running"
}

output "azs" {
  value       = module.vpc.azs
  description = "Your AZ's"
}

output "name" {
  value       = module.vpc.name
  description = "Your VPC name"
}

output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
  description = "The name of the S3 bucket."
}

output "bucket_acl" {
  value       = aws_s3_bucket_acl.this.acl
  description = "The ACL of the S3 bucket."
}

output "lifecycle_configuration" {
  value = {
    rules = aws_s3_bucket_lifecycle_configuration.this.rule
  }
  description = "The lifecycle configuration of the S3 bucket."
}

output "guardduty_detector_id" {
  description = "GuardDuty detector ID"
  value       = aws_guardduty_detector.this.id
}

output "db_name" {
      value       = aws_db_instance.app-dab.db_name
      description = "The name of the database"
}

output "database_type" {
      value       = aws_db_instance.app-dab.engine
      description = "The type Database running"
}

output "engine_version" {
      value       = aws_db_instance.app-dab.engine_version
      description = "Database version running"
}
