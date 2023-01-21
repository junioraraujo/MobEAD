provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "modead_rg" {
  name     = "${var.nome}-rg"
  location = var.location
}

resource "azurerm_service_plan" "modead_sp" {
  name                = "${var.nome}-sp"
  location            = azurerm_resource_group.modead_rg.location
  resource_group_name = azurerm_resource_group.modead_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_windows_web_app" "modead" {
  name                = "${var.nome}-app"
  location            = azurerm_resource_group.modead_rg.location
  resource_group_name = azurerm_resource_group.modead_rg.name
  service_plan_id     = azurerm_service_plan.modead_sp.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    DOCKER_REGISTRY_SERVER_USERNAME     = ""
    DOCKER_REGISTRY_SERVER_PASSWORD     = ""
    DOCKER_REGISTRY_SERVER_URL          = var.docker_container_registry
    WEBSITES_PORT                       = 80
  }

  site_config {
    application_stack {
      docker_container_registry = var.docker_container_registry
      docker_container_name     = var.docker_container_name
      docker_container_tag      = var.docker_container_tag
    }
  }
}