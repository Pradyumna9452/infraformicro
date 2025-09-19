resource "azurerm_mssql_database" "test" {
  name           = var.sql_database
  server_id      = data.azurerm_mssql_server.dataserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 2

  read_scale     = false
  sku_name       = "S0"
  zone_redundant = false
  
}