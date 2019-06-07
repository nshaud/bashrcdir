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

# Masque les fichiers cachés dans l'autocomplétion
bind 'set match-hidden-files off'

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
export HISTTIMEFORMAT="%d/%m %H:%M:%S "
export HISTCONTROL=ignoreboth
export EDITOR=vim
# Met à jour l'historique de bash immédiatement
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Ne rien faire en mode non interactif
[ -z "$PS1" ] && return

# Utilisation des couleurs
# Charge des variables pour les couleurs
# Reset
#Color_Off=$(tput sgr0)$(tput setaf 9)       # Text Reset
Color_Off=$(echo -en "\e[0m")

# Regular Colors
Black=$(tput sgr0)$(tput setaf 0)  # Black
Red=$(tput sgr0)$(tput setaf 1)    # Red
Green=$(tput sgr0)$(tput setaf 2)  # Green
Yellow=$(tput sgr0)$(tput setaf 3) # Yellow
Blue=$(tput sgr0)$(tput setaf 4)   # Blue
Purple=$(tput sgr0)$(tput setaf 5) # Purple
Cyan=$(tput sgr0)$(tput setaf 6)   # Cyan
White=$(tput sgr0)$(tput setaf 7)  # White

# Bold
BBlack=$(tput bold)$(tput setaf 0)  # Black
BRed=$(tput bold)$(tput setaf 1)    # Red
BGreen=$(tput bold)$(tput setaf 2)  # Green
BYellow=$(tput bold)$(tput setaf 3) # Yellow
BBlue=$(tput bold)$(tput setaf 4)   # Blue
BPurple=$(tput bold)$(tput setaf 5) # Purple
BCyan=$(tput bold)$(tput setaf 6)   # Cyan
BWhite=$(tput bold)$(tput setaf 7)  # White

# Background
On_Black=$(tput sgr0)$(tput setaf 0)  # Black
On_Red=$(tput sgr0)$(tput setaf 1)    # Red
On_Green=$(tput sgr0)$(tput setaf 2)  # Green
On_Yellow=$(tput sgr0)$(tput setaf 3) # Yellow
On_Blue=$(tput sgr0)$(tput setaf 4)   # Blue
On_Purple=$(tput sgr0)$(tput setaf 5) # Purple
On_Cyan=$(tput sgr0)$(tput setaf 6)   # Cyan
On_White=$(tput sgr0)$(tput setaf 7)  # White

# Dim
IBlack=$(tput dim)$(tput setaf 0)  # Black
IRed=$(tput dim)$(tput setaf 1)    # Red
IGreen=$(tput dim)$(tput setaf 2)  # Green
IYellow=$(tput dim)$(tput setaf 3) # Yellow
IBlue=$(tput dim)$(tput setaf 4)   # Blue
IPurple=$(tput dim)$(tput setaf 5) # Purple
ICyan=$(tput dim)$(tput setaf 6)   # Cyan
IWhite=$(tput dim)$(tput setaf 7)  # White

# High Intensity backgrounds
On_BBlack=$(tput bold)$(tput setab 0)  # Black
On_BRed=$(tput bold)$(tput setab 1)    # Red
On_BGreen=$(tput bold)$(tput setab 2)  # Green
On_BYellow=$(tput bold)$(tput setab 3) # Yellow
On_BBlue=$(tput bold)$(tput setab 4)   # Blue
On_BPurple=$(tput bold)$(tput setab 5) # Purple
On_BCyan=$(tput bold)$(tput setab 6)   # Cyan
On_BWhite=$(tput bold)$(tput setab 7)  # White

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
    venv=""
    # Environnements virtuels Python
    if [[ $VIRTUAL_ENV != "" ]]; then
        venv="$BGreen(${VIRTUAL_ENV##*/})$Color_Off "
    elif [[ $CONDA_DEFAULT_ENV != "" ]]; then
        venv="$BGreen(${CONDA_DEFAULT_ENV##*/})$Color_Off "
    # Environnements virtuels Ruby
    elif [ -f ~/.rvm/bin/rvm-prompt ]; then
        rvb=$(~/.rvm/bin/rvm-prompt)
        if [[ $rvb != "" ]]; then
            venv="$IRed($rvb)$Color_Off "
        fi
    fi
    echo -e $venv
}

# Choix des couleurs pour le prompt
if [[ $EUID == 0 ]]; then
    # Root
    User_Color=$Red
    BUser_Color=$BRed
elif [ -n "$STY" ]; then
    # Screen
    User_Color=$Yellow
    BUser_Color=$BYellow
elif [ -n "$TMUX" ]; then
    # tmux
    User_Color=$Yellow
    BUser_Color=$BYellow
elif [ -n "$SSH_CLIENT" ]; then
    # SSH
    User_Color=$Blue
    BUser_Color=$BBlue
else
    # Normal
    User_Color=$Green
    BUser_Color=$BGreen
fi

# Privilege
if [ "`id -u`" -eq 0 ]; then
    privilege='#'
else
    privilege='$'
fi

# Exit status
exitstatus(){
    if [ $? = 0 ]; then
        echo -e "$Green✔ $Color_Off"; 
    else
        echo -e "$Red✘ $Color_Off"; 
    fi
}

# Empêche virtualenv de changer le prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Configuration pour virtualenvwrapper
export WORKON_HOME=~/.venvs

venv="\$(virtualenv_info)"

# Mise en forme du prompt
export PS1="$Color_Off$Pipe_LU \$(exitstatus)$BBlue[\#] $Yellow(\D{%d-%m-%y} $BYellow\t$Yellow) $BUser_Color\u@$User_Color\h$Color_Off: $BPurple\w $BRed$privilege$Color_Off ${venv}\n$Pipe_LD$Pipe_End "

# Citation aléatoire (fortune-mod)
if [ -f /usr/games/fortune -a "$(id -u)" != 0 ]; then
    if [ -f /usr/games/cowsay -a "$(id -u)" != 0 ]; then
        /usr/games/fortune -as -n 100 | /usr/games/cowsay -f duck -W 60
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

# Modification locales
if [ -f ~/.bashrcdir/bashrc_local ]; then
    . ~/.bashrcdir/bashrc_local
fi
