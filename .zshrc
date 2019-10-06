#MacOs

#############################################
#Paths hechos para la ejecucion de programas#
#############################################

export LC_ALL=en_US.UTF-8
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
export PATH=/usr/local/bin:/usr/local/sbin:~/bin:$PATH
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#############################################
# Personalizando el terminal para que tenga #
#             un buen perfil                #
#############################################

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#activando el powerline
#POWERLEVEL9K_MODE='awesome-fontconfig'
source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs dir rbenv ssh)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator status virtualenv)
