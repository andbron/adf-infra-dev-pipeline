provider "azurerm" {

  features {}
}

data "azurerm_resource_group" "asset-rgname" {
  name = var.assetrgname
}

data "azurerm_resource_group" "mctadf-rgname" {
  name = var.mctadfrgname
}

data "azurerm_data_factory" "mctadf" {
  name                = var.mctadfname
  resource_group_name = var.mctadfrgname
}

data "azurerm_key_vault" "mctadfakv" {
  name                = var.akvname
  resource_group_name = var.mctadfrgname
}

resource "azurerm_key_vault_secret" "sftp" {
  name         = "${var.assetname}-${var.akvsftpsecretkey}"
  value        = base64encode(file("ssh_sftp_rsa+key"))
  key_vault_id = dat.azurerm_key_vault.mctadfakv.id
}