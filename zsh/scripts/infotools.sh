#!/usr/bin/zsh

# some usefull display commands to see learn my system
# kind of like anki on the fly

prompt_info()
{
  echo -e "\e[0;32m+ \e[0m git added"
  echo -e "\e[0;34m \e[0m git modified"
  echo -e "\e[0;31mx \e[0m git deleted"
  echo -e "\e[0;35m➜ \e[0m git renamed"
  echo -e "\e[0;33m= \e[0m git unmerged"
  echo -e "\e[0;37m \e[0m git untracked"
  echo -e "\e[0;31m \e[0m git stashed"
  echo -e "\e[0;31m \e[0m git behind"
  echo -e "\e[0;32m \e[0m git ahead"
}

fzf_info()
{
    echo "\n Fuzzy find info in short\n"
    echo "CTRL + t - Search for a file in the current direcotry\n"
    echo "CTRL + r - Search for a entry in the command histroy\n"
    echo "ALT + c - Allow you to select a sub-directory and make it your wokring directory\n"
    echo "kill followed by TAB - select process to kill\n"
}

tmux_info()
{
    echo "\nTmux info in short\n
        Ctrl + Space                                    - Prefix \n
        prefix r                                        - reload tmux config \n
        prefix v                                        - Split window vertically \n
        prefix h                                        - Split window horizontally \n
        Ctrl + {h;j;k;l}                                - switch between windowns\n
        Ctrl + g                                        - clean the shell\n
        prefix n                                        - rename window\n
        prefix w                                        - create window\n
        prefix j                                        - go to previous window\n
        prefix k                                        - go to next window\n
        prefix [                                        - enter copy mode\n
        prefix p                                        - paste form clipboard\n
        preifx /                                        - search in the shell output (copycat plugin)\n
        preifx TAB                                      - fuzzyfind in the current pane\n
        tmux list-sessions                              - List the tmux sessions open.\n
        tmux attach-sessions -t <session_name>          - Attach the session named ... to the client\n
        tmux new-sessions -t <session_name>             - Create teh session name ...\n
        tmux kill-sessions -t <session_name>            - Kill the session named ...\n
        tmux kill-server                                - Kill the server and all sessions\n
        prefix SHIFT + I                                - install plugins \n
        \n\ntodo explore copycat" | less
}

i()
{
  echo "prompt_info() - info for the prompt\n"
  echo "fzf_info() - fuzzy find info (known commands)\n"
  echo "tmux_info() - tmux settings and so on (known commands)\n"
  echo "d - bind last 10 visited direcotries to the numbers 1 to 10 or so\n"
  echo "(NORMAL MODE) v - edit command in vim (you get to normal mode with jj\n"
}
