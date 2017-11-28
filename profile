export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export EDITOR=nano
export LPASS_AGENT_TIMEOUT=0
export PS1="\W$ "

alias apb=ansible-playbook
alias ag=ansible-galaxy
alias agu='ansible-galaxy install -r requirements.yaml -f'
alias hostedit='sudo nano /etc/hosts'
alias reload='source ~/.bash_profile'
alias pass='lpass show -c as2008 --password'
alias randompass='openssl rand -base64 32'
alias av=ansible-vault
alias tf=terraform

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
                elif [ "${INP}" == "list" ]; then
                        ls ~/.vaultpass*;
		elif [ "${INP}" == "none" ]; then
			export ANSIBLE_VAULT_PASSWORD_FILE=;
		elif [ -f "$FILENAME" ]; then
			export ANSIBLE_VAULT_PASSWORD_FILE=$FILENAME;
		else
			echo "No file exists named $FILENAME"
		fi
	else
		echo "Specify a filename (~/.vaultpass{filename}) with 'vault {filename}'"
	fi
}

function ap() {
	INP=$1
	if [ "${INP}" ]; then
		if [ "${INP}" == "show" ]; then
			echo $AWS_PROFILE;
        elif [ "${INP}" == "list" ]; then
                grep -E "(terraform|ansible)" ~/.aws/credentials;
		elif [ "${INP}" == "none" ]; then
			export AWS_PROFILE=;
		else
			export AWS_PROFILE=$1;
		fi
	else
		echo "Specify an AWS profile with 'ap {profilename}', use 'ap list' to show available profiles"
	fi
}

function gencsr() {
	if [ $1 ]; then
		openssl req -out $1.csr -new -newkey rsa:2048 -nodes -keyout $1.key
	else
		echo "You need to give a filename for the csr and key with 'gencsr {filename}'"
	fi
}

function genselfsigned() {
	if [ $1 ]; then
		openssl req -newkey rsa:2048 -nodes -keyout $1.key -x509 -days 7300 -subj '/CN=$1' -out $1.pem
		echo "Saved as $1.key and $1.pem"
	else
		echo "You need to give a URL with 'genselfsigned {URL}'"
	fi
}

# function av() {
# 	INP=$1
# 	SEC=$2
# 	if [ "$INP" == "view" ]; then
# 		if [ -f "$SEC" ]; then
# 			ansible-vault view $SEC
# 		elif [ "$SEC" ]; then
# 			echo "No file named $SEC"
# 		else
# 			ansible-vault view vault.yml
# 		fi
# 	elif echo $INP | grep -q .yml || echo $INP | grep -q .yaml; then
# 		if [ -f "$INP" ]; then
# 			echo "Opening $INP with $ANSIBLE_VAULT_PASSWORD_FILE"
# 			ansible-vault edit "$INP"
# 		else
# 			echo "Creating $INP with $ANSIBLE_VAULT_PASSWORD_FILE"
# 			ansible-vault create "$INP"
# 		fi
# 	elif [ -f vault.yml ]; then
# 		echo "Opening vault.yml with $ANSIBLE_VAULT_PASSWORD_FILE"
# 		ansible-vault edit vault.yml
# 	else
# 		echo "Creating vault.yml with $ANSIBLE_VAULT_PASSWORD_FILE"
# 		ansible-vault create vault.yml
# 	fi
# }

if ! [ $ANSIBLE_VAULT_PASSWORD_FILE ]; then
	vault np
fi
chmod 600 ~/.vaultpass*
