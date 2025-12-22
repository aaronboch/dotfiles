set fish_greeting

alias ff fastfetch
alias c clear
alias e exit
alias coder "code -r"
alias hx helix
# Replace ls with eza
alias ls='eza --icons'
alias ll='eza -l --icons'
alias la='eza -a --icons'
alias l='eza -lh --icons'

# Functions from razzius/fish-functions github
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

bind ! __history_previous_command
bind '$' __history_previous_command_arguments

function backup --argument filename
    cp $filename $filename.bak
end
abbr -a bk backup

function restore --argument file
    mv $file (echo $file | sed s/.bak//)
end
abbr -a re restore

# End of functions

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

fish_add_path /home/aaron/.spicetify
