resource "azurerm_resource_group_template_deployment" "adfpipeline" {
  name                = "${var.assetname}-Terraform.Deployment-adfpipeline"
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
    "dataset_sftp_folderPath" = {
      value = var.adfdssftpfolderpath
    },
    "dataset_source_container" = {
      value = var.adfdscontainername
    }                
  })
  template_content = file("pipeline.json")

  tags = {
    trigger = "002"
  }

  depends_on = [
    azurerm_data_factory_linked_service_azure_blob_storage.backup_storage,
    azurerm_resource_group_template_deployment.adflssftpsvc,    
    azurerm_data_factory_dataset_azure_blob.asset_backup,
    azurerm_resource_group_template_deployment.adfdssftpsvc
  ] 
}