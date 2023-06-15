## Platform - K8S Variables ##
variable "eks_cluster_name" {
  default     = "palo-dev-infr-eks"
  description = "The name of EKS cluster"
}

## Networking - VPC Variables ##
variable "vpc_name" {
  type        = string
  default     = "palo-dev-infr-vpc"
  description = "Name of the VPC"
}
variable "cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}
variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "List of CIDR blocks for the private subnets"
}
variable "public_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
  description = "List of CIDR blocks for the public subnets"
}
variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Flag to enable NAT gateway in the VPC"
}

## Storage - S3 Variables ##
variable "bucket_name" {
  type    = string
  default = "palo-dev-infr-bucket"
  description = "Name of the Storage"
}
variable "resources_name" {
  type    = string
  default = "palo-dev-infr-resources"
  description = "Name of the Resources"
}
variable "storage_class" {
  type    = string
  default = "STANDARD_IA"
  description = "Storage Class Type"
}
variable "acl" {
  type    = string
  default = "private"
  description = "Access Control List"
}

## Security - Policy Variables ##

## Database - RDS Variables ##
variable "db_username" {
  default     = "admin"
  description = "The password for the RDS instance"
  sensitive   = true
}
variable "db_password" {
  default     = "TAv7FrKCKna9"
  description = "The password for the RDS instance"
  sensitive   = true
}
variable "db_name" {
  default     = "palo-dev-infr-db"
  description = "The Name of your database"
}
variable "database_type" {
  default     = "mysql"
  description = "The Engine type"
}
variable "engine_version" {
  default     = "5.7"
  description = "The engine version"
}
variable "instance_type" {
  default     = "db.t3.micro"
  description = "Database Instance size"
}

