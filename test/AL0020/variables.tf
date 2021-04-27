variable "assetrgname" {
  type    = string
  default = "my-al-AL0020-tst-rg"
}

variable "mctadfrgname" {
  type    = string
  default = "my-al-adf-tst-rg"
}

variable "akvname" {
  type    = string
  default = "myal-adfkeyvault-tst"
}

variable "mctadfname" {
  type    = string
  default = "my-al-adf-tst"
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
  default = "https://myal0020stor01t.blob.core.windows.net/"
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