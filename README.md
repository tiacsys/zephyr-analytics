# How to use this

This repo is to generate figures used in the Zephyr training to showcase the
release history and code base development over time.

## Install dependencies

### System

Install system dependency **cloc**

Fedora:
```
sudo dnf install cloc sqlite3
```

Ubuntu:
```
sudo apt install cloc sqlite3
```

### Python

Create venv:
```
uv venv
```
Activate:
```
. .venv/bin/activate
```

Install deps:
```
uv sync
```

## Generate Data

The `data` folder contains several scripts that will evaluate a Zephyr repository
and store that data into different files like a SQLite Database and some CSV files.
These files will then be processed by the Jupyter Notebooks in the `notebooks`
folder to update the figures in the `figures` folder.

To just generate all data you can run:

```bash
data/create_all.sh PATH_TO_ZEPHYR_REPO
```

## Create Figures

With the existing data you can now start a Jupyter lab and run the notebooks to
create and update the figures in this repo.

```bash
jupyter-lab
```

This will start a Jupyter Lab that can be accessed via the browser of your choice
to generate the figures by just hitting <kbd>Shift</kbd> + <kbd>Enter</kbd>
