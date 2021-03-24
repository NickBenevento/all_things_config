# Git

## Git Config
**To set global credentials:**
`git config --global user.name: "username" user.email: "email"`

**To set local credentials:**
`git config user.name: "username" user.email: "email"`

**To Check Credentials:**
`git config --list`

## SSH Keys
1. Create the key: `ssh-keygen -t rsa -b 2048 -C "email@example.com"`
1. Add the key to github/gitlab
1. Add the ssh key to the ssh agent: `ssh-add ~/.ssh/path/to/key`
1. The above command does not persist across reboots. To add the keys automatically every time, create a file called `config` in the `~/.ssh` directory. Add lines as need be as follow:
```
IdentityFile ~/.ssh/first_identify_file
IdentityFile ~/.ssh/path/to/other/identify/file/id_rsa
```
1. Give the file chmod 600: `chmod 600 ~/.ssh/config`
1. Dones!

