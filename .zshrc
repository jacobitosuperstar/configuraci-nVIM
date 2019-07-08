#############################################
#Paths hechos para la ejecucion de programas#
#############################################

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

#PS1='\[$(tput setaf 27)\]\u$'; #user
#PS1+='\[$(tput setaf 195)\]@\h '; #host
#PS1+='\[$(tput setaf 142)\]\W -> '; #current directory
#PS1+='\[$(tput sgr0)\]'; #end of line so colors don't bleed out
#export PS1; #\[ begining  \] end, so the cursor doesn't get lost
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias ls='ls -GFh'

#activando el powerline
#POWERLEVEL9K_MODE='awesome-fontconfig'
source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vcs dir rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs status load)
