# Shell Aliases
alias l='ls -CF'
alias c='clear'
alias ll='ls -lF'
alias llh='ls -lh'
alias la='ls -A'
alias lla='ls -lA'
alias lrt='ls -lrt'
alias lart='ls -lArt'
alias llart='ls -lart'

# Host Aliases
#alias irc='screen -t IRC ssh -t gandalf screen -RAD IRC'
#alias irc-remote='screen -t IRC ssh -t gandalf.libentech.com screen -RAD IRC'
#alias samwise='screen -t samwise ssh root@samwise.libentech.com'
#alias saturn='screen -t saturn ssh saturn.chaillet.net'

# Corvisa Aliases
#alias djtut='. ~/venv/mysite/bin/activate && cd ~/src/mysite'
#alias drftut='. ~/venv/tutorial/bin/activate && cd ~/src/tutorial'
#alias gn='source ~/venv/gonzo/bin/activate && cd ~/src/gonzo'
#alias bi='source ~/venv/bi/bin/activate && cd ~/src/platform-api-analytics'
#alias kairos='cd ~/src/platform-api-analytics/common/kairos && pipenv shell'
#alias atlas='screen -t atlas bash'
#alias corvisa-dev='screen -t dev.corvisa.com ssh -t dbaber@dev.corvisa.com'
#alias corvisa-gw='screen -t corvisa-gw ssh -t dbaber@24.106.62.130'
#alias pub='cd ~/Public'
#alias qcbraindev='screen -t qcbraindev ssh -t dbaber@qcbraindev.it.corp'
#alias lxapp2='screen -t lxapp2 ssh -t dbaber@10.113.32.83'
#alias pcrim='screen -T xterm -t pcrim1web1chil1 ssh -t dbaber@pcrim1web1chil1.it.corp'
#alias lcrim='screen -T xterm -t lcrim1srv1chil1 ssh -t dbaber@lcrim1srv1chil1.it.corp'
#alias cirrusdev1='screen -T xterm -t cirrusdev1 ssh -t dbaber@cirrusdev1.int.corvisacloud.com'
#alias cirrus1='screen -T xterm -t cirrus1 ssh -t dbaber@cirrus1.int.corvisacloud.com'
#alias sandbox-ec2='screen -T xterm -t sandbox-baber-ec2 ssh -t ubuntu@ec2-54-165-99-55.compute-1.amazonaws.com'
#alias dev-ec2='screen -T xterm -t dev-baber-ec2 ssh -t ubuntu@ec2-54-237-218-140.compute-1.amazonaws.com'

#alias psql-prod='screen -t psql-prod psql -h db1.ord.corvisa.com cone_production'
alias psql='PAGER="less -S" psql'

#alias lxdev='ssh -t dbaber@lxdev.corp.xome.com'

# Perlbrew
alias pb='perlbrew'
alias pls='~/perl5/perlbrew/bin/perlbrew list'
alias pl='perlbrew use perl-5.12.4'
alias pl2='perlbrew use perl-5.24.0'
#alias dz='perlbrew use perl-5.12.4@_dzil_builder'
alias dev='perlbrew use perl-5.12.4@devel'
alias dev2='perlbrew use perl-5.24.0@dev'
alias bj='cd ~/src/blackjack && perlbrew use perl-5.12.4@blackjack'
alias bjconf='cd ~/src/configs && perlbrew use perl-5.12.4@blackjack'
alias qcr='cd ~/src/qcr && perlbrew use perl-5.12.4@qcr'
alias qcrconf='cd ~/src/configsqcr && perlbrew use perl-5.12.4@qcr'
alias sldd='cd ~/src/sldockerdev && perlbrew use perl-5.12.4@blackjack'
alias sl='cd ~/src/slingshot && perlbrew use perl-5.24.0@slingshot'
alias idp='cd ~/src/idp && perlbrew use perl-5.24.0@idp'
#alias cr='cd ~/src/crimson && perlbrew use perl-5.12.4@crimson'
#alias cir='cd ~/src/cirrus'
#alias st='cd ~/src/stratus'
alias th='cd ~/src/thunderdome && perlbrew use perl-5.12.4@thunderdome'
alias ca='cd ~/src/cadillac && perlbrew use perl-5.12.4@cadillac'
alias el='cd ~/src/cadillac/t/apps/Eldorado && perlbrew use perl-5.12.4@cadillac'
alias ans='cd ~/src/XG_ansible'

