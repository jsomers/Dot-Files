function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export CLICOLOR=1
# export PS1="\w\[\033[31m\] \[\033[00m\]>: "
export PS1="\w\[\033[31m\]\[\033[00m\]\$(parse_git_branch) >: "
export EDITOR="mate"

alias edit_profile='mate ~/.bash_profile'
alias edit_irbrc='mate ~/.irbrc'

alias vi='vim'

alias g='git '
alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | mate'
alias gdh='git diff HEAD | mate'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'
alias gpom='git push origin master'
alias gphm='git push heroku master'
alias deploy='gphm; heroku rake db:migrate; heroku restart; gpom'

alias backup_rapgenius='ruby ~/bin/backup_rapgenius.rb'

alias c='clear'
alias mv='mv -i'
alias rm='rm -i'
# alias :='cd ..'
alias ::='cd ../..'
alias :::='cd ../../..'
alias md='mkdir'
 
# Need to do this so you use backspace in screen...I have no idea why
alias screen='TERM=screen screen'
 
# listing files
alias l='ls -al'
alias ltr='ls -ltr'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'
alias t500='tail -n 500'
alias t1000='tail -n 1000'
alias t2000='tail -n 2000'
 
# editing shortcuts
alias m='mate'
alias e='emacs'
alias v='vim'
alias vi='vim'
alias erc='e /etc/bashrc'
alias newrc='. /etc/bashrc'
 
# mate shortcuts
alias m8prof='m ~/src/scripts/profile.d/'
 
# ignore svn metadata - pipe this into xargs to do stuff
alias no_svn="find . -path '*/.svn' -prune -o -type f -print"
 
# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}
 
# Mac style apache control
# TODO init this style of aliases for darwin arch
# alias htstart='sudo /System/Library/StartupItems/Apache/Apache start'
# alias htrestart='sudo /System/Library/StartupItems/Apache/Apache restart'
# alias htstop='sudo /System/Library/StartupItems/Apache/Apache stop'
 
# Debian style apache control
alias htreload='sudo /etc/init.d/apache2 reload'
alias htrestart='sudo /etc/init.d/apache2 restart'
alias htstop='sudo /etc/init.d/apache2 stop'
 
# top level folder shortcuts
alias src='cd ~/src'
alias docs='cd ~/documents'
alias scripts='cd ~/src/scripts'
 
alias h?="history | grep "
 
# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'

# alias sc='script/console'
alias scprod='script/console production'
# alias ss='script/server'
# alias sg='script/generate'

sc () {
  if [ -f ./script/rails ]; then 
    rails console $argv
  else
    ./script/console $argv
  fi
}

ss () {
  if [ -f ./script/rails ]; then 
    rails server $argv --debugger
  else
    ./script/server $argv --debugger
  fi
}

sg () {
  if [ -f ./script/rails ]; then 
    rails generate $argv
  else
    ./script/generate $argv
  fi
}
 
# testing shortcuts
alias rt='rake --trace'
alias rtf='rake test:functionals --trace'
alias rti='rake test:integration --trace'
alias rtl='rake test:lib --trace'
alias rtp='rake test:plugins --trace'
alias rtu='rake test:units --trace'
 
alias rrcov='rake coverage:all:test'
alias rrrcovall='rake test:coverage:all:test'
 
alias rdm='rake db:migrate'
alias rdtp='rake db:test:prepare'
alias rdfl='rake db:fixtures:load'
alias rdr='rake db:rollback'
alias rroutes='rake routes'
alias mroutes='rroutes | mate'
alias rmate='mate *.rb *.ru *.js Rakefile README* app config Gemfile* doc examples db lib public script spec test stories features'
# capistrano
alias csd='cap staging deploy'

alias clip='pbcopy'

##
# Your previous /Users/tom/.bash_profile file was backed up as /Users/tom/.bash_profile.macports-saved_2009-11-24_at_21:36:56
##

# MacPorts Installer addition on 2009-11-24_at_21:36:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.