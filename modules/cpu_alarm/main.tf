variable "alarm_actions" {
  description = "List of CloudWatch alarm actions to trigger when the alarm state changes."
  type        = list(string)
  default     = []
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "${var.instance_id}-high-cpu"
  alarm_description   = "Triggers when average CPU utilization exceeds ${var.cpu_threshold}% for ${var.evaluation_periods} consecutive ${var.period}-second periods."
  namespace           = "AWS/EC2"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.cpu_threshold
  period              = var.period
  evaluation_periods  = var.evaluation_periods
  treat_missing_data  = "notBreaching"
  alarm_actions       = var.alarm_actions

  dimensions = {
    InstanceId = var.instance_id
  }
}