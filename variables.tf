# we're using uppercase variable names, since in some cases (e.g Azure DevOps) the system variables are forced to be uppercase
# TF allows providing variable values as env variables of name name, case sensitive

variable "BTP_KYMA_PLAN" {
  type        = string
  description = "Plan name"
  default     = "azure"
}

variable "BTP_USE_SUBACCOUNT_ID" {
  type        = string
  description = "Subaccount name"
  default     = null
}


variable "BTP_NEW_SUBACCOUNT_NAME" {
  type        = string
  description = "Subaccount name"
  default     = null
}

variable "BTP_NEW_SUBACCOUNT_REGION" {
  type        = string
  description = "Region name"
  default     = "eu20"
}

variable "BTP_KYMA_CUSTOM_OIDC" {
  type = object({
    clientID = string
    issuerURL = string
    usernameClaim = string
    usernamePrefix = string
    groupsClaim = string
    signingAlgs      = list(string)
    requiredClaims = list(string)
  })
  default = null
}

variable "BTP_KYMA_CUSTOM_ADMINISTRATORS" {
  type    = list(string)
  description = "List of users (sub) of the custom OIDC that should become cluster-admins"
  default = []
}

variable "BTP_KYMA_REGION" {
  type        = string
  description = "Kyma region"
  default     = "westeurope"
}

variable "BTP_BACKEND_URL" {
  type        = string
  description = "Backend URL for BTP API; defaults to https://cli.btp.cloud.sap"
  default = "https://cli.btp.cloud.sap"
}

variable "BTP_KYMA_MODULES" {
  type = list(object({
    name = string
    channel = string
  }))
  default = [
    {
      name = "istio"
      channel = "fast"
    },
    {
      name = "api-gateway"
      channel = "fast"
    },
    {
      name = "btp-operator"
      channel = "fast"
    }
  ]
  description = "The list of kyma modules to install"
}

variable "BTP_KYMA_AUTOSCALER_MIN" {
  type = number
  default = 3
}

variable "BTP_KYMA_AUTOSCALER_MAX" {
  type = number
  default = 10
}

