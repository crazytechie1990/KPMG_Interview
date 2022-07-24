<!-- BEGIN_TF_DOCS -->

## Requirements

The following requirements are needed by this code :

- `<a name="requirement_terraspace"></a>` [terraform](#requirement\_terraform) (>= 1.1.5)
- `<a name="requirement_azurerm"></a>` [azurerm](#requirement\_azurerm) (>= 2.0)
- `<a name="requirement_hashicorp/helm"></a>` [hashicorp/helm](#requirement\_helm) (>= 2.4.1)

## Providers

The following terraform providers are used by this module:

- `<a name="provider_azurerm"></a>` [azurerm](#provider\_azurerm) (>= 2.0)
- `<a name="provider_hashicorp/helm"></a>` [hashicorp/helm](#requirement\_helm) (>= 2.4.1)

## Terraform State Files

Pipeline is coded to store all the state files in the Spoke. For productions efforts will be made to use the standard IMS solution for storing state files.
Efforts has been made to split the state files well so for the components that will be build by the DT Application team have straight access to existing state files.

## Modules

SharedInfra modules are used for creation of below resources :

- Azure Kubernetes Services
- Azure Private Endpoints
- Azure Networking
- Azure Event Hub
- Azure Storage
- Azure Key Vault
- Azure Container Registry

## Pipeline

At present all the components can be deployed using Pipeline. No manula intervention should be needed as of yet.
Run the terraform.yml Pipeline against the right subsriptions when needed.

## Future Scope

Work will be done for refactoring and testing in future releases. Due to time crunch only few deployment standards could be followed.

## Build Agents

Self hosted agents are built in HUB as they need using ACI.
Please see the pipeline terraform.yml as an example for how to consume the shared code for build agents.

Below is the shared code for the build agents.

#### https://sita-pse.visualstudio.com/SharedInfra/_git/azdo_pipeline_templates?path=/terraform/azr/tfazr_pipetemplate.yml

<!-- END_TF_DOCS -->
