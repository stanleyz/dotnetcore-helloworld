resource "azurerm_resource_group" "helloworld" {
  name     = "helloworld-rg"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "helloworld" {
  name                = "hellowrld-app-service-plan"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.helloworld.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "helloworld" {
  name                = "hellowrld-app-service"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.helloworld.name}"
  app_service_plan_id = "{$azrerm_app_service_plan.helloworld.id}"
}

resource "azurerm_app_service_slot" "dev" {
  name                = "helloworld-dev-slot"
  app_service_name    = "${azurerm_app_service.helloworld.name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.helloworld.name}"
  app_service_plan_id = "${azurerm_app_service_plan.helloworld.id}"
}

resource "azurerm_app_service_slot" "prod" {
  name                = "helloworld-prod-slot"
  app_service_name    = "${azurerm_app_service.helloworld.name}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.helloworld.name}"
  app_service_plan_id = "${azurerm_app_service_plan.helloworld.id}"
}

resource "azurerm_stroage_account" "helloworld" {
  name                     = "containerdata001"
  resource_group_name      = "${azurerm_resource_group.helloworld.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_container_registry" "helloworld" {
  name                = "containerregistray001"
  resource_group_name = "${azurerm_resource_group.name}"
  location            = "${var.location}"
  admin_enabled       = true
  sku                 = "Classic"
  storage_account_id  = "${azurerm_stroage_account.helloworld.id}"
}