# New mojolicious
alias mojo='cd ~/src/mojo && perlbrew use perl-5.36.1@mojo'
alias myapp='cd ~/src/myapp && perlbrew use perl-5.36.1@myapp'

#alias ker='cd ~/src/kermes && perlbrew use perl-5.12.4@kermes'
#alias co='cd ~/src/corvisa-one-perl && perlbrew use perl-5.12.4@corvisa_one'
#alias runbj='screen -t bj-server ~/bin/bj-server.sh'
#alias runbj-tst='screen -t bj-server-tst ~/bin/bj-server.sh testing'
#alias runbj-nd='screen -t bj-server-nd ~/bin/bj-server.sh nodebug'
#alias runcr='screen -t crimson-server ~/bin/crimson-server.sh'
#alias runcr-nd='screen -t crimson-server-nd ~/bin/crimson-server.sh nodebug'
#alias docsrv='perl -I/home/dbaber/src/blackjack/lib /usr/local/bin/perldoc-server --public &'
#alias cr-docsrv='perl -I/home/dbaber/src/cadillac/lib -I/home/dbaber/src/crimson/lib /opt/perlbrew/locallib/libs/perl-5.16.2@crimson/bin/perldoc-server --public &'
#alias updb='cd ~/src/blackjack && ./script/update_db'
#alias lperms='cd ~/src/blackjack && ./script/load_permissions $*'
#alias ldatam='cd ~/src/blackjack && ./script/load_data -vm $*'
#alias ldatav='cd ~/src/blackjack && ./script/load_data -v $*'
#alias ldatavz='cd ~/src/blackjack && ./script/load_data -f -v `ls -1 db/data | grep -v Zip`'

# LenderX, LLC
alias lxor='. ~/venvs/lx_ordering/bin/activate && cd ~/src/lx_ordering'
alias lxasst='. ~/venvs/lx_assistant/bin/activate && cd ~/src/lx_assistant'
alias lxpay='. ~/vens/lx_pay/bin/activate && cd ~/src/lx_pay'
alias plutus='cd ~/src/plutus &&source .venv/bin/activate'

#alias runwww='cd ~/src/blackjack && BLACKJACK_RUNNING=1 ./script/run-www-tests $*'
#lalias cpan='~/bin/cpan.sh $1'
#alias qctst='cd ~/src/blackjack/t/Blackjack/RuleEngine/data/streetlinks_test_files'
#alias qtst='cd /mnt/Q/Audit/Projects/ZooQueue/XML'
#alias dtst='cd /mnt/DevTeam/QC/test_files'
#alias imp='cd ~/import_check'
alias dl='cd ~/Downloads'
#alias jr='cd ~/json_rules'
alias docs='cd ~/Documents'
alias src='cd ~/src'

# Make iCloud Drive link if it doesn't exist and then an alias
ln -sf "${HOME}/Library/Mobile Documents/com~apple~CloudDocs" ${HOME}/iCloudDrive
alias ic='cd ~/iCloudDrive'

#alias imprule='cd ~/src/blackjack && perl ./bin/import/import_rule_file.pl --rule_file=t/Blackjack/RuleEngine/data/streetlinks_rules_split.json --save --write_file=t/Blackjack/RuleEngine/data/new_streetlinks_rules_split.json'
#alias imprulednl='cd ~/src/blackjack && perl ./bin/import/import_rule_file.pl --rule_file=t/Blackjack/RuleEngine/data/streetlinks_rules_daniel.json --save --write_file=t/Blackjack/RuleEngine/data/new_streetlinks_rules_daniel.json'
#alias imprule2='cd ~/src/blackjack && perl ./bin/import/import_rule_file.pl --rule_file=t/Blackjack/RuleEngine/data/streetlinks_rules_2.json --save --write_file=t/Blackjack/RuleEngine/data/new_streetlinks_rules_2.json'

