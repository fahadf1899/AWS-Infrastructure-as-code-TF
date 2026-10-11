variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "instance_id" {
  description = "The ID of the instance to monitor."
  type        = string
}

variable "cpu_threshold" {
  description = "The CPU utilization threshold percentage to trigger the alarm."
  type        = number
  default     = 80
}

