
# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = "myvpc"
}
# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "vpc_availability_zones" {
  description = "VPC AZs"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}
# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC public subnet"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC private subnet"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}
#VPC Private Subnets
variable "vpc_database_subnets" {
  description = "VPC database subnet"
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type        = bool
  default     = true
}

# VPC Create DatabaseRoute Table  (True / False)
variable "vpc_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type        = bool
  default     = true
}
# VPC Enable NAT Gateway (True or False)
variable "enable_nat_gateway" {
  description = "VPC enable NAT gateway"
  type        = bool
  default     = true

}

# VPC Enable Single NAT Gateway (True or False)
variable "single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type        = bool
  default     = true

}
