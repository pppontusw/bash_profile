export EDITOR=vim
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export TZ=/usr/share/zoneinfo/Europe/Helsinki
export FZF_DEFAULT_COMMAND='rg --files --hidden'

alias python=python3
alias apb=ansible-playbook
alias ag=ansible-galaxy
alias agu='ansible-galaxy install -r requirements.yaml -f'
alias hostedit='sudo vim /etc/hosts'
alias randompass='openssl rand -base64 32'
alias randompassc='openssl rand -base64 32 | pbcopy'
alias av=ansible-vault
alias tf=terraform
alias deltfplan='cd ~/git/terraform && find . -name "tfplan" -type f -delete'
alias d-c=docker-compose
alias tat='tmux a -t'
alias tls='tmux ls'
alias tn='tmux new-session'
alias sourcevenv='source .venv/bin/activate'
alias ctags="`brew --prefix`/bin/ctags"

function vims() { vim -S ~/.vim/sessions/$1 }
function nvims() { nvim -S ~/.vim/sessions/$1 }

function ansibleping() { ansible -i $1 -m ping "tag_Os_Ubu*"; }
function ansiblewinping() { ansible -i $1 -m win_ping "tag_Os_Win*"; }

function clonep() { git clone git@github.com:pppontusw/$1; }
function clonem() { git clone git@github.com:Midaxo/$1; }

function delkh() { sed -i.bak -e "${1}d" /Users/pontuswiberg/.ssh/known_hosts; }

function ssha() {
	ENVI=$1
	HOSTI=$(echo "$2" | tr /a-z/ /A-Z/)
	command="~/git/ansible/application/${ENVI} | jq '._meta.hostvars[] | select(.ec2_tag_Role==\"$HOSTI\") | .ansible_ssh_host' | tr -d \\\""
	abc=$(eval $command)
	ssh $abc
}

function sshb() {
	ENVI=$1
	HOSTI=$(echo "$2" | tr /a-z/ /A-Z/)
	command="~/git/ansible/service/${ENVI}-service | jq '._meta.hostvars[] | select(.ec2_tag_Role==\"$HOSTI\") | .ansible_ssh_host' | tr -d \\\""
	abc=$(eval $command)
	ssh $abc
}

function hosta() {
	ENVI=$1
	HOSTI=$(echo "$2" | tr /a-z/ /A-Z/)
	command="~/git/ansible/application/${ENVI} | jq '._meta.hostvars[] | select(.ec2_tag_Role==\"$HOSTI\") | .ansible_ssh_host' | tr -d \\\""
	abc=$(eval $command)
	echo $abc | pbcopy
}

function hostb() {
	ENVI=$1
	HOSTI=$(echo "$2" | tr /a-z/ /A-Z/)
	command="~/git/ansible/service/${ENVI}-service | jq '._meta.hostvars[] | select(.ec2_tag_Role==\"$HOSTI\") | .ansible_ssh_host' | tr -d \\\""
	abc=$(eval $command)
	echo $abc | pbcopy
}

function reload() {
	if [ -f ~/.bash_profile ]; then
		source ~/.bash_profile
	elif [ -f ~/.bash_aliases ]; then
		source ~/.bash_aliases
	fi
}

function vault() {
	INP=$1
	FILENAME=~/.vaultpass$1
	if [ "${INP}" ]; then
		if [ "${INP}" "==" "show" ]; then
			echo $ANSIBLE_VAULT_PASSWORD_FILE;
                elif [ "${INP}" "==" "list" ]; then
                        ls ~/.vaultpass*;
		elif [ "${INP}" "==" "none" ]; then
			export ANSIBLE_VAULT_PASSWORD_FILE=;
		elif [ -f "$FILENAME" ]; then
			ln -sf $FILENAME ~/.vaultpass
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
		if [ "${INP}" "==" "show" ]; then
			echo $AWS_PROFILE;
        elif [ "${INP}" "==" "list" ]; then
                grep -E "(terraform|ansible)" ~/.aws/credentials;
		elif [ "${INP}" "==" "none" ]; then
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

export ANSIBLE_VAULT_IDENTITY_LIST="nonprod@~/.vaultpassnp, us@~/.vaultpassus, eu@~/.vaultpasseu, hpe@~/.vaultpasshpe, devenv@~/.vaultpassdevenv, personal@~/.vaultpasspersonal, de@~/.vaultpassde"
chmod 600 ~/.vaultpass*

