variable "instance_id" {
  description = "The ID of the instance to monitor."
  type        = string
}

variable "cpu_threshold" {
  description = "The CPU utilization threshold percentage to trigger the alarm."
  type        = number
  default     = 80
  validation {
  condition     = var.cpu_threshold >= 0 && var.cpu_threshold <= 100
  error_message = "The CPU threshold must be between 0 and 100."
  }
}

variable "period" {
  description = "The period, in seconds, over which the specified statistic is applied."
  type        = number
  default     = 300
}

variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
  default     = 2
}

