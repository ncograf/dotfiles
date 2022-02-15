#!/bin/bash

set_any(){
    TMUX_PROMPT_ANY_LEFT="[ "
    TMUX_PROMPT_ANY_RIGHT="]"
}

TMUX_PROMPT_BRANCH=""
TMUX_PROMPT_LAMBDA=""
TMUX_PROMPT_ANY_LEFT=""
TMUX_PROMPT_ANY_RIGHT=""
TMUX_PROMPT_ADDED=""
TMUX_PROMPT_UNTRACKED=""
TMUX_PROMPT_MODIFIED=""
TMUX_PROMPT_RENAMED=""
TMUX_PROMPT_DELETED=""
TMUX_PROMPT_STASHED=""
TMUX_PROMPT_UNMERGED=""
TMUX_PROMPT_AHEAD=""
TMUX_PROMPT_BEHIND=""


if $(git rev-parse --is-inside-work-tree); then
    TMUX_PROMPT_LAMBDA="λ: "
    TMUX_PROMPT_BRANCH="$(git branch --show-current) "
fi

INDEX=$(command git status --porcelain -b 2> /dev/null)

if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    TMUX_PROMPT_UNTRACKED=" "
    set_any
fi

if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    TMUX_PROMPT_ADDED="+ "
    set_any
elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    TMUX_PROMPT_ADDED="+ "
    set_any
elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    TMUX_PROMPT_ADDED="+ "
    set_any
fi

if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    TMUX_PROMPT_MODIFIED=" "
    set_any
elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    TMUX_PROMPT_MODIFIED=" "
    set_any
elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    TMUX_PROMPT_MODIFIED=" "
    set_any
elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    TMUX_PROMPT_MODIFIED=" "
    set_any
fi

if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    TMUX_PROMPT_RENAMED="➜ "
    set_any
fi

if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    TMUX_PROMPT_DELETED="x "
    set_any
elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    TMUX_PROMPT_DELETED="x "
    set_any
elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    TMUX_PROMPT_DELETED="x "
    set_any
fi

if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    TMUX_PROMPT_STASHED="! "
    set_any
fi

if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    TMUX_PROMPT_UNMERGED="═ "
    set_any
fi

if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    TMUX_PROMPT_AHEAD=" "
    set_any
fi

if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    TMUX_PROMPT_BEHIND=" "
    set_any
fi
echo "#[fg=yellow]${TMUX_PROMPT_LAMBDA}#[fg=blue]${TMUX_PROMPT_BRANCH}#[fg=white]${TMUX_PROMPT_ANY_LEFT}#[fg=green]${TMUX_PROMPT_ADDED}#[fg=blue]${TMUX_PROMPT_MODIFIED}#[fg=red]${TMUX_PROMPT_DELETED}#[fg=magenta]${TMUX_PROMPT_RENMAED}#[fg=yellow]${TMUX_PROMPT_UNMERGED}#[fg=white]${TMUX_PROMPT_UNTRACKED}#[fg=red]${TMUX_PROMPT_STASHED}#[fg=red]${TMUX_PROMPT_BEHIND}#[fg=green]${TMUX_PROMPT_AHEAD}#[fg=white]${TMUX_PROMPT_ANY_RIGHT}"
