export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export EDITOR=nano
export LPASS_AGENT_TIMEOUT=0
export PS1="\W$ "

alias apb=ansible-playbook
alias ag=ansible-galaxy
alias agu='ansible-galaxy install -r requirements.yaml -f'
alias hostedit='sudo nano /etc/hosts'
alias av=ansible-vault
alias reload='source ~/.bash_profile'
alias pass='lpass show -c as2008 --password'
alias randompass='openssl rand -base64 32'

function ansibleping() { ansible -i $1 -m ping "tag_Os_Ubu*"; } 
function ansiblewinping() { ansible -i $1 -m win_ping "tag_Os_Win*"; }

function clonep() { git clone git@github.com:pppontusw/$1; }
function clonem() { git clone git@github.com:Midaxo/$1; }

function vault() {
	INP=$1
	FILENAME=~/.vaultpass$1
	if [ "${INP}" ]; then
		if [ "${INP}" == "show" ]; then
			echo $ANSIBLE_VAULT_PASSWORD_FILE;
		elif [ "${INP}" == "none" ]; then
			export ANSIBLE_VAULT_PASSWORD_FILE=;
		elif [ -f "$FILENAME" ]; then
			export ANSIBLE_VAULT_PASSWORD_FILE=$FILENAME;
		else
			echo "No file named $FILENAME"
		fi
	else
		echo "Specify a filename (~/.vaultpass{filename}) with 'vault {filename}'"
	fi
 }

if ! [ $ANSIBLE_VAULT_PASSWORD_FILE ]; then
	vault np
fi