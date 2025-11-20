module "service_llm" {
  source = "./search_llm"
}

module "service_search_engine_database" {
  source = "./search_engine_database"
}

module "service_search_engine" {
  source = "./search_engine"
  depends_on = [ module.service_search_engine_database ]
}

module "service_test_database" {
  source = "./test_database"
}

module "service_search_gateway" {
  source = "./search_gateway"
}

module "service_keycloak_database" {
  source = "./keycloak_database"
}

module "service_keycloak" {
  source = "./keycloak"
  depends_on = [ module.service_keycloak_database ]
}