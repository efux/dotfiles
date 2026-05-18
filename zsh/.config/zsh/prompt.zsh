autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{red}✗%f'
zstyle ':vcs_info:git:*' formats ' %F{yellow}git:(%F{red}%b%F{yellow})%f %u'
zstyle ':vcs_info:git:*' actionformats ' %F{yellow}git:(%F{red}%b%F{yellow}|%F{red}%a%F{yellow})%f %u'
precmd() { vcs_info }
setopt PROMPT_SUBST
PROMPT='%(?.%F{green}➜.%F{red}➜)%f %F{cyan}%c%f${vcs_info_msg_0_} '
