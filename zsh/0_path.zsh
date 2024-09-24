# path, the 0 in the filename causes this to load first

pathAppend() {
  # Only adds to the path if it's not already there
  if ! echo $PATH | grep -q "(^|:)$1($|:)" ; then
    PATH=$PATH:$1
  fi
}


pathAppend "$HOME/go/bin"
pathAppend "/opt/local/bin"
pathAppend "/opt/local/sbin"

# Remove duplicate entries from PATH:
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
