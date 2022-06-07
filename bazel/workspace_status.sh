#!/usr/bin/env bash

set -euo pipefail

function remove_url_credentials() {
    LC_ALL=en_US.UTF-8 LC_CTYPE=en_US.UTF-8 perl -pe 's#//.*?:.*?@#//#'
}

repo_url=$(git config --get remote.origin.url | remove_url_credentials)
echo "REPO_URL $repo_url"

commit_sha=$(git rev-parse HEAD)
echo "COMMIT_SHA $commit_sha"

git_branch=$(git rev-parse --abbrev-ref HEAD)
echo "GIT_BRANCH $git_branch"

git_tree_status=$(git diff-index --quiet HEAD -- && echo 'Clean' || echo 'Modified')
echo "GIT_TREE_STATUS $git_tree_status"
