function ads() {
    ldapsearch -LLL -D ${1} -W "(sAMAccountName=${2})"
}

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

