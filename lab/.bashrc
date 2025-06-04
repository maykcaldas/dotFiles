# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

#PS1="[\u@\h \W]\$"
PS1=' >>> ${debian_chroot:+($debian_chroot)}\[\e[0;31m\]\u\[\e[5;90m\]@\[\e[0;37m\]\h\[\e[0;97m\]:\[\e[4;97m\]\W\[\e[0;37m\]\[\e[05;90m\]\$\[\e[0;00m\] '


alias l='ls --color=auto'
alias ..='cd ..'
alias vi='vim'
alias mqueue='squeue -lu mcaldasr'
alias wqueue='squeue -lp awhite'
alias macct="sacct -u mcaldasr --format=JobID,JobName,Partition,MaxRSS,Nodelist,Elapsed,State --starttime=\"$(date --date='2 days ago' '+%Y-%m-%d')\""
alias cds='cd /scratch/mcaldasr'
alias cdwl='cd /scratch/awhite38_lab/mcaldasr'
alias du='du -sh'
alias watch='watch '
alias jalloc='salloc -p awhite -t 5:00:00 --gres=gpu:1 -C A100'
alias inter='interactive --partition awhite --gres=gpu:1 --time 1-00:00:00 --mem 200GB --job-name bash'

PATH=$PATH:$HOME/bin
export PATH



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mcaldasr/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mcaldasr/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/mcaldasr/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/mcaldasr/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/home/mcaldasr/Programs:$PATH"
