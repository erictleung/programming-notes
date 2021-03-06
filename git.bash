# git Notes

# overview of cheatsheet
# - general commands
# - configuration
# - commit related
# - git remotes
# - misc commands

# some cool tips on git
# source: https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/

# general commands
git add      # add files and changes
git commit   # make change
git pull     # update local
git push     # update remotes
git gc       # general housekeeping tasks
git config   # change configuration
git reset    # change commits
git restore  # undo commits
git stash    # hold temporary changes
git checkout # move to different branches or commits
git branch   # manage branches
git clean    # remove untracked files
git rm       # remove tracked files
git diff     # see changes
git revert   # undo commit
git show     # display commit changes
git log      # display history
git remote   # see remove repositories
git merge    # join branches
git rebase   # move branches along timeline
git clone    # copy repository locally
git fetch    # get general updates

# configuration commands -----------------------------------------------

# save your identity
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# deal with configuration settings
git config --list # look at your config
git config --global user.name "Joe Bob" # change global username to 'Job Bob'
git config --global user.email joe@email.com # change global email

# ignore file mode changes e.g. rw-r--r--
# source: https://stackoverflow.com/a/1257613/6873133
git config core.filemode false

# git commit templates
git config --global commit.template ~/.gittemplate

# quickly edit git configs
git config --global --edit

# commit related commands ----------------------------------------------

# squash commit with last commit and use new message
git commit --amend -m "new message here"
git commit --amend # keep previous commit message

# look at changes you are about to make during a commit message
git commit -v

# easily "stash" away commits to use later
git stash # stash away commits and changes
git stash apply # un-stash commits and changes
git stash save name-here # name stash to remember contents of stash
git stash pop stash@{0} # apply particular stash where 0 is number

# squashing multiple commits into one
git rebase -i HEAD~n # where n is the last n commits made

# another way of squashing commits e.g. three commits
git reset HEAD~3
git add
git commit -am "Fix this bug"
git push --force

# uncommit a file
# source: http://stackoverflow.com/a/15321456
git reset --soft HEAD^ # or
git reset --soft HEAD~1
git reset HEAD path/to/unwanted_file
git commit -c ORIG_HEAD # reuse original commit message

# revert git repo to previous commit for exploration
git checkout SHA_HASH_CODE

# make commits in previous commit
git checkout -b SHA_HASH_CODE

# move commits to new branch
git checkout oldBranch
git branch newBranch
git reset --hard HEAD~n # go back n commits
git checkout newBranch # your n commits will be on the new branch

# revert existing commits
git revert HEAD         # revert previous commit
git revert HEAD~3..HEAD # revert the last three commits
git revert 0766c053     # revert specific commit

# resetting commands ---------------------------------------------------

# uncommit last commit but keep all changes
git reset --soft HEAD^

# uncommit and unstage but keep all changes
git reset HEAD^ # or...
git reset HEAD~1

# uncommit and throw away changes
git reset --hard HEAD^

# undo git add of a file
git reset file-mistake.txt

# unstage all uncommitted changes
git reset

# cleaning up commands -------------------------------------------------

# removing files
git rm --cached example.txt # stop tracking file

# remove local/untracked file
git clean -f -n # tell you what will be removed (-n)
git clean -f # remove all files untracked
git clean -fd # want to remove directories as well
git clean -fX # want to remove only ignored files
git clean -fx # want to remove both ignored and non-ignored files

# status changes -------------------------------------------------------

# use git to help find trailing whitespace
git diff --check

# check differences between staged changed and before you made changes
git diff --cached
git diff --staged

# show staged and unstaged changes (what would be committed with 'git commit -a')
git diff HEAD

# show changes made from commit
git show COMMIT # where `COMMIT` is the commit ID

# follow git history of file
git log --follow FILENAME

# show last commit changes
git show # verbose output
git show --stat # show message and some stats
git show --summary # get git commit message

# look at changes from last commit
git log -p -1
git log -p -1 interesting.md # see commit for particular file

# manage reference log information, being when tips of branches are updated
git reflog

# look at leader board of contributors
#   -s : suppress committ description
#   -n : sort output by number of commits
git shortlog -sn

# nice quick overview of logs
git log --oneline --decorate --graph --all

# list tags made alphabetically
git tag
git tag -l "v1.0*" # specific tags

# see files that were changed last commit
# source: https://stackoverflow.com/a/2232490/
git show --name-status

# list files in commit
# source: https://stackoverflow.com/a/424142/
git diff-tree --no-commit-id --name-only -r bd61ad98 # meant to be programmatic
git show --pretty="" --name-only bd61ad98 # less preferred for scripts

# git remotes ----------------------------------------------------------

# dealing with remotes
git remote -v # looking at all remotes
git remote rm example-remote # remove remote
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# rebase local branch onto master
git checkout -b local-branch
git rebase master

# syncing a fork
git fetch upstream # given an upstream has been set up
git checkout master
git merge upstream/master

# change branch name
git branch -m new_branch_name # given you're on the branch you want to rename
git branch -m new_branch_name old_branch_name
git push origin :old_branch_name # deletes old branch name from remote origin
git push origin origin new_branch_name # pushes new branch name

# recover deleted local branch that exists in Github
git checkout origin/BranchName # recovers read only pointer
git checkout -b BranchName # creates new branch from old

# rebase local branch to other things
git checkout LocalBranch
git fetch origin # grabs current remote
git rebase origin/master # rebases local branch onto current remote
git rebase master # rebase local branch onto local master

# pull from origin branch
git pull origin branch-name

# pull branch from remote
# source: http://www.wetware.co.nz/2009/07/pull-a-git-branch-from-remote/
git checkout -b new-branch origin/new-branch # sub origin for remote name

# similar to above but more extensive
# source: https://stackoverflow.com/a/5884825/6873133
git remote add coworker git://path/to/coworkers/repo.git
git fetch cowork # track remote branches
git checkout --track coworker/foo  # setup local branch foo
git checkout foo
git pull

# make existing branch track remote branch
# source: http://stackoverflow.com/a/2286030/6873133
git branch -u upstream/foo # where upstream is remote and foo is branch

# pull remote branch to local from scratch
# source: https://stackoverflow.com/a/9537923/6873133
git checkout --track origin/interesting-branch

# pull upstream remote branch to local
# context: deleted local branch, wanted to track upstream branch
# source: https://stackoverflow.com/a/11278576/6873133
git branch -f --track my_local_branch upstream/my_remote_branch

# misc commands --------------------------------------------------------

# bundle commits in dire circumstances
# source: https://git-scm.com/blog/2010/03/10/bundles.html
git bundle create repo.bundle master # create bundle on master branch
# ... move repo.bundle file to other computer
git clone repo.bundle -b master repo # creates new repo
# ... make changes
git log --oneline master ^9a466c5 # look at commits you've changed
git bundle create commits.bundle master ^9a466c5 # create new bundle
# ... move commits.bundle to original computer
git bundle verify ../commits.bundle # verify commits in case missing
git fetch ../commits.bundle master:other-master # move commits to branch

# retrieve hash for last commit
# source: https://stackoverflow.com/a/949391/6873133
git rev-parse HEAD
git rev-parse --verfy HEAD

# remove branches no longer on remote server
git fetch origin --prune

# show history of function
git log -L :myFunction:myFile.js # go by function
git log -L 1,2:myFile.js # go by line numbers

# specify commit by ancestry
git show op3d1k2f^
git show op3d1k2f~
