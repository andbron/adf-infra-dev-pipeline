locals {
  assetrgname = var.assetrgname
  mctadfrgname = var.mctadfrgname
  akvname = var.akvname
  mctadfname = var.mctadfname
  assetname = var.assetname
  akvsftpsecretkey = var.akvsftpsecretkey
  storageuri = var.storageuri
  adflssftp = var.adflssftp
  adflssftphost = var.adflssftphost
  adfdscontainername = var.adfdscontainername
  adfdssftpfolderpath = var.adfdssftpfolderpath
}
module mctadf-onboarding {
  source         = "../../Module"
  assetrgname = local.assetrgname
  mctadfrgname = local.mctadfrgname
  akvname = local.akvname
  mctadfname = local.mctadfname
  assetname = local.assetname
  akvsftpsecretkey = local.akvsftpsecretkey
  storageuri = local.storageuri
  adflssftp = local.adflssftp
  adflssftphost = local.adflssftphost
  adfdscontainername = local.adfdscontainername
  adfdssftpfolderpath = local.adfdssftpfolderpath
}


