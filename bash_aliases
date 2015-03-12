#################################
#####    Alias de Altay     #####
###  altay@rez-gif.supelec.fr ###
#################################

# Couleurs
JAUNE="\\033[0;33m"
ROUGE="\\033[0;31m"
VERT="\\033[0;32m"
NORMAL="\\033[0;0m"

# Alias pour ls
alias ls='ls --color=auto'
alias ll='ls -lAh'

# Alias pour grep
alias grpe='grep'
alias gerp='grep'
alias grep='grep --color=auto'

# Alias de navigation
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'

# Alias de sécurité
alias rm='rm --preserve-root'

# Alias quotidiens
alias ssudo='sudo -sE'
alias ss='ssudo'
alias sssh='teleport'

# Marche impériale
alias imperial-march="beep -l 350 -f 392 -D 100 --new -l 350 -f 392 -D 100 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 700 -f 392 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 250 -f 622.26 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 350 -f 369.99 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 700 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 739.98 -D 100 --new -l 25 -f 698.46 -D 100 --new -l 25 -f 659.26 -D 100 --new -l 25 -f 622.26 -D 100 --new -l 50 -f 659.26 -D 400 --new -l 25 -f 415.3 -D 200 --new -l 350 -f 554.36 -D 100 --new -l 250 -f 523.25 -D 100 --new -l 25 -f 493.88 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 25 -f 440 -D 100 --new -l 50 -f 466.16 -D 400 --new -l 25 -f 311.13 -D 200 --new -l 350 -f 369.99 -D 100 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 466.16 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 700 -f 587.32 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 739.98 -D 100 --new -l 25 -f 698.46 -D 100 --new -l 25 -f 659.26 -D 100 --new -l 25 -f 622.26 -D 100 --new -l 50 -f 659.26 -D 400 --new -l 25 -f 415.3 -D 200 --new -l 350 -f 554.36 -D 100 --new -l 250 -f 523.25 -D 100 --new -l 25 -f 493.88 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 25 -f 440 -D 100 --new -l 50 -f 466.16 -D 400 --new -l 25 -f 311.13 -D 200 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 300 -f 392.00 -D 150 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 700 -f 392"

# Lecture vidéo en ASCII Art
#function vid2ascii(){
#    local COMMAND="mplayer -monitorpixelaspect 0.5 -contrast 50 -quiet "
#    local LIB="-vo aa:driver=curses "
#    local EXECUTE=1
#    local OPTIONS=""
#    while getopts "chqv:" opt; do
#      echo -e "Plop : $opt" "\n"
#      case $opt in
#        c)
#            echo "Couleur"
#            LIB=" -vo caca:driver=curses " 
#        ;;
#        h)
#            echo -e "$VERT" "Aide de la fonction vid2ascii :" "\n"
#            echo -e "    - Utilisation : vid2ascii -v VIDEO --options" "\n"
#            echo -e "    - Liste des options :" "\n"
#            echo -e "        -h Affiche cette aide" "\n"
#            echo -e "        -c Active la couleur (libcaca)" "\n"
#            echo -e "        -s Silencieux, cache tous les messages mplayer" "\n"
#            echo -e "$NORMAL";
#            EXECUTE=0
#        ;;
#        q)
#            OPTIONS+=" -really-quiet "
#        ;;
#        v)
#            local VIDEO=$OPTARG
#        ;;
#        \?)
#            echo "Option invalide : -$OPTARG" >&2
#        ;;
#      esac
#      shift
#    done
#    if [[ $EXECUTE -eq 1 ]]; then
#        COMMAND+=" "
#        COMMAND+=$LIB
#        COMMAND+=" "
#        COMMAND+=$OPTIONS
#        COMMAND+=$VIDEO
#        echo "Lib " $LIB
#        echo "Options " $OPTIONS
#        echo "Video " $VIDEO
#        echo -e "$ROUGE" "Appuyez sur CTRL+C pour couper la vidéo" "$NORMAL"
#        eval $COMMAND
#    fi
#}
