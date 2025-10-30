<img src="https://raw.githubusercontent.com/geerlingguy/mac-dev-playbook/master/files/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Ansible Playbook Logo" />

# Operating System Ansible Playbook

## DO NOT USE YET, THIS IS BEING CONFIGURED

These playbooks allow you to set up your Mac and Windows systems (with Linux support planned in the future). They enable you to configure packages and various aspects of each operating system. Since both platforms can be challenging to automate, there may be some tasks that cannot be fully automated.

## Table of Contents
- [Mac](#mac)
- [Windows](#windows)

---


## Mac

### Installation
1. Ensure Apple's command line tools are installed (xcode-select --install to launch the installer).
2. Install homebrew

## Windows

### Installation
Copy and paste the code below into your PowerShell terminal to get your Windows machine ready to work with Ansible.
```powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/AlexNabokikh/windows-playbook/master/setup.ps1"
$file = "$env:temp\setup.ps1"

(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file -Verbose
```
