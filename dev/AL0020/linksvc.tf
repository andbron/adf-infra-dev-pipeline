


resource "azurerm_data_factory_linked_service_azure_blob_storage" "backup_storage" {
  name                = "${var.assetname}_blob_backup"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.id
  data_factory_name   = azurerm_data_factory.adf-dev.name
  service_endpoint   = var.storageuri
  use_managed_identity = true
}




resource "azurerm_resource_group_template_deployment" "adflssftpsvc" {
  name                = "deploy_sftpsvc"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.id
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
  template_content = file("AL0020-linksvc-sftpsvc.json")
}




