@description('The default location for all supported resources.')
param location string = 'centralus'

@description('Location for the Static Web App (must be a supported region).')
param staticWebLocation string = 'centralus'

@description('Base name used for naming resources.')
param baseName string = 'naestack'

var uniqueId = uniqueString(resourceGroup().id)
var appServicePlanName = '${baseName}-plan-${uniqueId}'
var functionAppName = '${baseName}-func-${uniqueId}'
var staticWebAppName = '${baseName}-web-${uniqueId}'
var cosmosName = toLower('${baseName}-cosmos-${uniqueId}')
var keyVaultName = toLower('${baseName}-kv-${uniqueId}')
var dbName = 'naestack'
var containerName = 'configs'

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
  dependsOn: [plan]
}

resource staticWeb 'Microsoft.Web/staticSites@2023-01-01' = {
  name: staticWebAppName
  location: staticWebLocation
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

resource cosmosDb 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: cosmosName
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
    consistencyPolicy: {
      defaultConsistencyLevel: 'Session'
    }
  }
}

resource cosmosDbSqlDb 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  name: '${cosmosDb.name}/${dbName}'
  properties: {
    resource: {
      id: dbName
    }
  }
  dependsOn: [
    cosmosDb
  ]
}

resource cosmosContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  name: '${cosmosDb.name}/${dbName}/${containerName}'
  properties: {
    resource: {
      id: containerName
      partitionKey: {
        paths: ['/resourceType']
        kind: 'Hash'
      }
    }
  }
  dependsOn: [
    cosmosDbSqlDb
  ]
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

output cosmosEndpoint string = cosmosDb.properties.documentEndpoint
