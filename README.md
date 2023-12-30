# Machine setup

## Inspiration

I do not have that spesific needs for my working environment. However I want ot
be able to move my work to new machines in minutes. using declarative way of
working provides me possibility fix configuration be getting the previous
configuration from version control system (git).

## Design

I need the following software:

- Google chrome
- VSCode
- Docker desktop
- GPG
- tmux
- NeoWim
- Git
- Pandoc (converts marksdown to any format known to earth)
- UTM (Virtualization that works best with Apple Silicon)
- Docker
- Slack
- iTerm2
- fzf
- Oh-my-zsh

I want to install software from homebrew, if available. I want to have one
place where I can update software.

For git i have some needs. I want to be able to use multiple git accounts with
ease, spesifically I also want to use github with multiple accounts. I also
want to be able to digitally sign my commits. I want to use correct GPG
signatures with correct account. I find that using git congiration based on
directory structure serves me best. Therefore my git configuration is in
multiple files. The setup must be able to use it.

VSCode has excellent settings sync capabilities, makes no sense to duplicate
that into setup scripts.

## Usage

Usually I open the solution in development container. However the usage is the
same where you run.

Running locally in new machine you need the copy of the repository content. Then
you need to install brew and ansible. That can be done with `setup_mac.sh`.

### Local installation

The inventory for local installation is

```yml
# setup hosts
[macs]
#localhost ansible_connection=local
```

Inventory is in `inventory/inventory.ini`

### Remote installation

For remote installation you need to enable remote login:

Setup SSH
Before you can SSH into the remote Mac, ensure you have SSH access to it:

On the remote Mac, open System Preferences.
Go to Sharing.
Check Remote Login. This enables the SSH server on the Mac.
Ensure your user is allowed or add your user to the list of allowed users.

to ease installation copy needed keys to remote mac:

```bash
ssh-copy-id username@remote_mac_address_or_hostname
```

The inventory for remote installation is, exmple for reference only.

```yml
# setup hosts
[macs]
192.168.64.12 ansible_user=samibister ansible_ssh_private_key_file=~/.ssh/id_rsa_testuser
```

Inventory is in `inventory/inventory.ini`

Then you need to install dependencies to the machine that will execute the ansible.

```bash
ansible-galaxy install -r requirements.yml
```

After this you can execute the playbook.

```bash
ansible-playbook -i inventory/inventory.ini setup-mac.yml --ask-become-pass -vv --ask-vault-pass
```

Before execution the sudo password and the password for ansible vault is asked.

## Modyfying the installation

All modifications are done on two places:

- Inventory `inventory/inventory.ini`
- Non-sensitive variables `group_vars/all/all.yml`
- Sensitive variables `group_vars/all/vault.yml`

Each role as variables show as reference. DO NOT edit them. Make changes to the
places show above.

For brew new apps are added under `homebrew_installed_packages` and those brew
scripts needing `cask` are added under `homebrew_cask_apps`

## After installation

Disable the remote login to the mac.

## Development

Use UTM virtual machine for development. Using virtual machine enables testing with
pristine system and safe from bricking the work machine.

## Additional documentation

[ADR](docs/adr/index.md)

TODO:
Add
~/.gnupg/gpg-agent.conf
pinentry-program /usr/local/bin/pinentry-mac

## Refind configuration

### Detect leaks

gitleaks detect --source . -v
´´´

### Add condifuration

```bash
stow --adopt -v lvim --target /Users/samibister
```

### Run ansible

```bash
op read op://personal/macsetup-ansible-vault/password --no-newline > passfile.pass && ansible-playbook -i inventory/inventory.ini -e ansible_become_pass $(op readop://personal/Macbook16/password --no-newline)  --vault-password-file passfile.pass setup.yml  -vvv && rm passfile.pass
```
