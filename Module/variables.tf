variable "assetrgname" {
  type    = string
  description = "Asset Resource Group Name"
}

variable "mctadfrgname" {
  type    = string
  description = "MCTADF Resource Group Name"
}

variable "akvname" {
  type    = string
  description = "MCTADF Key Vault hosting SSH private key"
}

variable "mctadfname" {
  type    = string
  description = "MCTADF Data Factory Name"
}

variable "assetname" {
  type    = string
  description = "Asset Id - MUST USE LOWERCASE"
}

variable "akvsftpsecretkey" {
  type    = string
  description = "Name of KV SFTP secret"
}

variable "storageuri" {
  type    = string
  description = "Storage Account Endpoint hosting Backups"
}

variable "adflssftp" {
  type    = string
  description = "ADF Linked Service - SFTP"
}

variable "adflssftphost" {
  type    = string
  description = "SFTP Hostname"
}

variable "adfdscontainername" {
  type    = string
  description = "Asset Storage Account Container Name"
}

variable "adfdssftpfolderpath" {
  type    = string
  description = "SFTP Folder Path"
}