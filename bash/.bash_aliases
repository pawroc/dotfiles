# Here you can place any aliases used by your environment

# cd aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

# grep aliases
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# ls aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'

# path
alias path='echo -e ${PATH//:/\\n}'

# time aliases
alias now='date +"%T"'

# open ports alias
alias ports='netstat -tulanp'

# iptables aliases
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist
