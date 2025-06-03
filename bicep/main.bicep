param location string = resourceGroup().location
param staticWebLocation string = 'eastus2' // MUST be a supported region for Microsoft.Web/staticSites
param baseName string = 'naestack'

var uniqueSuffix = uniqueString(resourceGroup().id)
var appServicePlanName = '${baseName}-plan-${uniqueSuffix}'
var functionAppName = '${baseName}-func-${uniqueSuffix}'
var staticWebAppName = '${baseName}-web-${uniqueSuffix}'
var cosmosDbAccountName = toLower('${baseName}cosmos${uniqueSuffix}')
var keyVaultName = toLower('${baseName}kv${uniqueSuffix}')

resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'Y1'
    tier: 'Dynamic'
  }
  kind: 'functionapp'
  properties: {
    reserved: true
  }
}

resource functionApp 'Microsoft.Web/sites@2022-09-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: plan.id
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
      ]
    }
  }
}

resource staticWeb 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticWebAppName
  location: staticWebLocation // ✅ FIXED REGION
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/adminscode/Naestack-AI'
    branch: 'main'
    buildProperties: {
      appLocation: '/frontend'
      apiLocation: '/backend/functions'
      outputLocation: 'build'
    }
  }
}

resource cosmos 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: cosmosDbAccountName
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}
