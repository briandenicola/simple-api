param location string = resourceGroup().location
param environmentName string = 'env-${uniqueString(resourceGroup().id)}'

var appName = 'simple-app'
var appImage = 'docker.io/bjd145/simple:3782de81'
var appPort = 5501

module environment 'environment.bicep' = {
  name: 'container-app-environment'
  params: {
    environmentName: environmentName
    location: location
  }
}

module appService 'container-app.bicep' = {
  name: appName
  params: {
    location: location
    containerAppName: appName
    environmentId: environment.outputs.environmentId
    containerImage: appImage
    containerPort: appPort
    isExternalIngress: true
    minReplicas: 0
  }
}

output fqdn string = appService.outputs.fqdn
