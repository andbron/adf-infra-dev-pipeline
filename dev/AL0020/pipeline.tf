resource "azurerm_resource_group_template_deployment" "AL0020-pipeline" {
  name                = "deploy_pipeline_AL0020"
  resource_group_name = azurerm_resource_group.adf-dev.name
  deployment_mode     = "Incremental"
  parameters_content = jsonencode({
    "factoryName" = {
      value = var.mctadfname
    },
    "assetName" = {
      value = var.assetname
    },
    "sftp_svc" = {
      value = var.adflssftp
    },
    "linksvc_sftp_folderPath" = {
      value = var.adfdssftpfolderpath
    }          
  })
  template_content = file("AL0020-pipeline.json")

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