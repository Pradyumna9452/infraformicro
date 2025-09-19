module "rg_m" {
    source = "../../module/azurerm_resource_group"
    name = "rg_mith_prod"
    location = "central india"
}
module "pip_m" {
  depends_on = [ module.rg_m ]
  source = "../../module/azurerm_public_ip"
  name = "pip_ip"
  rg = "rg_mith_prod"
  location = "central india"
}
module "sqlserver_m" {
    depends_on = [ module.rg_m ]
    source = "../../module/azurerm_sql_server"
    sql_server_name = "mithlesh"
    sql_location = "central india"
    administrator_login = "Pradyumna"
    administrator_login_password = "S3cur3P@ssw0rd!"
    rg = "rg_mith_prod"
  }

module "module_sql_database" {
    depends_on = [ module.sqlserver_m ]
    source = "../../module/azurerm_sql_data_base"
    sql_database = "rahul"
    dataname = "mithlesh"
    rg = "rg_mith_prod"
  
}
module "module_cluster" {
    depends_on = [ module.rg_m ]
    source = "../../module/azurerm_kubernets_cluster"
    cluster_name = "k8name"
    cluster_location = "central india"
    resource_group_name = "rg_mith_prod"
    dns_prefix = "kubernets"
    pool_name = "k8bnaliya"
    node_count = "1"
}
module "acr_m" {
  depends_on = [ module.rg_m ]
  source = "../../module/azurerm_container_registry"
  rg_name = "rg_mith_prod"
  registry_location = "central india"
}
module "stg_m" {
  depends_on = [ module.rg_m ]
  source = "../../module/azurerm_storage_account"
  name = "stgjivahello1"
  rg = "rg_mith_prod"
  location = "central india"
  
}