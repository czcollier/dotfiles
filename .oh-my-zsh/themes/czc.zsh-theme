local ret_status="%(?:%{$FG[194]%}➜ :%{$FG[219]%}➜ %s)"
PROMPT='${ret_status}%{$FG[066]%}%p %{$fg[067]%}%c %{$FG[103]%}$(git_prompt_info)%{$FG[103]%}%{$fg[067]%}$ % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="[%{$FG[240]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[103]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[089]%}!%{$FG[103]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[103]%}"
