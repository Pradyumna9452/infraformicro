data "azurerm_mssql_server" "dataserver" {
  name                = var.dataname
  resource_group_name = var.rg
}
