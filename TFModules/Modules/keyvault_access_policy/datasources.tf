
// Removed since the SPN used by the Insight ADO service connection can't read AD.

// https://www.terraform.io/docs/providers/azuread/d/user.html
// data "azuread_user" "list" {
//   count = length(var.user_email_list)

//   user_principal_name = var.user_email_list[count.index]
// }
