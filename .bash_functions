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

function die() {
    echo "$(basename ${0}): ${*}"
    exit 1
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

### SYSADMIN ###
function ads() {
    ldapsearch -LLL -D ${1} -W "(sAMAccountName=${2})"
}

