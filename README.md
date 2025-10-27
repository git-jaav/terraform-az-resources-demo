# terraform-az-resources-demo
demo to many terraform script of  azure resources

## to log into Azure (Only if you already are not):
az login
az login --tenant [TEANANT-ID]

## comandos adicionales para validar setting de cuenta AZ:
az account show
az account set --subscription  [SUBSCRIPTION-ID]

## basics terraform
terraform init
terraform plan
terraform apply

## destroy (Si resource existen en state actual de terrafomr)
terraform destroy
terraform destroy --target [RESOURCE_NAME]

## manipular state: importar y ver state
terraform import [RESOURCE_TEMP].[LABEL_RESOURCE] [RESOURCE_ID]
### ex:
terraform import azurerm_service_plan.my_demo /subscriptions/xxxxxxxxxxxxxxxxxxxxxxxxxxxx/resourceGroups/rg-demo-dev/providers/Microsoft.Web/serverFarms/my-splan-demo-dev

### validar state:
terraform state list


## =============================================================================
