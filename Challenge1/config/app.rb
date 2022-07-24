# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|
  if Terraspace.env == "prod"
    config.all.exclude_stacks = ["az_network_preprod", "az_network", "az_aks_dev"]
  elsif Terraspace.env == "preprod"
    config.all.exclude_stacks = ["az_network_prod", "az_network" "az_aks_dev"]
  else
    config.all.exclude_stacks = ["az_network_preprod", "az_network_prod", "az_aks"]
  end
end

Terraspace.configure do |config|
  config.logger.level = :info
end

# Terraspace.configure do |config|
#   logger = Logger.new($stdout)
#   logger.level = :debug
#   config.logger = logger
# end
