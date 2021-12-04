function Get-Module-Installation-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $ModuleName,

    [Parameter(Position = 1, Mandatory = $FALSE)]
    [string]
    $ModuleMinimumVersion
  )

  try {
    if (-not ([string]::IsNullOrEmpty($ModuleMinimumVersion))) {
      if ((Get-Module -ListAvailable -Name $ModuleName).Version -ge $ModuleMinimumVersion) {
        return $TRUE;
      }
      return $FALSE;
    }

    if (Get-Module -ListAvailable -Name $ModuleName) {
      return $TRUE;
    }
    else {
      return $FALSE;
    }
  }
  catch [Exception] {
    return $FALSE;
  }
}

function Get-PackageProvider-Installation-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $PackageProviderName
  )

  try {
    Get-PackageProvider -Name $PackageProviderName;
    return $TRUE;
  }
  catch [Exception] {
    return $FALSE;
  }
}

function Set-Configuration-File {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $DotfilesConfigFile,

    [Parameter( Position = 1, Mandatory = $TRUE)]
    [String]
    $ComputerName,
    
    [Parameter( Position = 2, Mandatory = $TRUE)]
    [String]
    $GitUserName,
    
    [Parameter( Position = 3, Mandatory = $TRUE)]
    [String]
    $GitUserEmail,

    [Parameter( Position = 4, Mandatory = $TRUE)]
    [String]
    $WorkspaceDisk
  )

  if (-not (Test-Path -Path $DotfilesConfigFile)) {
    Write-Host "Creating config.json file:" -ForegroundColor "Green";
    $ConfigJsonBody = [PSCustomObject]@{
      ComputerName  = $ComputerName
      GitUserName   = $GitUserName
      GitUserEmail  = $GitUserEmail
      WorkspaceDisk = $WorkspaceDisk
    };

    Set-Content -Path $DotfilesConfigFile -Value ($ConfigJsonBody | ConvertTo-Json);

    Write-Host "config.json file successfully created." -ForegroundColor "Green";
  }
}

function Get-Configuration-File {
  [CmdletBinding()]
  param (
    [Parameter( Position = 0, Mandatory = $TRUE)]
    [String]
    $DotfilesConfigFile
  )
  
  $Config = @{};
  $ConfigContent = Get-Content $DotfilesConfigFile | ConvertFrom-Json;

  Write-Host "Reading config.json file:" -ForegroundColor "Green";

  foreach ($Property in $ConfigContent.PSObject.Properties) {
    $Config[$Property.Name] = $Property.Value;
  }
  
  Write-Host "config.json contains:" -ForegroundColor "Green";
  Write-Host -ForegroundColor "Green" ($Config | Out-String);

  return $Config;
}

function Get-PSRepository-Trusted-Status {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $PSRepositoryName
  )

  try {
    if (-not (Get-PSRepository -Name $PSRepositoryName -ErrorAction SilentlyContinue)) {
      return $FALSE;
    }

    if ((Get-PSRepository -Name $PSRepositoryName).InstallationPolicy -eq "Trusted") {
      return $TRUE;
    }
    return $FALSE;
  }
  catch [Exception] {
    return $FALSE;
  }
}

function Register-DotfilesScript-As-RunOnce() {
  $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce";
  $ScriptName = "DotfilesScript";
  $DotfilesMainScriptPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "setup.ps1";

  if (-not (Test-PathRegistryKey $RegPath $ScriptName)) {
    New-ItemProperty -Path $RegPath -Name $ScriptName -PropertyType String -Value "powershell ${DotfilesMainScriptPath}";
  }
}

function Remove-DotfilesScript-From-RunOnce() {
  $RegPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce";
  $ScriptName = "DotfilesScript";

  if (Test-PathRegistryKey $RegPath $ScriptName) {
    Remove-ItemProperty -Path $RegPath -Name $ScriptName;
  }
}

