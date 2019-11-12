data "null_data_source" "debug_outputs" {
  count = "${var.enable_debug == "true" ? 1 : 0}"

  inputs = "${map(
        "remote_state_storage_account_name", var.storage_account_name,
        "remote_state_storage_account_access_key", var.storage_account_access_key,
        "remote_state_key", var.key,
        "remote_state_container_name", var.container_name,
        "remote_state_resource_group_name", var.resource_group_name
    )}"
}

output "debug_config" {
  value = "${data.null_data_source.debug_outputs.inputs}"
}
