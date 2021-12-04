# Get-AppxPackage *yourphone* | Remove-AppxPackage
# Get-AppxPackage *photos* | Remove-AppxPackage
# Get-AppxPackage *onenote* | Remove-AppxPackage
# Get-AppxPackage *people* | Remove-AppxPackage
# Get-AppxPackage *officehub* | Remove-AppxPackage
# Get-AppxPackage Microsoft.WindowsMaps | Remove-AppxPackage
# Get-AppxPackage Microsoft.WindowsAlarms | Remove-AppxPackage
# Get-AppxPackage Microsoft.OneDriveSync | Remove-AppxPackage
# Get-AppxPackage Microsoft.GetHelp | Remove-AppxPackage



# Get-Module -ListAvailable
# Get-WindowsOptionalFeature -Online
# Get-WindowsPackage -Path "c:\offline"

Disable-WindowsFeature "Internet-Explorer-Optional-amd64" "Internet Explorer";
# Disable-WindowsFeature "Printing-XPSServices-Features" "Microsoft XPS Document Writer";
Disable-WindowsFeature "WorkFolders-Client" "WorkFolders-Client";
# Disable-WindowsFeature "WindowsMediaPlayer" "Windows Media Player";
Enable-WindowsFeature "Containers-DisposableClientVM" "Windows Sandbox";

Uninstall-AppPackage "Microsoft.Getstarted";
Uninstall-AppPackage "Microsoft.GetHelp";
Uninstall-AppPackage "Microsoft.WindowsFeedbackHub";
Uninstall-AppPackage "Microsoft.MicrosoftSolitaireCollection";

Set-WindowsExplorer-ShowFileExtensions;
Set-WindowsFileExplorer-StartFolder;
Set-Multitasking-Configuration;
Set-Classic-ContextMenu-Configuration;
Set-SetAsBackground-To-Extended-ContextMenu;
Disable-RecentlyOpenedItems-From-JumpList;
Set-Power-Configuration;
Set-Custom-Regional-Format;
Rename-PC;