#!/usr/bin/env python3
import platform, os
from pathlib import Path
from shutil import which


# tools  to be installed
tools = {
    "Linux": ("neovim", "tmux", "kitty", "zsh", "curl", "git", "universal-ctags", "make", "fasd", "npm"),
    "Darwin": ("neovim","tmux", "kitty", "zsh", "curl", "git", "ctags", "make", "fasd", "npm"),
}


# default brew bin
brew = "/opt/homebrew/bin/brew" 

source_base = os.getcwd()
destination_base = Path.home()
vundle_path = "{}/.vim/bundle/vundle".format(destination_base)
zprezto_path= "{}/.zprezto".format(Path.home())

# Prezto
prezto_files = (
    'zsh',
    'zsh/zprezto',
    'zsh/prezto-override/zshrc',
    'zsh/prezto-override/zpreztorc',
    'zsh/prezto/runcoms/zlogin',
    'zsh/prezto/runcoms/zlogout',
    'zsh/prezto/runcoms/zprofile',
    'zsh/prezto/runcoms/zshenv',
)

pltform = platform.system()

def setup():
    install()
    config()

def install():
    if pltform == "Linux":
        if "arch" in platform.platform():
            cmd_base='sudo pacman -S '
        else:
            cmd_base='sudo apt-get install -y '
    elif pltform =="Darwin":
        install_brew()
        cmd_base="{} install ".format(brew)
    else:
        raise Exception("Unsupported platform")

    cmd= cmd_base + " ".join(tools[pltform])
    os.system(cmd)

def install_brew():
    if which(brew) is None:
        os.system('/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"')
    

def config():
    copy_config()
    install_prezto()
    config_kitty()
    config_nvim()

def copy_config():
    files = (
        # tmux
        'tmux/tmux.conf',
    )

    for item in files:
        copy(item)

def copy(filepath, hidden = True):
    file = os.path.basename(filepath)
    file_dest = file

    if hidden:
        file_dest = ".{}".format(file)

    os.system("ln -nfs {src}/{file} {dest}/{file_dest}".format(src = source_base, dest = destination_base, file = filepath, file_dest = file_dest))

def unlink(file):
    os.system("rm -f " + file)


def remove_prezto():
    for item in prezto_files:
        unlink(item)

def install_prezto():
    if os.path.exists('zsh/zprezto') == False:
        os.system('git clone --recursive https://github.com/sorin-ionescu/prezto.git "zsh/zprezto"')

    for item in prezto_files:
        if 
        copy(item)

    folders = ('.zsh.before', '.zsh.after', '.zsh.prompts')
    for folder in folders:
        dest = "{}/{}".format(destination_base, folder)
        if os.path.exists(dest) == False:
            os.mkdir(dest)


def config_kitty():
    kitty_dir = "{dest}/.config/kitty".format(dest=destination_base)
    os.system("rm -rf " + kitty_dir)
    os.system("ln -nfs {src}/kitty {dest}/.config/".format(src = source_base, dest = destination_base))

def config_nvim():
    nvim_dir = "{dest}/.config/nvim".format(dest=destination_base)
    os.system("rm -rf " + nvim_dir)
    os.system("ln -nfs {src}/nvim {dest}/.config/".format(src = source_base, dest = destination_base))

setup()
