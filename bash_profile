# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Setup JAVA_HOME on MAC
if [ -e "/usr/libexec/java_home" ] 
then
    JAVA_HOME=`/usr/libexec/java_home`
    if [ $? -ne 0 ]; then
        echo "You need to install Java SDK to setup your JAVA_HOME"
    else
        export JAVA_HOME=`/usr/libexec/java_home`
    fi
fi

# My Own Android Developer Tools
if [ -d "$HOME/Library/Android/sdk" ]
then
    export ANDROID_HOME=$HOME/Library/Android/sdk
    export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
fi

# Short cut alias
alias tmux="TERM=screen-256color-bce tmux"

# Set ls color mode
platform='unknown'
unamestr=`uname -s`
if [[ "$unamestr" == 'Linux' ]]; then
    platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='freebsd'
fi

if [[ $platform == 'linux' ]]; then
    alias ls='ls --color=auto'
elif [[ $platform == 'freebsd' ]]; then
    export CLICOLOR=1
fi

export LANG=en_US.UTF-8

set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

if [ -f ~/.agent.env ] ; then
    . ~/.agent.env > /dev/null
    if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
        echo "Stale agent file found. Spawning new agent… "
        eval `ssh-agent | tee ~/.agent.env`
        ssh-add
    fi 
else
    echo "Starting ssh-agent"
    eval `ssh-agent | tee ~/.agent.env`
    ssh-add
fi

export GOPATH="/usr/local/opt/go"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

