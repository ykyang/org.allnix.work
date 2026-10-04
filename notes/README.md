# Python Miniforge
`#conda#python`

## Installation
Download
```sh
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```
Run
```sh
Miniforge3-Linux-x86_64.sh
```
Install into
```sh
~/local/miniforge3
```

Enable the initialization of Conda when opening a terminal
```sh
conda init
```
This command modifies `~/.bashrc`, and can be reversed
```sh
conda init --reverse $SHELL
```
Disable the auto-activation of `Conda`
```sh
conda config --set auto_activate_base false
```
The configuration is saved to `~/.condarc`.

## Common commands

```sh
conda env list                   # List available environment
conda create -n 3.14 python=3.14 # Create Python 3.14 environment
conda activate 3.14              # Activate Python 3.14
conda install numpy              # Install NumPy
```

## Package installation
Package installation could be accomplished by `Conda` or Python `venv`.
Using `Conda`
```sh
conda install numpy
```
or when using Python `venv`
```sh
pip install numpy   # Installed in .venv not in Conda
```
See [Python venv](#python-venv) for more details.






## Project specific Python version
Create a file `add_python.sh` to identify the Python version for a project.

```sh
#!/bin/bash
# Activate Python by running
#
#     source add_python.sh
#

conda activate 3.14
```

Activate the Python environment

```sh
source add_python.sh
```


# Python venv
`#python#venv`

A Python `venv` is a built-in module used to create lightweight, isolated virtual environments that keep project-specific dependencies separate from your global system Python.

## Common commands
```sh
python -m venv .venv      # Create a virtual env
source .venv/bin/activate # Activate virtual env

pip list                  # List all installed packages
pip install numpy         # Install NumPy
```


# Python Pyenv
`#python`

**Do not understand its philosophy, and go back to Conda.**

See Google Doc for the documentation of the attempt
