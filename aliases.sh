# per conoscere comando associato all'alias:
# alias comando
# type -a comando
# per eseguire SENZA alias: \comando (es. \df)
getmac() {
        ping -c 1 $1 && arp $1
}
alias agu='sudo apt update'
alias alu='sudo apt list --upgradable'
alias aggu='sudo apt update && sudo apt upgrade'
alias audo='sudo apt update && sudo apt upgrade --download-only'
alias agguy='sudo apt update && sudo apt upgrade -y'
alias agug='sudo apt upgrade'
alias agugy='sudo apt upgrade -y'
alias agdu='sudo apt full-upgrade -y'
alias agi='sudo apt install'
alias aif='sudo apt install -f'
alias agr='sudo apt remove'
alias agc='sudo apt clean'
alias agau='sudo apt autoremove'
alias dpkgi='sudo dpkg -i'
alias psx='ps aux |grep'
alias acp='sudo apt-cache policy'
alias acs='sudo apt search'
alias as='apt search'
alias df='df -Th --total'
alias dfh='df -Th --total -x squashfs -x tmpfs -x devtmpfs -x overlay'
alias agp='sudo apt purge'
alias ida='ip -d addr'
alias ica='ip -c addr'
alias ipr='ip -c r'
alias ibra='ip -br -c addr'
alias hrg='history | grep'
alias topi='top -i'
alias dpkgl='dpkg -l |grep'
alias mcr='sudo -H mc'
alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias va='vi ~/.bash_aliases'
alias sa='source ~/.bash_aliases'
alias adbi='adb install'
alias mou="mount | grep '^/dev' | column -t"
# ·······custom program·········
alias q='qalc -c'
# ·······systemctl·········
alias sysstat='sudo systemctl status'
alias syslu='systemctl list-units --all --type=service --no-pager'
alias syslur='systemctl list-units --all --type=service --no-pager | grep running'
alias sysrest='sudo systemctl restart'
alias sysstop='sudo systemctl stop'
alias sysstart='sudo systemctl start'
alias sysenab='sudo systemctl enable'
alias sysdisab='sudo systemctl disable'
alias sysdr='sudo systemctl daemon-reload'
alias sysrf='sudo systemctl reset-failed'
# ········docker-compose·················
alias cdd='cd ~/docker'
alias rc='docker-compose down && docker-compose up -d' # restart container
alias dcstar='docker-compose start'
alias dcstop='docker-compose stop'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias dcr='docker-compose run'
alias dce='docker-compose exec'
alias dcb='docker-compose build'
alias dip='docker image prune -f'
alias owndir='sudo chown -R "$USER":"$USER" .'
# ·········ssh·············
alias sshi='ssh -i .ssh/id_ed25519'
# ·········adb·············
alias ai='adb install'
alias apus='adb push'
alias apul='adb pull'
# ·························
alias lbi='locate -bi'
alias myip='curl http://ipecho.net/plain; echo'
alias mioip='curl http://ifconfig.co/ip; echo'
alias mkdir='mkdir -pv'
alias free='free -th'
alias cds='cd /home/davide/_daxxx_scripts_'
alias ..='cd ..'
alias se='sudoedit'
alias sesl='sudoedit /var/log/syslog'
# ·······kernel··········
alias lk='dpkg -l | grep " linux-"'
alias lvr="dpkg -l linux-{image,headers,modules}-\* | awk '/^ii/{print $2}' | egrep '[0-9]+\.[0-9]+\.[0-9]+' | grep -v $(uname -r | cut -d- -f-2)"
# list vecchi kernel
f_lvk() {
  dpkg -l linux-{image,headers,modules}-\* | awk '/^ii/{print $2}' | egrep '[0-9]+\.[0-9]+\.[0-9]+' | grep -v $(uname -r | cut -d- -f-2)      
}
# rimuove vecchi kernel
f_rvk() {
  dpkg -l linux-{image,headers,modules}-\* | awk '/^ii/{print $2}' | egrep '[0-9]+\.[0-9]+\.[0-9]+' | grep -v $(uname -r | cut -d- -f-2) | while read file; do sudo apt purge "$file" -y; done
}
# rimuove vecchi file di configurazione
alias rvfc='sudo dpkg --purge $(dpkg --get-selections | grep deinstall | cut -f1)'
# ·······················
# cat con syntax highlighting
alias pcat='pygmentize -g'
# sudo apt install highlight
alias hcat='highlight -O ansi --force'
# tail log
alias tl='tail -f /var/log/syslog'
alias lf='less +F'
# ·····nordvpn·············
alias nd='nordvpn d'
alias nca='nordvpn c austria'
alias ncg='nordvpn c germany'
 
# ubuntu .bashrc specific
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# daxxx specific
alias t='/home/davide/Dropbox/todo/todo.sh'
# tempo
alias tempo='curl wttr.in/Collegno'
# pulizia snap e flatpack
alias srfu='sudo snap refresh && sudo flatpak update && sudo flatpak uninstall --unused'
alias sfu='sudo flatpak update && sudo flatpak uninstall --unused'
# mp3 download
alias dammix="youtube-dl --rm-cache-dir -i --add-metadata --metadata-from-title '%(artist)s - %(title)s' -x --output '%(title)s.%(ext)s' --audio-format mp3 --audio-quality 0"
alias dammi="yt-dlp --rm-cache-dir -i --add-metadata --metadata-from-title '%(artist)s - %(title)s' -x --output '%(title)s.%(ext)s' --audio-format mp3 --audio-quality 0"
# tail logs
alias ngerr='clear && tail -n0 -f /var/log/nginx/error.log'
alias aperr='clear && tail -n0 -f /var/log/apache2/error.log'
alias hterr='clear && tail -n0 -f /var/log/httpd/davex-error_log'
alias cnterr1='clear && tail -n0 -f /srv/http/dav.log'
alias cnterr2='clear && tail -n0 -f /var/www/dav.log'
# wine
alias wrun32="WINEPREFIX='$HOME/prefix32' WINEARCH=win32 wine"
alias wrun64="WINEPREFIX='$HOME/prefix64' WINEARCH=win64 wine"
# spazio virtualbox
alias vms='ncdu ~/VirtualBox\ VMs/'
xfc() {
        exiftool $1 | grep Color
}

# usato solo per servers:
# pastebin usa CRLF, converto con tr -d $'[\x0D]'
alias aliasupdate="curl https://raw.githubusercontent.com/davide966/shared/main/aliases.sh | tr -d $'[\r]' > ~/.bash_aliases && source ~/.bash_aliases"
