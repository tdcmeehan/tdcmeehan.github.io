#!/bin/bash

if [[ $TRAVIS_BRANCH == 'gh-pages' ]] ; then
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
  echo 'Invalid branch. You can only deploy from gh-pages.'
  exit 1
fi
