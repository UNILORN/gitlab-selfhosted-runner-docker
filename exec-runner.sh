#!/bin/bash

# repo scopeのあるアクセストークン
if [ -z "${GITHUB_ACCESS_TOKEN}" ]; then
  echo "GITHUB_ACCESS_TOKEN must be set" 1>&2
  exit 1
fi


if [ -z "${GITHUB_URL}" ]; then
  echo "GITHUB_URL must be set" 1>&2
  exit 1
fi

export RUNNER_ALLOW_RUNASROOT=1
runnerName=`hostname`

# config.shを実行する
expect -c "
set timeout 10
log_user 0
spawn ./config.sh --url ${GITHUB_URL} --token ${GITHUB_ACCESS_TOKEN} --ephemeral
log_user 1
expect  -re \"Enter the name of the runner group to add this runner to:.*\"
send \"\n\"
expect  -re \"Enter the name of runner:.*\"
send \"${runnerName}\n\"
expect  -re \"Enter any additional labels.*\"
send \"\n\"
expect  -re \"Enter name of work folder:.*\"
send \"\n\"
expect \"#\"
exit 0
"

./run.sh