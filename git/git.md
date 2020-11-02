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

