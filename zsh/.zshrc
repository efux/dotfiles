# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Aliases
alias gc="git commit -a"
alias vim="nvim"
alias nn='new-note'

bindkey '^H' backward-kill-word

# Functions
dev() {
  local base_dir="/home/efux/Documents/dev"

  if [[ $# -eq 0 ]]; then
    cd "$base_dir" || return
  elif [[ "$1" == "-s" ]]; then
    local selected
    selected=$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d | sed "s|$base_dir/||" | fzf)
    if [[ -n "$selected" ]]; then
      cd "$base_dir/$selected" || return
    fi
  else
    if [[ -d "$base_dir/$1" ]]; then
      cd "$base_dir/$1" || return
    else
      echo "Directory not found: $1"
      return 1
    fi
  fi
}

# Completion function
_dev_completion() {
  local base_dir="$HOME/Documents/dev"
  local -a dirs

  dirs=(${(f)"$(find "$base_dir" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"})

  _describe 'dev directories' dirs
}

n() {
  local file
  file=$(find ~/Documents/notes -type f | fzf) || return
  nvim "$file"
}

mod() { 
	if [[ -d ~/Documents/hslu/$1 ]] then
		cd ~/Documents/hslu/$1; 
	else
		filename="summary.md"
		mkdir -p ~/Documents/hslu/$1/summary;
		cd ~/Documents/hslu/$1; 
		git init
		touch $filename

		# Create content of the README.md file
		echo "#" $1 >> $filename
		echo >> $filename
		echo "Der Inhalt der Zusammenfassung des Moduls $1 ist wie folgt aufgebaut:" >> $filename

		vim + $filename
	fi
}

# autocomplete projectname for my own functions
compctl -W ~/Documents/dev -/ dev
compctl -W ~/Documents/hslu -/ mod

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=50000
HISTFILE=~/.zsh_history
SAVEHIST=50000

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line

# correction of the backspace problem in vim
stty erase '^?'
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# lean-ctx shell hook — begin
if [ -f "/home/efux/.config/lean-ctx/shell-hook.zsh" ]; then
. "/home/efux/.config/lean-ctx/shell-hook.zsh"
fi
# lean-ctx shell hook — end

# >>> lean-ctx agent aliases >>>
alias claude='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" claude'
alias codex='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" codex'
alias gemini='LEAN_CTX_AGENT=1 BASH_ENV="$HOME/.bashenv" gemini'
# <<< lean-ctx agent aliases <<<
