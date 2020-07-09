export EDITOR=vim
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export TZ=/usr/share/zoneinfo/Europe/Helsinki
export FZF_DEFAULT_COMMAND='rg --files --hidden'

alias apb=ansible-playbook
alias ag=ansible-galaxy
alias agu='ansible-galaxy install -r requirements.yaml -f'
alias randompass='openssl rand -base64 32'
alias randompassc='randompass | pbcopy'
alias randoman='openssl rand -hex 32'
alias randomanc='randoman | pbcopy'
alias an="tr -dc 'a-zA-Z0-9'"
alias pc='pbcopy'
alias av=ansible-vault
alias tf=terraform
alias d-c=docker-compose
alias tat='tmux a -t'
alias tls='tmux ls'
alias tn='tmux new-session'
alias sourcevenv='source .venv/bin/activate'
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias gs='git status'
alias gpl='git pull'
alias gps='git push'

function vims() { vim -S ~/.vim/sessions/$1 }
function nvims() { nvim -S ~/.vim/sessions/$1 }
function mvims() { mvim -S ~/.vim/sessions/$1 }

function clonep() { git clone git@github.com:pppontusw/$1; }
function clones() { git clone git@github.com:smartlyio/$1; }

function delkh() { sed -i.bak -e "${1}d" ~/.ssh/known_hosts; }

function reload() {
	if [ -f ~/.bash_profile ]; then
		source ~/.bash_profile
	elif [ -f ~/.bash_aliases ]; then
		source ~/.bash_aliases
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

export EJSON_KEYDIR="/Users/pontus/.ejson/keys"
export PATH="/Users/pontus/.gem/ruby/2.6.0/bin:/usr/local/opt/gettext/bin:$PATH"
