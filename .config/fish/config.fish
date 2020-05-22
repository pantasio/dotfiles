# ------------------------------------
#set theme_color_scheme gruvbox
#set theme_color_scheme bobthefish
set theme_color_scheme dracula

set -g theme_display_git yes
# set -g theme_display_git_dirty no
# set -g theme_display_git_untracked no
# set -g theme_display_git_ahead_verbose yes
# set -g theme_display_git_dirty_verbose yes
# set -g theme_display_git_stashed_verbose yes
# set -g theme_display_git_master_branch yes
# set -g theme_git_worktree_support yes
# set -g theme_use_abbreviated_branch_name no
# set -g theme_display_vagrant yes
# set -g theme_display_docker_machine no
# set -g theme_display_k8s_context yes
# set -g theme_display_hg yes
# set -g theme_display_virtualenv no
# set -g theme_display_nix no
# set -g theme_display_ruby no
# set -g theme_display_nvm yes
# set -g theme_display_user ssh
# set -g theme_display_hostname ssh
# set -g theme_display_vi no
# set -g theme_display_date yes
# set -g theme_display_cmd_duration yes
# set -g theme_title_display_process yes
# set -g theme_title_display_path yes
# set -g theme_title_display_user yes
# set -g theme_title_use_abbreviated_path no
# set -g theme_date_format "+%a %H:%M"
# set -g theme_date_timezone America/Los_Angeles
# set -g theme_avoid_ambiguous_glyphs yes
# set -g theme_powerline_fonts no
# set -g theme_nerd_fonts yes
# set -g theme_show_exit_status yes
# set -g theme_display_jobs_verbose yes
set -g default_user your_normal_user
set -g theme_color_scheme solarized
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '
#

# ------------------------------------
######

source ~/.config/fish/aliases.fish          # Aliases
source ~/.config/fish/chpwd.fish            # goto home dir and list file
source ~/.config/fish/sshd.fish             # start ssh agent when use fish






######

alias docker='docker.exe'
alias vim='nvim'
alias reloadfish='source ~/.config/fish/config.fish'
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ll='ls -al'

######
export DOCKER_HOST=tcp://localhost:2375

# Useful functions {{{

function ef; nvim ~/.config/fish/config.fish; end
function rf; source ~/.config/fish/config.fish && echo 'reload config.fish DONE!!!'; end

function et; nvim ~/.tmux.conf; end
function ev; nvim ~/.config/nvim/init.vim; end
#function rv; source ~/.config/nvim/init.vim && echo 'reload init.vim DONE!!!'; end
function eg; nvim ~/.config/git/config; end

# Config ssh
# ssh-keygen -t rsa -b 4096 -C "hoang.lduc@gmail.com"
function essh; nvim ~/.ssh/config; end

# go into tmux profile
function etmux; ~/workspace/getall/get.all; end

# Add editorconfig to project
function addeditorconfig; wget https://raw.githubusercontent.com/pantasio/dotfiles/master/.editorconfig; end

#function ed; vim ~/.vim/custom-dictionary.utf-8.add; end
#function ef; vim ~/.config/fish/config.fish; end
#function eff; vim ~/.config/fish/functions; end
#function eh; vim ~/.hgrc; end
#function ei; vim ~/Dropbox/inventory.markdown; end
#function ek; vim ~/lib/dotfiles/keymando/keymandorc.rb; end
#function em; vim ~/.mutt/muttrc; end
#function ep; vim ~/.pentadactylrc; end

function ..;    cd ..; end
function ...;   cd ../..; end
function ....;  cd ../../..; end
function .....; cd ../../../..; end

# Help document {{{
#
# 1. Fish Shelp
function helpf; nvim /mnt/d/cli-help/Fish/README.md; end
function helpv; nvim /mnt/d/cli-help/Nvim/README.md; end
function helpt; nvim /mnt/d/cli-help/Tmux/README.md; end
function helpg; nvim /mnt/d/cli-help/Git/README.md; end


#
# }}}

# I give up

#alias :q exit
#alias :qa exit

# Completions {{{

# function make_completion --argument alias command
#     complete -c $alias -xa "(
#         set -l cmd (commandline -pc | sed -e 's/^ *\S\+ *//' );
#         complete -C\"$command \$cmd\";
#     )"
# end
#
# make_completion g "git"
#
# }}}
#

# Fish Cursor{{{
# Set the cursor shapes for the different vi modes.

set fish_cursor_default     line      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# }}}
. ~/.config/fish/z.fish
























# '''''''''''''''''''''''''''''''''''''''''
# SSH-Agent
# '''''''''''''''''''''''''''''''''''''''''
# if test -z (pgrep ssh-agent)
#     eval (ssh-agent -c)
#     set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
#     set -Ux SSH_AGENT_PID $SSH_AGENT_PID
#     set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
# end

if test -z "$SSH_ENV"
    set -xg SSH_ENV $HOME/.ssh/environment
end

if not __ssh_agent_is_started
    __ssh_agent_start
end


# }}}
cd ~
