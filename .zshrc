
# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=( 
  # battery 
  # git 
  # npm
  # node 
  # nvm
  # tmux
  # rvm
  # rbenv
  z 
  # extract 
  # vagrant
  # smt
  # pygmalion
  # nebirhos
  # muse 
  # dogenpunk
  # af-magic
  # colorize
  zsh-autosuggestions
  # zsh-syntax-highlighting
  # vi-mode
)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/skmecs/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# source $ZSH/oh-my-zsh.sh

# User configuration

# z freecent navigation
. $HOME/z.sh

# solve rvm promt problem
alias rvm-prompt=$HOME/.rvm/bin/rvm-prompt
source $ZSH/oh-my-zsh.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# st stuff
# function zle-line-init () { echoti smkx }
# function zle-line-finish () { echoti rmkx }
# zle -N zle-line-init
# zle -N zle-line-finish

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# source /home/skmecs/builds/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Install Ruby Gems to ~/gems
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
WINEPREFIX=/home/skmecs/.wine
[ -f "/home/skmecs/.ghcup/env" ] && source "/home/skmecs/.ghcup/env" # ghcup-env

export PATH="$HOME/.local/share/yabridge:$PATH"
# if [ -d "$HOME/Apps/wine-6.6-staging-tkg-amd64/bin/"  ] ; then
#         PATH="$HOME/Apps/wine-6.6-staging-tkg-amd64/bin/:$PATH"
# fi
# export WINEFSYNC=1

export PATH="$HOME/.yarn/bin:$PATH"
[ -f "/home/skmecs/.ghcup/env" ] && source "/home/skmecs/.ghcup/env" # ghcup-env

# Atlassian dotfiles method. As in: https://www.atlassian.com/git/tutorials/dotfiles ##############
# create an alias config which we will use instead of the regular git when we want to interact with our configuration repository
# alias config='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
# set a flag - local to the repository - to hide files we are not explicitly tracking
# config config --local status.showUntrackedFiles no
# alias config='/usr/bin/git --git-dir=/home/skmecs/dotfiles.git/ --work-tree=/home/skmecs'
#
# Ansible stuff
    # ssh agent
alias ssha='eval $(ssh-agent) && ssh-add' 

# alias polyglot_client='$HOME/Apps/Polyglot/run-client.py'
# alias polyglot_server='$HOME/Apps/Polyglot/run-server.py'
# export PATH="$HOME/Apps/Polyglot/run-client.py:$PATH"
# export PATH="$HOME/Carabiner:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"
# export PATH="$HOME/.nvm/versions/node/v16.17.1/bin/prettier:$PATH"
# export PATH="/usr/local/bin/wemux:$PATH"
# perl
# if (command -v perl && command -v cpanm) >/dev/null 2>&1; then
#  test -d "$HOME/perl5/lib/perl5" && eval $(perl -I "$HOME/perl5/lib/perl5" -Mlocal::lib)
# fi
# alsactl --file ~/.config/asound.state restore

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# bun completions
[ -s "/home/skmecs/.bun/_bun" ] && source "/home/skmecs/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
