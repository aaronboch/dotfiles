#!/usr/bin/env fish

# Helper functions
function info
    set_color cyan
    echo "[INFO] $argv"
    set_color normal
end

function success
    set_color green
    echo "[OK] $argv"
    set_color normal
end

function warn
    set_color yellow
    echo "[WARN] $argv"
    set_color normal
end

set script_dir (dirname (status -f))
info "Script directory: $script_dir"
set config_dir $HOME/.config
info "Config directory: $config_dir"

#Add ignored items to this list to skip them
set ignored_items (basename (status -f)) README.md

function manage --argument mode
    echo "This will modify files in $config_dir. Continue? [y/N]"
    read -l confirm
    if not string match -iq y $confirm
        warn "Aborted."
        return
    end
    #Loop over all folders in scripts directory
    # and backups them by mv * to *.bak 
    for item in $script_dir/*
        # Skip ignored_items list
        if contains (basename $item) $ignored_items
            info "Skipped $item"
            continue
        end
        #Skip Git-related files/folders
        if string match -qr '\.git' (basename $item)
            continue
        end

        # Original folder in ~/.config
        set target $config_dir/(basename $item)
        info (basename $item) ": found target $target"

        #backup target by renaming .bak
        switch $mode
            case deploy
                #backs up existing dotfiles and deploys
                set skip_symlink 0
                if test -e $target
                    if not test -L $target
                        set backup "$target.bak"
                        if test -e $backup
                            warn "$backup already exists skipping symlink creation"
                            set skip_symlink 1
                        else
                            mv $target "$target.bak"
                            success "Backing up $target to $backup"
                        end
                    else
                        info "$target is a symlink no backup made"
                    end
                end
                # symlinks from dotfiles/* to .config/*
                if test $skip_symlink -eq 0
                    if test -L $target
                        warn "Deleting existing symlink: $target"
                        rm $target
                    end
                    success "Linking $item → $target"
                    ln -s $item $target
                end
            case restore
                #removes symlinks and restores existing backups
                if test -L $target
                    success "Deleting symlink $target"
                    rm $target
                else if test -e $target
                    warn "$target exists and is not a symlink, skipping"
                    continue
                end
                if test -e "$target.bak"
                    mv "$target.bak" "$target"
                    success "Restored $target"
                else
                    warn "No backup found for $target"
                end
        end
    end
end

echo "Do you want to (d)eploy and backup or (r)estore backups? [d/r]"
read choice
switch $choice
    case d
        manage deploy
    case r
        manage restore
    case '*'
        warn "Aborted."
end
