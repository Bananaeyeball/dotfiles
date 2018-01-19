pull_changes() {
  local path
  local branch
  path=$1
  branch=$2

  echo "=================================="
  echo "Pulling '$path' from 'upstream $branch'"
  echo "=================================="

  cd $path
  \git add .
  \git stash
  \git checkout $branch

  \git pull --rebase upstream $branch
  bundle --with mysql2 vl
  [ -f Rakefile ] && bundle exec rake db:migrate

  \git checkout -
  \git stash pop
  cd -
}


pull_changes ~/Workspace/fidor/adapter                   master
pull_changes ~/Workspace/fidor/api_gateway               master
pull_changes ~/Workspace/fidor/automation_tests          master
pull_changes ~/Workspace/fidor/backoffice                develop
pull_changes ~/Workspace/fidor/backoffice_engine         master
pull_changes ~/Workspace/fidor/banking                   develop
pull_changes ~/Workspace/fidor/card_gateway              master
pull_changes ~/Workspace/fidor/card_management           master
pull_changes ~/Workspace/fidor/cash_transfer             master
pull_changes ~/Workspace/fidor/event_store               master
pull_changes ~/Workspace/fidor/frontend                  master
pull_changes ~/Workspace/fidor/transaction_query_service master
pull_changes ~/Workspace/fidor/transfer_cart             master
