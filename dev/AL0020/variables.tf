variable "assetrgname" {
  type    = string
  default = "my-al-AL0020-rg"
}

variable "mctadfrgname" {
  type    = string
  default = "my-al-adf-dev-rg"
}

//variable "location" {
//  type    = string
//  default = "Australia East"
//}

variable "akvname" {
  type    = string
  default = "myal-adfkeyvault"
}

//variable "storagefromname" {
//  type    = string
//  default = "myaladfstor001"
//}



########################################



//variable "adflsblobfrom" {
//  type    = string
//  default = "AL0050_storage_from"
//}

//variable "adflsakv" {
//  type    = string
//  default = "akv_svc"
//}

########################################

variable "mctadfname" {
  type    = string
  default = "my-al-adf-dev"
}

variable "assetname" {
  type    = string
  default = "al0020"
}

variable "akvsftpsecretkey" {
  type    = string
  default = "secret-sftp"
}

variable "storageuri" {
  type    = string
  default = "https://myal0020stor01.blob.core.windows.net/"
}

variable "adflssftp" {
  type    = string
  default = "sftp_svc"
}

variable "adflssftphost" {
  type    = string
  default = "20.193.45.127"
}

variable "adfdscontainername" {
  type    = string
  default = "backup"
}

variable "adfdssftpfolderpath" {
  type    = string
  default = "/sftpfileshare01"
}