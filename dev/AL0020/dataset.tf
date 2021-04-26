resource "azurerm_data_factory_dataset_azure_blob" "asset_backup" {
  name                = "${var.assetname}_blob_from"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.id
  data_factory_name   = azurerm_data_factory.adf-dev.name
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.backup_storage.name

  path     = var.adfdscontainername
  filename = ""
}

resource "azurerm_resource_group_template_deployment" "adfdssftpsvc" {
  name                = "deploy_dataset_sftp"
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
    "linksvc_sftp_folderPath" = {
      value = var.adfdssftpfolderpath
    }    
  })
  template_content = file("AL0020-dataset-sftpsvc.json")
}