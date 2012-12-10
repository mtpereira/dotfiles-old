function ads() {
    ldapsearch -LLL -D ptcom\\xpita19 -W "(sAMAccountName=${1})"
}

