#!/bin/bash

WORK_DIR="/home/onyxia/work"
GITHUB_REPOSITORY="https://github.com/InseeFrLab/AIML4OS-template-quarto-python.git"
NOTEBOOK_DOWNLOAD_URL="https://inseefrlab.github.io/AIML4OS-template-quarto-python/chapters/chapter1.ipynb"


# Download the pyproject.toml directly using git
echo $GITHUB_REPOSITORY
git clone --depth 1 $GITHUB_REPOSITORY temp

# Install dependencies in system env
uv pip install -r temp/pyproject.toml --system
rm -rf temp

# Download the notebook directly using curl
echo $NOTEBOOK_DOWNLOAD_URL
curl -L $NOTEBOOK_DOWNLOAD_URL -o "${WORK_DIR}/exercise.ipynb"

# Ensure Quarto extension is up to date
code-server --install-extension quarto.quarto

# Additional configuration (system libs, etc.)
# sudo apt-get update
# sudo apt-get install ....