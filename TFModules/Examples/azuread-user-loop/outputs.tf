
output "alladmindata" {
  value = data.azuread_user.admin
}

output "admin_object_ids" {
  value = data.azuread_user.admin.*.id
}