module "service_llm" {
  source = "./search_llm"
}

module "service_search_engine" {
  source = "./search_engine"
}

module "service_test_database" {
  source = "./test_database"
}

module "service_search_gateway" {
  source = "./search_gateway"
}