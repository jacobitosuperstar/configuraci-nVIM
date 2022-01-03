#MacOs

#############################################
#Paths hechos para la ejecucion de programas#
#############################################

export LC_ALL=en_US.UTF-8
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#############################################
#          Lazy person neoVIm               #
#############################################

# alias v="nvim"
# alias vim="nvim"
GIT_EDITOR="vim"

# alias v="vim"
# alias vim="vim"

#############################################
# remover el paquete con sus dependencias   #
#############################################

# brew leaves --> muestra sólo los paquetes de primer nivel
# brew tap beeftornado/rmtree --> checkear que esté la funcionalidad
# brew rmtree <package> --> remueve todo el árbol de dependencias

#############################################
# El ambiente virtual en mi carpeta base de #
# proyecto                                  #
#############################################

export PIPENV_VENV_IN_PROJECT=1

#############################################
# Terminal 256 colores                      #
#############################################

export TERM="xterm-256color"
alias tmux="TERM=screen-256color-bce tmux"

#############################################
# cambiando la frecuencia de tiempo de time #
# machine                                   #
#############################################

# el último valor de la línea es el tiempo en segundos para hacer el backup

# default
# sudo defaults write /System/Library/LaunchDaemons/com.apple.backupd-auto StartInterval -int 3600

# modificado
# sudo defaults write /System/Library/LaunchDaemons/com.apple.backupd-auto StartInterval -int 18000

############################
# GoogleCloud Autocomplete #
############################

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jacobo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jacobo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jacobo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jacobo/google-cloud-sdk/completion.zsh.inc'; fi

# esporting basic colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Starship
eval "$(starship init zsh)"