#alias ic='cd ~/src/blackjack/bin/import && perl ./import_check.pl --find --show=all --rule_id $*'
#alias icp='cd ~/src/blackjack/bin/import && perl ./import_check.pl --find --presentation_mode --rule_id $*'
#alias icc='cd ~/src/blackjack/bin/import && perl ./import_check.pl --find --conclusion_mode --rule_id $*'
#alias iccf='cd ~/src/blackjack/bin/import && perl ./import_check.pl --xml_file TEST_UAD_1004.XML --conclusion_mode --rule_id $*'
#alias re='cd ~/src/blackjack && perl ./script/rule_editor.pl -i'
#alias qcr='cd ~/src/blackjack/bin/import && perl ./qc_report.pl --graph all --use_rule_id $*'
#alias syncqd='rsync -avz --delete --include "$1*.XML" --exclude '*' /mnt/Q/Audit/Projects/ZooQueue/XML/ /mnt/DevTeam/QC/test_files'
#alias syncds='rsync -avz --delete --include "$1*.XML" --exclude '*' /mnt/DevTeam/QC/test_files/ /home/dbaber/src/blackjack/t/Blackjack/RuleEngine/data/streetlinks_test_files'

#alias pbcopy='xclip -selection clipboard'
# Mac OS X commands
#alias pbpaste='xclip -selection clipboard -o'
#alias open='gvfs-open $1'

# XXX: jq replaces this
#alias ppjson='python -mjson.tool'
#alias ppjson_file='python -mjson.tool $1'

alias devrepl='re.pl --rcfile ~/.re.pl/bj_dev.rc'

# Git aliases
alias g=git
alias gst='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias glol='git log --pretty=oneline'
alias glop='git log -p -1'
alias gci='git commit --verbose'
alias gup='git pull --rebase'

alias prove='ADDRESSPLUS_APIKEY=WS36-TCQ1-DOA2 prove'

# Docker aliases
alias dc=docker-compose
alias dcpsa="docker compose ps -a --format 'table {{.Name}}\t{{.Image}}\t{{.Service}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}'"

alias utc-iso='gdate -u +%Y-%m-%dT"%T.%6NZ"'
alias ls-tcp='lsof -nP -iTCP -sTCP:LISTEN'
alias sudo='sudo '

# Stolen from https://www.youtube.com/watch?v=UTqxEGjNnwI
# For perl:
alias ctagit="catgs --append=no -f ./.git/tags --recurse --totals --exclude=blib --exclude=.svn --exclude=.git --exclude='*~' --extra=q --languages=Perl --langmap=Perl:+.t"

# Chruby
alias cr='chruby'
#alias terraspace='chruby ruby-3.2.2 && bundle exec terraspace'

# Domain Storytelling diagram web app
alias egon='open ~/bin/domain-story-modeler-1.5.0/index.html'

# Command-line Markdown viewers
alias fm='frogmouth'
alias gl='glow -s dark -p'

# Python Poetry deps manager
alias pty=poetry

# AWS Scripts
alias ls-ec2s='AWS_PROFILE=legacy ls-ec2s'

# Ansible CLI tools
alias ansible='AWS_PROFILE=legacy ansible'
alias ansible-config='AWS_PROFILE=legacy ansible-config'
alias ansible-console='AWS_PROFILE=legacy ansible-console'
alias ansible-doc='AWS_PROFILE=legacy ansible-doc'
alias ansible-galaxy='AWS_PROFILE=legacy ansible-galaxy'
alias ansible-inventory='AWS_PROFILE=legacy ansible-inventory'
alias ansible-playbook='AWS_PROFILE=legacy ansible-playbook'
alias ansible-pull='AWS_PROFILE=legacy ansible-pull'
alias ansible-vault='AWS_PROFILE=legacy ansible-vault'

# Print out PATH dirs
alias pths="echo $PATH | tr ':' '\n'"
