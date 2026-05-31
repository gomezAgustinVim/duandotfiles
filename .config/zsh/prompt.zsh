autoload -Uz vcs_info
precmd () { vcs_info }

zstyle ':vcs_info:*'     enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr '%F{red}!%f'
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:git:*' formats       '%b %u%c'
zstyle ':vcs_info:git:*' actionformats '%b %u%c %a'

setopt PROMPT_SUBST        # enable command substitution in prompt

PROMPT='%K{235}%F{255} %B%n%b %k%K{237}%F{255} %1~ %k%K{240}%F{255} ${vcs_info_msg_0_} %k %B%F{139}>%b%f '
RPROMPT='%F{255}%B%*%b%f'
