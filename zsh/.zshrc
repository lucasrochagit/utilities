## Github Commands
# These commands were written as functions and not as aliases. 
# When you run a command as an alias, that command will be 
# tested every time you open the terminal. This means that 
# commands that access the .git folder (retrieve the name of the
# feature or hotfix) or execute git commands (retrieve the full 
# name of the current branch) only work in directories that have
# a .git instance. However, if the commands are written as 
# functions, it does not. The only validation that is done is in relation 
# to the function syntax.


# Run a git push in current branch.
# It is not necessary specify the branch name.
function git:push() {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

# Run a git pull in current branch.
# It is not necessary specify the branch name.
function git:pull() {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}

# Start a new feature. Git flow is required.
# It is necessary specify the feature name.
# Usage example: feature:start FT01
function feature:start {
  git flow feature start "$1"
}

# Publish changes in current feature.
# It is not necessary specif the feature name.
function feature:publish() {
  git flow feature publish $(cat .git/HEAD | awk -F '/' '{print $NF}')
}

# Finish the current feature.
# It is not necessary specif the feature name.
function feature:finish() {
  git flow feature finish $(cat .git/HEAD | awk -F '/' '{print $NF}')
}

# Start a new hotfix. Git flow is required.
# It is necessary specify the hotfix name.
# Usage example: hotfix:start 1.0.1
function hotfix:start {
  git flow hotfix start "$1"
}

# Publish changes in current hotfix.
# It is not necessary specif the hotfix name.
function hotfix:publish() {
  git flow hotfix publish $(cat .git/HEAD | awk -F '/' '{print $NF}')
}

# Finish the current hotfix.
# It is not necessary specif the hotfix name.
function hotfix:finish() {
  git flow hotfix finish $(cat .git/HEAD | awk -F '/' '{print $NF}')
}
