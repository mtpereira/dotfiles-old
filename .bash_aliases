# Shell commands
alias ls='ls --color=auto -F'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"

# Shorthands
alias g="git"
alias ag="apt-get"
alias ac="apt-cache"
alias s="sudo "
alias v="vagrant"
alias a="ansible"
alias ap="ansible-playbook"
alias ax="ansible-galaxy"
alias e="${EDITOR}"
alias d="docker"
alias dc="docker-compose"
alias dm="docker-machine"

# Utilities with some sane defaults
alias rdp="xfreerdp -g 1024x640 -k pt --disable-theming --disable-menu-animations -u "
alias rdp-old="exec rdesktop -k pt -g 1024x640 -r disk:$(hostname)='/home/rag/VirtualBox VMs/shared/' -u "
alias swapcaps='xmodmap ~/.Xmodmap'
alias tmux='tmux -2'

# Custom commands
alias rbu="rsync -av --exclude VirtualBox\ VMs/ --exclude \"Dropbox/\" --exclude \"OneDrive/\" --exclude \"Downloads/\" --exclude \".cache/\" --exclude \"*.un~\" --exclude \".local/share\" --exclude \".vagrant.d/\" --exclude MEOCloud --exclude Library --exclude Applications --exclude debug --exclude deploys --exclude Music --exclude Movies --exclude \".gem\" --exclude \".npm\" --exclude \".rbenv\" --exclude \".dotfiles\" --exclude \"fpm-lab/fpm/*/pkgs/\" --exclude investors --exclude \".git\" --delete /Users/rag/ bragi:/mnt/elements/backups/tyr/home/rag/ | tee >(ssh bragi \"cat - > /mnt/elements/backups/tyr/home-$(date +%Y%m%d).log\")"
alias pproute="ip route | sort -k5 | perl -pe 's/^/$. - /'"
alias dist-upgrade="sudo apt-get update && sudo apt-get dist-upgrade"
alias safe-upgrade="sudo apt-get update && sudo apt-get safe-upgrade"

# Python 2
alias py2="python2.7"
alias py3="python3.4"
alias py="py3"


