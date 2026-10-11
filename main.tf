module "cpu_alarm" {
    source = "./modules/cpu_alarm"
    instance_id = var.instance_id
    cpu_threshold = var.cpu_threshold
}
