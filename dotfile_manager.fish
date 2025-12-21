#!/usr/bin/env fish

# TODO: restoring the backups and removing simlinks
# TODO: choosing between doing or restoring 
# TODO: ask if it should execute (with [y/N]) before doing it

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
set ignored_items (status -f)

#Loop over all folders in scripts directory
# and backups them by mv * to *.bak 
for item in $script_dir/*
    # Skip ignored_items list
    if contains $item $ignored_items
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

    set skip_symlink 0
    #backup target by renaming .bak
    if test -e $target
        if not test -L $target
            set backup "$target.bak"
            if test -e $backup
                warn "$backup already exists skipping simlink creation"
                set skip_symlink 1
            else
                mv $target "$target.bak"
                success "Backing up $target to $backup"
            end
        else
            info "$target is a simlink no backup made"
        end
    end
    # simlinks from dotfiles/* to .config/*
    if test $skip_symlink -eq 0
        if test -L $target
            warn "Deleting existing symlink: $target"
            rm $target
        end
        info "Linking $item → $target"
        ln -s $item $target
    end
end
