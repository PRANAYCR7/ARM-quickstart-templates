param builderIdentity string

var builderIdentityParts = split(builderIdentity, '/')
var builderIdentitySubscription = builderIdentityParts[2]
var builderIdentityResourceGroup = builderIdentityParts[4]
var builderIdentityName = last(builderIdentityParts)

resource builderIdentityResource 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' existing = {
  name: builderIdentityName
  scope: resourceGroup(builderIdentitySubscription, builderIdentityResourceGroup)
}

var storageBlobDataReaderRoleDefinitionId = resourceId(
  'Microsoft.Authorization/roleDefinitions',
  '2a2b9908-6ea1-4ae2-8e65-a410df84e7d1'
)

resource logsStorageRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(builderIdentity, storageBlobDataReaderRoleDefinitionId, subscription().id, resourceGroup().id)
  properties: {
    principalId: builderIdentityResource.properties.principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: storageBlobDataReaderRoleDefinitionId
  }
}