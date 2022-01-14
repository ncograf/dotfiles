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
  echo "CTRL + t - Search for a file in the current direcotry"
  echo "CTRL + r - Search for a entry in the command histroy"
  echo "ALT + c - Allow you to select a sub-directory and make it your wokring directory"
  echo "kill followed by TAB - select process to kill"
}

c_info()
{
  echo "prompt_info() - info for the prompt"
  echo "fzf_info() - fuzzy find info (known commands)"
  echo "d - bind last 10 visited direcotries to the numbers 1 to 10 or so"
  echo "(NORMAL MODE) v - edit command in vim (you get to normal mode with jj"
}
