#! /bin/bash

exit_if_not_exists () {
  if ! command -v ${1} &> /dev/null
  then
    echo "$1 could not be found"
    exit 1
  fi
}

## Check if neovim exists
exit_if_not_exists "nvim"

## Check if git exists
exit_if_not_exists "git"

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

BOLD="\033[1;33m"
GREEN="\033[0;32m"
echo -e "${BOLD}${GREEN}\nInstallation completed"
