#################################
#####    Alias de Altay     #####
###  altay@rez-gif.supelec.fr ###
#################################

# Alias pour ls
alias ls='ls --color=auto'
alias ll='ls -lAh'

# Alias pour grep
alias grpe='grep'
alias gerp='grep'
alias grep='grep --color=auto'

# Alias de navigation
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../..'

# Alias de sécurité
alias rm='rm --preserve-root'

# Alias quotidiens
alias ssudo='sudo -sE'
alias ss='ssudo'
alias sudo='sudo -E'

# Recharge le bashrc
alias resetbashrc='source ~/.bashrc'

# Récupérer son IP externe
alias myip='wget -qO- http://icanhazip.com'

# Afficher l'heure actuelle
alias now='date +"%T"'

# Sortie de mount plus lisible
alias mount='mount | column -t'

# Affiche le ports ouverts
alias ports='netstat -tu'

# Mise à jour toute en un
alias update='sudo apt update && sudo apt dist-upgrade'
alias safe-update='sudo apt update && sudo apt upgrade'

# Toujours permettre de continuer un téléchargement wget interrompu
alias wget='wget -c'

# Copie le contenu d'un fichier dans le presse-papier
alias copy='xsel -i --clipboard <'

# Ouvrir l'explorateur dans le dossier courant
alias nemo='nemo .'
alias nautilus='nautilus .'
alias thunar='thunar .'
alias caja='caja .'

# IPython Notebook
alias inb='jupyter notebook'

# Met à jour tous les paquets pip
alias pipupgrade="pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"

# Marche impériale
alias imperial-march="beep -l 350 -f 392 -D 100 --new -l 350 -f 392 -D 100 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 700 -f 392 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 350 -f 587.32 -D 100 --new -l 250 -f 622.26 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 350 -f 369.99 -D 100 --new -l 250 -f 311.1 -D 100 --new -l 25 -f 466.2 -D 100 --new -l 700 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 739.98 -D 100 --new -l 25 -f 698.46 -D 100 --new -l 25 -f 659.26 -D 100 --new -l 25 -f 622.26 -D 100 --new -l 50 -f 659.26 -D 400 --new -l 25 -f 415.3 -D 200 --new -l 350 -f 554.36 -D 100 --new -l 250 -f 523.25 -D 100 --new -l 25 -f 493.88 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 25 -f 440 -D 100 --new -l 50 -f 466.16 -D 400 --new -l 25 -f 311.13 -D 200 --new -l 350 -f 369.99 -D 100 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 466.16 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 700 -f 587.32 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 392 -D 100 --new -l 25 -f 392 -D 100 --new -l 350 -f 784 -D 100 --new -l 250 -f 739.98 -D 100 --new -l 25 -f 698.46 -D 100 --new -l 25 -f 659.26 -D 100 --new -l 25 -f 622.26 -D 100 --new -l 50 -f 659.26 -D 400 --new -l 25 -f 415.3 -D 200 --new -l 350 -f 554.36 -D 100 --new -l 250 -f 523.25 -D 100 --new -l 25 -f 493.88 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 25 -f 440 -D 100 --new -l 50 -f 466.16 -D 400 --new -l 25 -f 311.13 -D 200 --new -l 350 -f 392 -D 100 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 300 -f 392.00 -D 150 --new -l 250 -f 311.13 -D 100 --new -l 25 -f 466.16 -D 100 --new -l 700 -f 392"

# Tue un processus en fonction de son nom
function kill_by_name(){
    kill `ps -ef | grep $1 | grep -v grep | cut -d ' ' -f 3`
}

alias killn='kill_by_name'

# Simule une écriture au clavier 
function faketype(){
    echo -e "$*" | pv -qL 10
}

# Lecture vidéo en ASCII Art
function vid2ascii(){
    # Vérifie la présence de mplayer
    command -v mplayer >/dev/null 2>&1 || { echo -e >&2 "$ROUGE" "Cette fonction nécessite mplayer." "$NORMAL"; return; }
    # Vérifie la présence de libaa
    ldconfig -p | grep libaa.so >/dev/null 2>&1 || { echo -e >&2 "$ROUGE" "Cette option nécessite que libaa soit présente sur le système." "$NORMAL"; return; }

    # Rend local OPTIND (pour getopt)
    local OPTIND opt c h q v
    # Commande player de base
    # -monitorpixelaspect : définit le ratio largeur/hauteur (1/2 permet de compenser la taille des caractères)
    # -contrast 50 : pousse le contraste pour avoir une meilleure différence noire/blanc
    # -quiet : supprime le HUD Mplayer
    # -nolirc : désactive le support des télécommandes et fait disparaître deux messages d'erreurs inutiles
    local COMMAND="mplayer -monitorpixelaspect 0.5 -contrast 50 -quiet -nolirc "
    # Par défaut, on utilise aa sous ncurses pour l'affichage
    local LIB="-vo aa:driver=curses "
    local OPTIONS=""
    local FORCE_DRIVER=""
    local VIDEO=""
    local EXECUTE=1

    # Récupération des arguments
    while getopts "chqv:" opt; do
      case $opt in
        # Couleur (color)
        c)
            # Vérifie la présence de libcaca
            ldconfig -p | grep libcaca.so >/dev/null 2>&1 || { echo -e >&2 "$ROUGE" "Cette option nécessite que libcaca soit présente sur le système." "$NORMAL"; return; }
            # Force la variable CACA_DRIVER pour l'utilisation de ncurses
            # (caca ne supporte pas la directive caca:driver=curses)
            FORCE_DRIVER='CACA_DRIVER=ncurses'
            LIB=" -vo caca " 
            ;;
        # Aide (help)
        h)
            echo -e "$VERT" "Aide de la fonction vid2ascii :" "\n"
            echo -e "    - Utilisation : vid2ascii -v VIDEO --options" "\n"
            echo -e "    - Liste des options :" "\n"
            echo -e "        -h Affiche cette aide" "\n"
            echo -e "        -c Active la couleur (libcaca)" "\n"
            echo -e "        -q Silencieux, cache tous les messages mplayer" "\n"
            echo -e "$NORMAL";
            EXECUTE=0
            ;;
        # Silencieux (quiet)
        # Supprime encore plus de messages mplayer
        q)
            OPTIONS+=" -really-quiet "
            ;;
        # Vidéo (video)
        # Nécessite un argument
        v)
            VIDEO="\"${OPTARG}\""
            ;;
        # Option par défaut (inconnue)
        \?)
            echo "Option inconnue : -$OPTARG" >&2
            EXECUTE=0
            ;;
      esac
    done
    if [[ $EXECUTE -eq 1 ]]; then
        # Affiche et exécute la commande
        echo $FORCE_DRIVER $COMMAND $LIB $OPTIONS $VIDEO
        echo -e "$ROUGE" "Appuyez sur q ou bien faites CTRL+C pour couper la vidéo" "$NORMAL"
        eval $FORCE_DRIVER $COMMAND $LIB $OPTIONS $VIDEO
    fi
}

alias nvidia-smi='watch -t -n 1 nvidia-smi'
