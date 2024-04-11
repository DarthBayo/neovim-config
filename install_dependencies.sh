#! /bin/bash

exit_if_not_exists () {
  COMMAND=$1
  PACKAGE_NAME=$2

  if ! command -v ${COMMAND} &> /dev/null
  then
    echo "Installing $COMMAND"
    sudo apt install $PACKAGE_NAME
  else
    echo "$PACKAGE_NAME already exists"
  fi
}

## Check if neovim exists
exit_if_not_exists "nvim" "neovim"

## Check if git exists
exit_if_not_exists "git" "git"

## Check if fd-find exists
exit_if_not_exists "find" "fd-find"

## Check if rg exists
exit_if_not_exists "rg" "ripgrep"

install_dependencies_start () {
  PLUGIN_NAME=$1
  GIT_REPO_URL=$2
  GIT_TAG_VERSION=$3

  ## Create folder start if not exists
  FOLDER_NAME="start"
  if ! [ -d ${FOLDER_NAME} ];
  then
    mkdir ${FOLDER_NAME}
  fi

  # Disable git detached head warning
  git config --global advice.detachedHead false

  
  # Moving to the right folder
  if ! [ -d ${FOLDER_NAME}/${PLUGIN_NAME} ];
  then
    # Cloning the single tag to a specific folder name
    git clone --depth 1 --branch ${GIT_TAG_VERSION} ${GIT_REPO_URL} ${PLUGIN_NAME}

    mv ${1} ${FOLDER_NAME}
  else
    RED="\033[0;31m"
    echo -e "${RED}Folder $PLUGIN_NAME already exists in $FOLDER_NAME/$PLUGIN_NAME"
  fi
}

# Install Dracula theme
install_dependencies_start "dracula" "https://github.com/dracula/vim.git" "v2.0.0"

# Install Telescope
install_dependencies_start "telescope" "https://github.com/nvim-telescope/telescope.nvim.git" "0.1.6"

# Install Plenary
install_dependencies_start "plenary" "https://github.com/nvim-lua/plenary.nvim.git" "v0.1.4"

# Install Plenary
install_dependencies_start "plenary" "https://github.com/nvim-lua/plenary.nvim.git" "v0.1.4"

# Install lspconfig
install_dependencies_start "lspconfig" "https://github.com/neovim/nvim-lspconfig.git" "v0.1.5"

# Install mason
install_dependencies_start "mason" "https://github.com/williamboman/mason.nvim.git" "v1.10.0"

# Install mason-lspconfig
install_dependencies_start "mason-lspconfig" "https://github.com/williamboman/mason-lspconfig.nvim.git" "v1.27.0"


GREEN="\033[0;32m"
echo -e "${GREEN}\nInstallation completed"
