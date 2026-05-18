bindkey '^H' backward-kill-word

[[ -n "${key[Home]}" ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n "${key[End]}"  ]] && bindkey "${key[End]}"  end-of-line

stty erase '^?'
