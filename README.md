# Dotfiles for Microsoft Windows 11

Credit to JM Orbegoso for this great work.
https://github.com/JMOrbegoso/Dotfiles-for-Windows-11

Repeatable, reboot resilient Dotfiles script to setup a development environment in Microsoft Windows 11.

## Usage

Open any Windows PowerShell host console **(Except Windows Terminal)** with administrator rights and run:

```Powershell
$GitHubRepositoryAuthor = "AtieDag"; `
$GitHubRepositoryName   = ".dotfiles"; `
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; `
Invoke-Expression (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/${GitHubRepositoryAuthor}/${GitHubRepositoryName}/master/Download.ps1");
```

## What does?

This dotfiles script does:

- Install Chocolatey [Needed for this to work].
- Configure Chocolatey to remember installation arguments for future updates.
- Install Git.
- Configure Git.
- Install Visual Studio Code.
- Configure Visual Studio Code.
- Install Visual Studio Code extensions.
- Install Notepad++.
- Configure Notepad++.
- Enable Windows Subsystem for Linux.
- Install Docker Desktop.
- Configure File Explorer:
  - Show file extensions.
  - Open file explorer to This PC.
  - Set as background option moved to extended Context Menu.
  - Disable recently opened items from JumpList.
- Microsoft Windows optional features:
  - Disable Windows Media Player.
  - Disable Internet Explorer.
  - Disable Microsoft XPS Document Writer.
  - Disable WorkFolders Client.
  - Enable Windows Sandbox.
- Configure Windows 11 power plan.
- Configure Windows 11 regional format:
  - First day of week: Monday.
  - Short date: 2017-04-05.
  - Long date: Wednesday, 5 April, 2017.
  - Short time: 19:40.
  - Long time: 19:40:07.
- Rename PC.


## Alias 

### Terminal Profile

| Alias | Description              
| ----- | ------------------------ 
| edt   | Edit terminal profile    
| src   | Refresh terminal profile 
### Directories

| Alias | Description                      
| ----- | -------------------------------- 
| mkcd  | Create folder and navigate to it 
| trash | Open the recycle bin folder      
### System Maintenance

| Alias  | Description              
| ------ | -----------------------  
| updsys | Update apps and system.  
### Environment Variables

| Alias | Description                                     
| ----- | ----------------------------------------------  
| pathl | List the content of PATH environment variables  
### Git

| Alias | Description                                                      
| ----- | ------------------------------------------------------ 
| gcb   | git checkout creating new branch
| ga    | git add
| gaa   | git add all
| gsc   | git clone, load submodules and navigate to the repository folder 
| gst   | git status
| gcmsg | git commit message
| ggp   | git push origin current_branch
| glg   | git log
| gsrlc | Git soft reset last commit
| ghrlc | Git hard reset last commit
### Docker

| Alias | Description                         
| ----- | ----------------------------------  
| dpl   | Docker pull                         
| dlc   | List the Docker containers working  
| dlca  | List all the Docker containers      
| dli   | List all the Docker images          
| dsc   | Stop Docker container               
| drc   | Delete Docker container             
| dri   | Delete Docker image                
### Web search from the console

| Alias         | Example                     
| ------------- | --------------------------  
| bing          | bing "Windows 11"           
| google        | google "Windows 11"         
| duckduckgo    | duckduckgo "Windows 11"     
| youtube       | youtube "Windows 11"        
| github        | github "Windows 11"         
| stackoverflow | stackoverflow "Windows 11"  
      