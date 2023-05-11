---
description: This template creates an Azure Stack HCI Image from an Azure Marketplace Gallery Image. 
page_type: sample
products:
- azure
- azure-resource-manager
urlFragment: hci-image-from-marketplace
languages:
- json
- bicep
---
# Create an image from the Azure Marketplace

This template allows you to deploy a new Azure Stack HCI Image from the referenced Azure Marketplace image. See [Azure Stack HCI Images](/azure-stack/hci/manage/virtual-machine-image-azure-marketplace)

In order to deploy this template, there must be an operational ARC Resource Bridge associated with your Azure Stack HCI cluster. Further, the Custom Location resource must be deployed before running this template. The Custom Location is a resource representing your Azure Stack HCI Cluster in Azure. 

> [!NOTE]
> For simplicity, this template assumes the Custom Location resides in the same Resource Group as where the Image is being created. 

`Tags: Microsoft.AzureStackHCI/marketplacegalleryimages`