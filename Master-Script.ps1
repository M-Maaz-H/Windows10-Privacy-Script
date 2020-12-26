Write-Output "Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    choco install chocolatey-core.extension -y

Import-Module BitsTransfer

Write-Output "Running WPD with Recommended Settings"
    Start-BitsTransfer -Source "https://wpd.app/get/latest.zip" -Destination latest.zip
	Expand-Archive -LiteralPath .\latest.zip -DestinationPath .\latest\
    .\latest\wpd.exe -install "all" -multipleInstances -nosplash -nowarnOS -restorePoint -wfpOnly -close -pro -noappx -privacyAll -includeAdv 
    Write-Output "Done With WPD"

Write-Output "Running O&O Shutup with Recommended Settings"
    New-Item -Path '.\O2Shutup' -ItemType Directory
    Start-BitsTransfer -Source "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -Destination "$PSScriptRoot\O2Shutup\OOSU10.exe"
    # https://gist.githubusercontent.com/M-Maaz-H/7be62f5dcc4d61e74258e76bac15cd29/raw/e2806258c6bc1657dc75e32c5f19611e599cd3df/ooshutup10.cfg
    Start-BitsTransfer -Source "https://gist.githubusercontent.com/M-Maaz-H/7be62f5dcc4d61e74258e76bac15cd29/raw/e2806258c6bc1657dc75e32c5f19611e599cd3df/ooshutup10.cfg" -Destination "$PSScriptRoot\O2Shutup\ooshutup10.cfg"
    .\O2Shutup\OOSU10.exe $PSScriptRoot\O2Shutup\ooshutup10.cfg /quiet
    Write-Output "Done With O&O Shutup"
    
Write-Output "Downloading Privatezilla"
    # https://git.io/JLP5A
    Start-BitsTransfer -Source "https://www.builtbybel.com/privatezilla?task=download.send&id=33&catid=16&m=0" -Destination "$PSScriptRoot\Others\Privatezilla.exe"
    Write-Output "Downloaded --Privatezilla"

# Running Frag-Sophia Custom Script

Clear-Host

Write-Output "Downloading Custom-Frag-Sophia-Script"
    New-Item -Path '.\Frag-Sophia' -ItemType Directory
    (New-Object System.Net.WebClient).DownloadFile("https://github.com/farag2/Windows-10-Sophia-Script/releases/download/5.3.1/Sophia.v5.3.1.zip", "$PSScriptRoot\Frag-Sophia\Sophia.zip" )
    Expand-Archive -LiteralPath .\Frag-Sophia\Sophia.zip -DestinationPath .\Frag-Sophia -Force
    remove-item $PSScriptRoot\Frag-Sophia\Sophia\Sophia.ps1
    (New-Object System.Net.WebClient).DownloadFile("https://gist.githubusercontent.com/M-Maaz-H/ed5a95d1671776f614d06f89a11f3f51/raw/ac0cc5c503fbbed3e24c23cca131402d93c1aa08/Sophia.ps1", "$PSScriptRoot\Frag-Sophia\Sophia\Sophia.ps1" )
    .\Frag-Sophia\Sophia\Sophia.ps1
    
       # https://gist.githubusercontent.com/M-Maaz-H/ed5a95d1671776f614d06f89a11f3f51/raw/e2289a9276df1929a3164ef21342d1d112009b53/test.ps1










#Write-Output "Applying Other Tweaks"
#Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Sycnex/Windows10Debloater/master/Windows10Debloater.ps1'))


