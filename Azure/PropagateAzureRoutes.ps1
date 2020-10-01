Connect-AzAccount
#stores IPs from one txt file and names from another that are in respective order
$IP = Get-Content -Path 'C:\Scripts\Azure\RoutesIP.txt'
$Name = Get-Content -Path 'C:\Scripts\Azure\RoutesName.txt'

#creates a route in the routing table for each ip & name pair to connect via the virtual appliance
for ($i=0; $i -le $IP.count; $i++){
Get-AzRouteTable | Add-AzRouteConfig -Name $Name[$i] -AddressPrefix $IP[$i] -NextHopType VirtualAppliance -NextHopIpAddress 'VIRTUALAPPLIANCEIPADDRESS' | Set-AzRouteTable
}
