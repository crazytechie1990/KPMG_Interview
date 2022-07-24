TerraspacePluginAzurerm.configure do |config|
    config.auto_create = true # set to false to completely disable auto creation
    config.location    = "westeurope"
    config.resource_group.update_existing = true
  
    config.storage_account.sku.name = "Standard_LRS"
    config.storage_account.sku.tier = "Standard"
  
    config.storage_account.update_existing = true
    config.storage_account.allow_blob_public_access = true
  
    # data protection management
    config.storage_account.configure_data_protection_for_existing = false
    config.storage_account.delete_retention_policy.days = 365
    config.storage_account.delete_retention_policy.enabled = true
    config.storage_account.is_versioning_enabled = true
  
    config.tags = {env: Terraspace.env, terraspace: true}
  end