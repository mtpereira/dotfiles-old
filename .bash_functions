### SCRIPTING UTILS ###
function has() {
    return $(which ${1} >/dev/null)
}

function note() {
    echo "[$(tput bold)$(tput setaf 2) INFO $(tput sgr0)] ${*}"
}

function err() {
    echo "[$(tput bold)$(tput setaf 1) ERROR $(tput sgr0)] ${*}"
}

function warn() {
    echo "[$(tput bold)$(tput setaf 3) WARNING $(tput sgr0)] ${*}"
}

function die() {
    echo "$(basename ${0}): ${*}"
    return 1
}

# tput helper
# Taken from: (http://linuxtidbits.wordpress.com/2008/08/11/output-color-on-bash-scripts/)
function tputcolors() {
    echo -e "$(tput bold) reg  bld  und   tput-command-colors$(tput sgr0)"
    for i in $(seq 1 7); do
      echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
      done
    echo ' Bold            $(tput bold)'
    echo ' Underline       $(tput sgr 0 1)'
    echo ' Reset           $(tput sgr0)'
    echo ""
}

### SHELL FILE OPERATIONS ###
# mkdir && cd
function mkd() {
    mkdir ${@} && cd ${1}
}

# mkdir && mv
function mkv() {
    mkdir "${@: 1:1}"
    mv "${@: 2}" "${@: 1:1}"
}

# cp && EDITOR
function cped () {
    cp ${1} ${2}
    $EDITOR ${2}
}

# symlink
function link() {
    src=$1
    dest=$2

    if [ -e $dest ]; then
        if [ -L $dest ]; then
            # Already symlinked -- I'll assume correctly.
            return
        else
            # Rename files with a ".old" extension.
            warn "$dest file already exists, renaming to $dest.old"
            backup=$dest.old
            if [ -e $backup ]; then
                die "$backup already exists. Aborting."
            fi
            mv -v $dest $backup
        fi
    fi

    # Update existing or create new symlinks.
    ln -vsf $src $dest
}

### SHELL UTILS ###
# source .bashrc
function resource() {
    source ${HOME}/.bashrc
}

### SSH ###
# ssh-copy-id and add to ssh config
function ssh-add-host() {
    if [ -n "${1}" ] && [ -n "${2}" ]; then
        ssh-copy-id "${2}@${1}" || return 1
        echo "Host $(echo ${1} | cut -d'.' -f1)" >> ~/.ssh/config
        echo "  Hostname ${1}" >> ~/.ssh/config
        echo "  Port 22" >> ~/.ssh/config
        echo "  User ${2}" >> ~/.ssh/config
        echo "" >> ~/.ssh/config
    else
        echo "ssh-add-host: Usage: ssh-add-host HOST USER"
    fi
}

# select default ssh key
# usage: ssh-select-key [name]
function ssh-select-key() {
    selected=""
    sshdir="${HOME}/.ssh"
    if [ -z "${1}" ]; then
        selected="$(hostname --short)"
    else
        selected="${1}"
        if [ ! -e ${sshdir}/"${selected}" ] ||
           [ ! -e ${sshdir}/"${selected}".pub ]; then
            err "Selected key does not exist: ${selected}"
            return 1
        fi
    fi
    note "Selected key: ${selected}"
    if [ -e ${sshdir}/id_rsa ] &&
       [ -e ${sshdir}/id_rsa.pub ]; then
        rm ${sshdir}/id_rsa{,.pub}
    fi
    link ${sshdir}/"${selected}" ${sshdir}/id_rsa
    link ${sshdir}/"${selected}".pub ${sshdir}/id_rsa.pub
}

### SYSADMIN ###
function ads() {
    ldapsearch -LLL -D ${1} -W "(sAMAccountName=${2})"
}

