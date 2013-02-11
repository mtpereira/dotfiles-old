function ads() {
    ldapsearch -LLL -D ${1} -W "(sAMAccountName=${2})"
}

function mkd() {
	mkdir ${@} && cd ${1}
}

