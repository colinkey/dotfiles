# OMZ CONFIG START
#
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="amuse"
HYPHEN_INSENSITIVE="true"
plugins=(git asdf)
source $ZSH/oh-my-zsh.sh
#
# OMZ CONFIG END

DEFAULT_USER=whoami

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:~/.local/bin
source $HOME/.aliases

# start asdf
export ASDF_CONFIG_FILE="$HOME/.asdf-config/.asdfrc"
export ASDF_NPM_DEFAULT_PACKAGES_FILE="$HOME/.asdf-config/.default-npm-packages"
export ASDF_GEM_DEFAULT_PACKAGES_FILE="$HOME/.asdf-config/.default-gems"
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
# asdf end

# fzf start
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf end

# pnpm start
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zoxide start
eval "$(zoxide init zsh)"
# zoxide end
