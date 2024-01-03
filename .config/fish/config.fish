if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_git_prompt_untracked_files no
    set -g theme_svn_prompt_enabled yes
end

set -e fish_user_paths

alias vim='nvim'
#
set HIST_STAMPS "yyyy-mm-dd"
#
#
set -g GEM_HOME "$HOME/gems" $GEM_HOME
set -g PATH "$HOME/gems/bin:$PATH" $PATH
set -g  WINEPREFIX "$HOME/.wine"
#
# export PATH "(HOME)/.local/share/yabridge:(PATH)"
#
# [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
#
# # Ansible stuff
#     # ssh agent
# alias ssha 'eval (ssh-agent) && ssh-add'
#
# export LC_CTYPE en_US.UTF-8
#
# # Preferred editor for local and remote sessions
# if [ -n (SSH_CONNECTION) ];
#   export EDITOR 'nvim'
# else
#   export EDITOR 'vim'
# end
