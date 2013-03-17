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

