<img src="https://raw.githubusercontent.com/geerlingguy/mac-dev-playbook/master/files/Mac-Dev-Playbook-Logo.png" width="250" height="156" alt="Ansible Playbook Logo" />

# Operating System Ansible Playbook

## DO NOT USE YET, THIS IS BEING CONFIGURED

These playbooks allow you to set up your Mac and Windows systems (with Linux support planned in the future). They enable you to configure packages and various aspects of each operating system. Since both platforms can be challenging to automate, there may be some tasks that cannot be fully automated.

These use playbooks from [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook) and [AlexNabokikh/windows-playbook](https://github.com/AlexNabokikh/windows-playbook)  but their default.config.yml use more general configurations AND are commented out so you can build your own configuration while having an example to use.

## Table of Contents
- [Mac](#mac)
- [Windows](#windows)

---


## Mac

### Installation

  1. Ensure Apple's command line tools are installed.
`xcode-select --install` to launch the installer

  2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

     1. Run the following command to add Python 3 to your $PATH: `export PATH="$HOME/Library/Python/3.9/bin:/opt/homebrew/bin:$PATH"`
     2. Upgrade Pip: `sudo pip3 install --upgrade pip`
     3. Install Ansible: `pip3 install ansible`

  3. Clone or download this repository to your local drive.
  4. Run `./mac.sh` to run the Mac playbook inside this directory. This will also install the required Ansibles roles.
  5. You can also do the following in the `mac-playbook/` to do the following:
      1. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
      2. Run `ansible-playbook main.yml --ask-become-pass` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

> Note: If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

## Windows

### Installation

```
