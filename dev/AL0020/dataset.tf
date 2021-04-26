resource "azurerm_data_factory_dataset_azure_blob" "asset_backup" {
  name                = "${var.assetname}_blob_${var.adfdscontainername}"
  resource_group_name = data.azurerm_resource_group.mctadf-rgname.name
  data_factory_name   = data.azurerm_data_factory.mctadf.name
  linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.backup_storage.name

  path     = var.adfdscontainername
  filename = "*"
}

resource "azurerm_resource_group_template_deployment" "adfdssftpsvc" {
  name                = "${var.assetname}-Terraform.Deployment-adfdssftpsvc"
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
    "linksvc_sftp_folderPath" = {
      value = var.adfdssftpfolderpath
    }    
  })
  template_content = file("dataset-sftpsvc.json")
}