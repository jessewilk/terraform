locals {
  arm_parameters = {
    "storageAccountName" = var.storage_name
  }

  path_abs = abspath("../../ARMTemplates/${var.arm_template_file_name}")

}