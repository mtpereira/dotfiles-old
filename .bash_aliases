alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias grep="grep --color --exclude-dir='.svn' --exclude-dir='.git'"
alias todo="$EDITOR ~/todo/todo-$(date +%Y%m%d).txt"
alias rdp="xfreerdp -g 1024x640 -k pt --disable-theming --disable-menu-animations -u "
alias g="git"
alias rbu="rsync -av --exclude "VirtualBox\ VMs/" --exclude "Dropbox/" --exclude "downloads/" --exclude ".cache/" --exclude ".mozilla/firefox/*/Cache/" --exclude ".thumbnails/" --exclude ".runicgames/" --exclude ".Skype/" --delete /home/rag/ /media/Elements/backups/tyr/home/rag/ | tee /media/Elements/backups/tyr/home-$(date +%Y%m%d).log
"
