# git Notes

# save your identity
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# removing files
git rm --cached example.txt # stop tracking file

# dealing with remotes
git remote -v # looking at all remotes
git remote rm example-remote # remove remote

# squash commit with last commit and use new message
git commit --amend -m "new message here"
git commit --amend # keep previous commit message

# uncommit last commit but keep all changes
git reset --soft HEAD^

# uncommit and unstage but keep all changes
git reset HEAD^

# uncommit and throw away changes
git reset --hard HEAD^

# undo git add of a file
git reset file-mistake.txt

# unstage all uncommitted changes
git reset

# revert git repo to previous commit for exploration
git checkout SHA_HASH_CODE

# make commits in previous commit
git checkout -b SHA_HASH_CODE

# remove local/untracked file
git clean -f -n # tell you what will be removed (-n)
git clean -f # remove all files untracked
git clean -fd # want to remove directories as well
git clean -fX # want to remove only ignored files
git clean -fx # want to remove both ignored and non-ignored files

# easily "stash" away commits to use later
git stash # stash away commits and changes
git stash apply # un-stash commits and changes

# squashing multiple commits into one
git rebase -i HEAD~n # where n is the last n commits made

# syncing a fork
git fetch upstream # given an upstream has been set up
git checkout master
git merge upstream/master
