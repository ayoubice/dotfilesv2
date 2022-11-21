#!/usr/bin/env python3

import platform, os
from pathlib import Path


# tools  to be installed
tools = ("vim", "tmux", "kitty", "zsh", "curl", "git", "ctag", "make", "fasd")

source_base = os.getcwd()
destination_base = Path.home()
vundle_path = "{}/.vim/bundle/vundle".format(destination_base)
zprezto_path= "{}/.zprezto".format(Path.home())

def setup():
    install(tools)
    config()

def install(apps):
    match platform.system():
        case "Linux":
            cmd_base='sudo apt-get install -y '
            cmd= cmd_base + " ".join(apps)
            os.system(cmd)
            case _:
                raise Exception("Unsupported platform")

def config():
    # tmux
    files = (
        # tmux
        'tmux/tmux.conf',

        # vim
        'vimrc',
        'vim',

        #zsh
        'zsh/prezto-override/zshrc',
        'zsh/prezto-override/zpreztorc',
        '/runcoms/zlogin',

    )

    install_vundler()

def copy(filepath, hidden = True):
    file = os.path.basename(filepath)

    if hidden :
        cmd="ln -nfs {src}/{file} {dest}/{file_dest}".format(
            src = source_base, 
            dest = destination_base,
            file = filepath,
            file_dest = ".{}".format(file),
        )

        print(cmd)
        # os.system(cmd)

def install_vundler():
    install_cmd = "vim +VundleInstall +qall"
    cmd ="git clone https://github.com/gmarik/vundle.git {} && {}".format(vundle_path, install_cmd)
    print(cmd)

setup()
