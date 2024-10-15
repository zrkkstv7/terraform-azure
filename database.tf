resource "azurerm_mysql_flexible_server" "mysql-server-nottaken9696" {
  name                   = "mysql-server-nottaken9696"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  administrator_login    = "adminuser"
  administrator_password = "Adm1n.passw0rd"
  sku_name               = "B_Standard_B1ms"
  version                = "8.0.21"
  backup_retention_days  = 7
  zone                   = "1"

}

resource "azurerm_mysql_flexible_database" "mysql-database" {
  name                = "mysql-database"
  resource_group_name = azurerm_resource_group.rg.name
  server_name         = azurerm_mysql_flexible_server.mysql-server-nottaken9696.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

