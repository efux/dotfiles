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

# Functions
dev() { 
	if [[ -d ~/Documents/dev/$1 ]] then
		cd ~/Documents/dev/$1; 
	else
		mkdir -p ~/Documents/dev/$1;
		cd ~/Documents/dev/$1; 
		git init
		git remote add origin git@github.com:efux/$1.git
		touch README.md

		# Create content of the README.md file
		echo $1 >> README.md
		echo "===============" >> README.md
		echo >> README.md
		echo Goals of this project >> README.md
		echo "---------------" >> README.md
		echo >> README.md

		vim + README.md
	fi
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
