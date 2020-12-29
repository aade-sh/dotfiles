# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


source $HOME/antigen.zsh
source $HOME/.cargo/env
export PATH=/usr/local/bin:$PATH
# mysql
export PATH=$PATH:/usr/local/mysql/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/aadeshchandra/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# ZSH_DISABLE_COMPFIX="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions zsh-nvm
)

# Declare the variable
# typeset -A ZSH_HIGHLIGHT_PATTERNS

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
# To have commands starting with `rm -rf` in red:
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=red,bold,bg=clear')
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# antigen bundle zsh-users/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle mdumitru/git-aliases
# antigen bundle davidparsson/zsh-nvm-lazy
# antigen apply

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export AWS_PROFILE=a2chan@dev
export SSH_KEY_PATH="~/.ssh"
export EDITOR='subl -w'
alias git-graph="git log --all --decorate --oneline --graph"
alias ls="lsd"
alias c.="code ."
alias cat="bat"
alias fd="fdfind"
alias help='tldr'
alias ping='prettyping --nolegend'
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias speed-test="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias yn="yarn"

# add support for ctrl+o to open selected file in VS Code
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"
export FZF_DEFAULT_COMMAND="rg --files"

. $HOME/z/z.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# start up ssh-agent on login
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# function blastoff(){
#     echo "🚀"
# }

# precmd_functions+=(blastoff)

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# utility functions
timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}



# Created by `userpath` on 2020-12-29 07:37:07
export PATH="$PATH:/Users/aadeshchandra/.local/bin"


# For compilers to find zlib you may need to set:
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"


autoload -U bashcompinit
bashcompinit

eval "$(starship init zsh)"

eval "$(register-python-argcomplete pipx)"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
