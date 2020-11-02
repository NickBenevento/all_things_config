# Python

## Installing Pyenv
[Github repo](https://github.com/pyenv/pyenv)

Steps:
1. Install pre-reqs:
```
sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
```
2. Run the [pyenv installer](https://github.com/pyenv/pyenv-installer):
- `curl https://pyenv.run | bash`
- `ecec $SHELL`
- `pyenv update`
3. Follow the installation instructions to add pyenv to the system path.
Should be something like:
```
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
```
4. Install python versions: `pyenv install [3.8.3]`

Check python version by: `pyenv versions`

Switch global python version by: `pyenv global [3.8.3]`

