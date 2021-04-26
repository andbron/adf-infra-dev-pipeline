resource "azurerm_data_factory_linked_service_azure_blob_storage" "backup_storage" {
  name                = "${var.assetname}_blob_backup"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.name
  data_factory_name   = data.azurerm_data_factory.mctadf.name
  service_endpoint   = var.storageuri
  use_managed_identity = true
}

resource "azurerm_resource_group_template_deployment" "adflssftpsvc" {
  name                = "${var.assetname}-Terraform.Deployment-adflssftpsvc"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "factoryName" = {
      value = var.mctadfname
    },
    "assetName" = {
      value = var.assetname
    },
    "linksvc_sftp" = {
      value = var.adflssftp
    },
    "linksvc_sftp_host" = {
      value = var.adflssftphost
    },
    "linksvc_sftp_secret_name" = {
      value = var.akvsftpsecretkey
    }      
  })
  template_content = file("linksvc-sftpsvc.json")
  depends_on = [
    azurerm_key_vault_secret.sftp
  ]
}




