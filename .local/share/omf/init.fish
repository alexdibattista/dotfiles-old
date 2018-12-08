# Set OMF_CONFIG if not set.
if not set -q OMF_CONFIG
  set -q XDG_CONFIG_HOME; or set -l XDG_CONFIG_HOME "$HOME/.config"
  set -gx OMF_CONFIG "$XDG_CONFIG_HOME/omf"
end

set fish_greeting
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x PYENV_ROOT /Users/alexanderdibattista/.pyenv

# Source custom before.init.fish file
test -f $OMF_CONFIG/before.init.fish
  and source $OMF_CONFIG/before.init.fish ^/dev/null
emit perf:timer:start "Oh My Fish initialisation"
# Read current theme
test -f $OMF_CONFIG/theme
  and read -l theme < $OMF_CONFIG/theme
  or set -l theme default
# Prepare Oh My Fish paths
set -l core_function_path $OMF_PATH/lib{,/git}
set -l theme_function_path {$OMF_CONFIG,$OMF_PATH}/themes*/$theme{,/functions}
# Autoload core library
set fish_function_path $fish_function_path[1] \
                       $core_function_path \
                       $theme_function_path \
                       $fish_function_path[2..-1]
# Require all packages
emit perf:timer:start "Oh My Fish init installed packages"
require --path {$OMF_PATH,$OMF_CONFIG}/pkg/*
emit perf:timer:finish "Oh My Fish init installed packages"
# Backup key bindings
functions -q fish_user_key_bindings
  and not functions -q __original_fish_user_key_bindings
  and functions -c fish_user_key_bindings __original_fish_user_key_bindings
# Override key bindings, calling original if existent
function fish_user_key_bindings
  test -f $OMF_CONFIG/theme
    and read -l theme < $OMF_CONFIG/theme
    or set -l theme default
  # Prepare packages key bindings paths
  set -l key_bindings $OMF_CONFIG/key_binding?.fish \
                      {$OMF_CONFIG,$OMF_PATH}/pkg/*/key_bindings.fish \
                      {$OMF_CONFIG,$OMF_PATH}/themes/$theme/key_binding?.fish
  # Source all keybindings collected
  for file in $key_bindings
    source $file
  end
  # Call original key bindings if existent
  functions -q __original_fish_user_key_bindings
    and __original_fish_user_key_bindings
end
emit perf:timer:start "Oh My Fish init user config path"
require --no-bundle --path $OMF_CONFIG

function serv
  command python -m SimpleHTTPServer
end


function grep
  command grep --color=auto
end


function b --argument args path
  command bundle exec $args $path
end

function l
  command ls -ls
end

function ll
  command tree --dirsfirst -ChFupDaLg 1
end

function weather
  command curl -4 wttr.in/toronto
end

function moon
  command curl wttr.in/Moon
end

  function vim --argument args
  command nvim $args
end


# Git
function ga
  command git add
end

function gcm --argument msg
  command git commit -m $msg
end

function gc
  command git checkout
end

function gb
  command git branch
end

function gs
  command git status
end

function gwc
  command git whatchanged -p --abbrev-commit --pretty=medium
end

function gd --argument args
  command git diff $args
end

function gundo
  command git reset --soft HEAD~1
end

function gclear
  command git clean -fdx
end

function gl
  command git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit
end


# GF3

set -x EDITOR nvim
set -x FZF_LEGACY_KEYBINDINGS 0
set -x GREP_COLOR "1;37;45"

# Paths
test -d /usr/local/share/npm/bin             ; and set PATH /usr/local/share/npm/bin $PATH
test -d /usr/local/racket/bin                ; and set PATH /usr/local/racket/bin $PATH
test -d /usr/local/heroku/bin                ; and set PATH /usr/local/heroku/bin $PATH
test -d /usr/local/sbin                      ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin                       ; and set PATH /usr/local/bin $PATH
test -d ~/.cabal/bin                         ; and set PATH ~/.cabal/bin $PATH
test -d ~/Library/Python/2.7/bin             ; and set PATH ~/Library/Python/2.7/bin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end
alias vtop="vtop --theme acid"

# Utilities
function b        ; bundle exec $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function f        ; foreman run bundle exec $argv ; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function lookbusy ; cat /dev/urandom | hexdump -C | grep --color "ca fe" ; end
function mp       ; nvim $argv ; end
function rkt      ; racket -il xrepl $argv ; end
function t        ; command tree -C $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function view     ; nvim -R $argv ; end
function h        ; history; end
function config   ; command code  ~/.local/share/omf/init.fish ; end
function sf       ; source  ~/.local/share/omf/init.fish ; end
function fuck     ; kill -9 $argv ; end
function psf      ; ps | grep $argv ; end
function diff     ; colordiff $argv; end

# Ethereum
function eth      ; command ganache-cli -s bonus place casino apology auto safe cook vocal ice unfold amazing cram -b 3 ; end
function eth15      ; command ganache-cli -s bonus place casino apology auto safe cook vocal ice unfold amazing cram -b 9 ; end

set -x FZF_DEFAULT_COMMAND 'ag -g ""'

# Fuzzy find & vim
function vf
  if test (count $argv) -gt 0
    command nvim $argv
  else
    fzf -m -f node_modules | xargs nvim
  end
end
# # View files/dirs
# function c
#   if test (count $argv) -eq 0
#     tree --dirsfirst -aFCNL 1 ./
#     return
#   end

#   for i in $argv
#     set_color yellow
#     if test (count $argv) -gt 1; echo "$i:" 1>&2; end
#     set_color normal

#     if test -e $i; and test -r $i
#       if test -d $i
#         tree --dirsfirst -aFCNL 1 $i
#       else
#         pygmentize -O style=monokai -f console256 -g $i
#       end
#     else
#       set_color red
#       echo "Cannot open: $i" 1>&2
#     end

#     set_color normal
#   end
# end


# if eval [[ -n eval $VIRTUAL_ENV && -e "$VIRTUAL_ENV/bin/activate" ]]
 # command source activate $VIRTUAL_ENV/bin/activate.fish
# end

function l; c $argv; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion b 'bundle exec'
make_completion f 'foreman run'
make_completion g 'git'
make_completion vim 'nvim'


# iterm2
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


emit perf:timer:finish "Oh My Fish init user config path"
emit perf:timer:finish "Oh My Fish initialisation"

# set fish_function_path $fish_function_path "/Users/alexanderdibattista/Library/Python/2.7/lib/python/site-packages/powerline/bindings/fish"
# powerline-setup
# source /Users/alexanderdibattista/.pyenv/versions/anaconda3-5.2.0/etc/fish/conf.d/conda.fish
# set -g theme_powerline_fonts no
# set -g theme_nerd_fonts yes
status --is-interactive; and source (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
