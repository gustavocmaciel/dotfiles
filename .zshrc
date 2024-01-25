# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    copypath 
    docker
    git 
    golang
    ripgrep
    rust
    zsh-autosuggestions 
    zsh-syntax-highlighting 
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Set neovim as default editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Preview fzf results using bat
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"

# Use fd as the engine for fzf
export FZF_DEFAULT_COMMAND="fd --type f"

# fd will follow symlinks and include hidden files (but exclude .git folders
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

# Aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Protect files from overwriting
set -o noclobber

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
