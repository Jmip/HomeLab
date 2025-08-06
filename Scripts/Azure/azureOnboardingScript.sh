
export subscriptionId="c8201c89-c63d-40e6-af22-afa31cd85dec";
export resourceGroup="AzureLab";
export tenantId="ac325f91-1dca-4031-bd74-e9d336528403";
export location="germanywestcentral";
export authType="token";
export correlationId="24e48c31-64b2-4f9c-af66-a86c173e6ecb";
export cloud="AzureCloud";


# Download the installation package
LINUX_INSTALL_SCRIPT="/tmp/install_linux_azcmagent.sh"
if [ -f "$LINUX_INSTALL_SCRIPT" ]; then rm -f "$LINUX_INSTALL_SCRIPT"; fi;
output=$(wget https://gbl.his.arc.azure.com/azcmagent-linux -O "$LINUX_INSTALL_SCRIPT" 2>&1);
if [ $? != 0 ]; then wget -qO- --method=PUT --body-data="{\"subscriptionId\":\"$subscriptionId\",\"resourceGroup\":\"$resourceGroup\",\"tenantId\":\"$tenantId\",\"location\":\"$location\",\"correlationId\":\"$correlationId\",\"authType\":\"$authType\",\"operation\":\"onboarding\",\"messageType\":\"DownloadScriptFailed\",\"message\":\"$output\"}" "https://gbl.his.arc.azure.com/log" &> /dev/null || true; fi;
echo "$output";

# Install the hybrid agent
bash "$LINUX_INSTALL_SCRIPT";
sleep 5;

# Run connect command
sudo azcmagent connect --resource-group "$resourceGroup" --tenant-id "$tenantId" --location "$location" --subscription-id "$subscriptionId" --cloud "$cloud" --private-link-scope "/subscriptions/c8201c89-c63d-40e6-af22-afa31cd85dec/resourceGroups/AzureLab/providers/Microsoft.HybridCompute/privateLinkScopes/AzureLabPrivateLink" --correlation-id "$correlationId";
