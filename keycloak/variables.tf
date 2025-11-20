variable "namespace" {
  type    = string
  default = "smart-search"
}

# ---- Database ----
variable "db_host" {
  type    = string
  default = "keycloak-database-service.smart-search.svc.cluster.local"
}

variable "db_port" {
  type    = number
  default = 5432
}

variable "db_user" {
  type    = string
  default = "keycloak"
}

variable "db_password" {
  type    = string
  default = "keycloak_pwd"
}

# ---- Realm and client ----
variable "realm_name" {
  type    = string
  default = "smart-search"
}

variable "client_id" {
  type    = string
  default = "search-gateway"
}

variable "client_secret" {
  type    = string
  default = "v0O36ZmVqPBoXYFc16mcMHmDaYDvpFZu"
}

# ---- Admin account ----
variable "admin_user" {
  type    = string
  default = "admin"
}

variable "admin_password" {
  type    = string
  default = "adminpassword"
}
