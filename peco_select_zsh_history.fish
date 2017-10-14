function peco_select_zsh_history
  set -l query (commandline)

  if test -n $query
    set peco_flags --query "$query"
  end

  tail -r ~/.zsh_history | peco $peco_flags | read line

  if [ $line ]
    commandline $line
  else
    commandline -f repaint
  end
end
