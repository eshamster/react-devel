#!/bin/bash

set -eux

# ref. https://docs.github.com/en/github-ae@latest/actions/learn-github-actions/environment-variables
prefix=$(echo ${GITHUB_REF:-} | sed -e "s|^\([^/]*/[^/]*/\).*|\1|")
base=$(echo ${GITHUB_REF:-} | sed -e "s|${prefix}||")

tag=develop

if [ "${prefix}" = "refs/tags/" ]; then
  tag=${base}
elif [ "${prefix}" = "refs/heads/" ]; then
  if [ "${base}" = "master" -o "${base}" = "main" ]; then
    tag=latest
  fi
fi

# set as variable
# ref. https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#example-setting-a-value
echo "::set-output name=DOCKER_TAG_NAME::${tag}"
