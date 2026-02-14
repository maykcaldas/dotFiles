autoload -U promptinit && promptinit
prompt fade gray

alias l="ls --color=always"
alias ..="cd .."
alias sshbh='ssh mcaldasr@bluehive.circ.rochester.edu'
alias cdwl="cd $HOME/Documents/WhiteLab"
alias du="du -hsc "

alias gmx2022="source /Users/maykcaldas/Programs/gromacs-2022.2/gmx/bin/GMXRC.bash"
alias vmd="csh /Applications/VMD\ 1.9.4.app/Contents/MacOS/startup.command.csh"

# JINA_CLI_BEGIN

## autocomplete
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _jina jina

_jina() {
  local words completions
  read -cA words

  if [ "${#words}" -eq 2 ]; then
    completions="$(jina commands)"
  else
    completions="$(jina completions ${words[2,-2]})"
  fi

  reply=(${(ps:
:)completions})
}

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# JINA_CLI_END

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# bun completions
[ -s "/Users/maykcaldas/.bun/_bun" ] && source "/Users/maykcaldas/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. "$HOME/.local/bin/env"
