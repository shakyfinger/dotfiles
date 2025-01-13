fish_vi_key_bindings
set fish_greeting



function l
    ls -lFrt $argv
end

function cn
    cd ~/notes
    ls -lFrt $argv >indx
    nvim -c 'execute "normal G$kB"' indx

end

function r
    cd ~/books
    evince options,futures_and_other_derivatives_hull.pdf & disown
end



alias n="nvim"
alias sp="scrcpy --video-bit-rate=16M --max-fps=60 --no-audio -S --shortcut-mod=lalt"
alias shutdown="shutdown now"




#fish prompt
function fish_prompt
    set -l last_status $status
    if test $last_status -ne 0
        set colour red
    else
        set colour green
    end

    string join '' -- (set_color 8be9fd) (prompt_pwd -D 2) (set_color $colour) '  ' (set_color normal)
end

function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo "[N] "
        case insert
            #set_color --bold green
            #echo 'I'
        case replace_one
            set_color --bold green
            echo "[R] "
        case visual
            set_color --bold brmagenta
            echo "[V] "
        case '*'
            set_color --bold red
            echo '[?] '
    end
    set_color normal
end

function fish_right_prompt
    string join '' -- (set_color brblack) (date '+%a %H:%M')
end
