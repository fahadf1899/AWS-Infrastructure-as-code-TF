output "alarm_name" {
  description = "Name of the CloudWatch CPU alarm."
  value       = aws_cloudwatch_metric_alarm.cpu_alarm.alarm_name
}
