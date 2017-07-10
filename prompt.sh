# Paste this code into your ~/.bash_profile to change your bash
# terminal prompt. This prompt displays a random kaomoji as well
# the branch you are on if you're in a git repo.
#
# Examples:
# ▽￣＼(￣▽￣)／￣▽  some_folder
# (　^ (●●)－)＝☆ some_folder
# (´ ▽｀).。ｏ♡ git_repo [master]
# (｡・‧̫・｡).*＊♡  git_repo [staging]

export PS1='\[\033[1;33m\]$(random_kaomoji)  \[\033[0m\]\W \[\033[0;32m\]$(git_branch)\[\033[0m\]\$ '

random_kaomoji() {
    declare -a kaomoji=("(´ ▽｀).。ｏ♡"
        "(｡･ω･｡)ﾉ♡"
        "(｡・‧̫・｡).*＊♡"
        "(◍•ᴗ•◍)♡ ✧*"
        "°₊·ˈ∗♡( ˃̶᷇ ‧̫ ˂̶᷆ )♡∗ˈ‧₊°"
        "(　^ (●●)－)＝☆"
        "／人◕ ‿‿ ◕人＼"
        "▽￣＼(￣▽￣)／￣▽"
        "ヾ(＠^∇^＠)ノ")
    index=$(( RANDOM % ${#kaomoji[@]} ))
    echo ${kaomoji[$index]}
}

git_branch() { 
	if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1
	then
		echo "[$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')] "
	fi
}
