# Paste this code into your ~/.bash_profile to change your bash
# terminal prompt. This prompt will display the branch you are on if
# you're in a git repo.
#
# Examples:
# (´ ▽｀).。ｏ♡ folder
# (´ ▽｀).。ｏ♡ git-repo [master]

export PS1='\033[1;36m(´ ▽｀).。ｏ♡  \033[0m\W \033[0;32m$(git_branch)\033[0m\$ '

git_branch() { 
	if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1
	then
		echo "[$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')] "
	fi
}
