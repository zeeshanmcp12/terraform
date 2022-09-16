output "name" {
  value = module.rg.name

}

output "id" {
  value = module.rg.id

}

output "sa_name" {
  value = module.storageAccount.name
}

output "access_key" {
  value     = module.storageAccount.access_key
  sensitive = true

}