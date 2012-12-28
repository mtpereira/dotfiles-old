function ads() {
    ldapsearch -LLL -D ${1} -W "(sAMAccountName=${2})"
}

