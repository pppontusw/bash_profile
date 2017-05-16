export ANSIBLE_VAULT_PASSWORD_FILE=~/.vaultpass
export EDITOR=nano

alias apb=ansible-playbook
alias ag=ansible-galaxy
alias agu='ansible-galaxy install -r requirements.yaml -f'
alias hostedit='sudo nano /etc/hosts'
alias av=ansible-vault
alias reload='source ~/.bash_profile'
alias pass='lpass show --password as2008 | pbcopy'

function ansibleping() { ansible -i $1 -m ping $2; } 

function ansiblewinping() { ansible -i $1 -m win_ping $2; }


function clonep() { git clone git@github.com:pppontusw/$1; }

function clonem() { git clone git@github.com:Midaxo/$1; }

function vaultmidaxo() { rm ~/.vaultpass && ln -s ~/.vaultpassmidaxo ~/.vaultpass; }

function vaultpersonal() { rm ~/.vaultpass && ln -s ~/.vaultpasspersonal ~/.vaultpass; } 

function vaultkerberos() { rm ~/.vaultpass && ln -s ~/.vaultpasskerberos ~/.vaultpass; }
