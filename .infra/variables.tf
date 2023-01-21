variable "nome" {
  type        = string
  description = "Nome do App Service"
  default     = "mobead"
}

variable "docker_container_registry" {
  type        = string
  description = "Registry"
  default     = "registry.hub.docker.com"
}
variable "docker_container_name" {
  type        = string
  description = "Imagem"
  default     = "junioraraujo/unyleya_projeto_cicd_valdecy"
}
variable "docker_container_tag" {
  type        = string
  description = "Tag"
  default     = "58"
}

variable "location" {
  default = "West Europe"
}