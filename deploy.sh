#!/bin/bash

if [[ $TRAVIS_BRANCH == 'gh-pages' && $TRAVIS_REPO_SLUG == "tdcmeehan/tdcmeehan.github.io" && $TRAVIS_PULL_REQUEST == 'false' ]] ; then
  cd _site
  git init
  
  git config user.email "travis@travis-ci.org"
  git config user.name "travis-ci"

  git add -f .
  git commit -m "Deploy"

  echo "Force pushing to master" 

  # We redirect any output to https://github.com/tdcmeehan/tdcmeehan.github.io.git
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${GH_TOKEN}@${GH_REPO}" master > /dev/null 2>&1
else
  echo 'Not in gh-pages, not deploying.'
  exit 0
fi
