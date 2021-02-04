# Python

## Python Paths and Frustrating Imports

[General Explanation/Instructions](https://towardsdatascience.com/how-to-fix-modulenotfounderror-and-importerror-248ce5b69b1c)

Options to get local python imports to work:
1. `export PYTHONPATH="${PYTHONPATH}:/path/to/your/project/root"`
- Run the command in the terminal for a one-session use.
- Add the above command to your `.bashrc` (and source it) to prevent needing to run it every time.
- If in a virtual environment, add it to the [virtual_env]/bin/activate
2. In an IDE like PyCharm, right click the project root and mark it as a `sources root`. Then, run the file as normal.
3. Create an install script to package the imports (see `setup.py`).
- Make sure there is an `__init__.py` in each of the folders that you want to use for imports.
- Make sure to use absolue imports --> `from project_root.folder.file import method`.
- Run `python setup.py install` to run the install script.

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

