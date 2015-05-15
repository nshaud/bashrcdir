#################################
#####   .bashrc de Altay    #####
###  altay@rez-gif.supelec.fr ###
#################################

# Autocomplétion bash
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi

xhost +local:root > /dev/null 2>&1

# Active l'autocomplétion même avec sudo
complete -cf sudo

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export EDITOR=vim

# Ne rien faire en mode non interactif
[ -z "$PS1" ] && return

# Utilisation des couleurs
# Charge des variables pour les couleurs
# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

force_color_prompt=yes

# Affichage personnalisé de la ligne de commande
# Tuyeau en coin haut gauche :
Pipe_LU='\342\224\214'
# Tuyeau en ligne :
Pipe_Line='\342\224\200'
# Tuyeau en bas gauche :
Pipe_LD='\342\224\224'
# Embout :
Pipe_End='\342\225\274'

function virtualenv_info(){
    # Environnements virtuels Python
    if [[ $VIRTUAL_ENV != "" ]]; then
        venv="$Green(${VIRTUAL_ENV##*/})$Color_Off "
    # Environnements virtuels Ruby
    elif [ -f ~/.rvm/bin/rvm-prompt ]; then
    	rvb=$(~/.rvm/bin/rvm-prompt)
    	if [[ $rvb != "" ]]; then
    		venv="$IRed($rvb)$Color_Off "
    	else
    		venv=""
    	fi
    else
    	venv=""
    fi
	echo -e $venv
}

# Choix des couleurs pour le prompt
if [[ $EUID == 0 ]]; then
	# Root
    User_Color=$IRed
    BUser_Color=$BRed
    BIUser_Color=$BIRed
elif [ -n "$SSH_CLIENT" ]; then
	# SSH
    User_Color=$IBlue
    BUser_Color=$BBlue
    BIUser_Color=$BIBlue
else
	# Normal
    User_Color=$IGreen
    BUser_Color=$BGreen
    BIUser_Color=$BIGreen
fi

# Privilege
if [ "`id -u`" -eq 0 ]; then
	privilege='#'
else
	privilege='$'
fi

# Empêche virtualenv de changer le prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

venv="\$(virtualenv_info)"

# Mise en forme du prompt
export PS1="$Pipe_LU $BBlue[\#] $Yellow(\D{%d-%m-%y} $BYellow\t$Yellow) $BIUser_Color\u$IUser_Color@$BIUser_Color\h$Color_Off: $BPurple\w $BRed$privilege$Color_Off ${venv}\n$Pipe_LD$Pipe_End "

# Citation aléatoire (fortune-mod)
if [ -f /usr/games/fortune -a "$(id -u)" != 0 ]; then
	if [ -f /usr/games/cowsay -a "$(id -u)" != 0 ]; then
		/usr/games/fortune -as | /usr/games/cowsay -nf duck
	else
		/usr/games/fortune -as
	fi
fi

# Import des alias
if [ -f ~/.bashrcdir/bash_aliases ]; then
    . ~/.bashrcdir/bash_aliases
fi

# Alias locaux et customisations machine par machine
if [ -f ~/.bashrcdir/bash_aliases.local ]; then
	. ~/.bashrcdir/bash_aliases.local
fi

