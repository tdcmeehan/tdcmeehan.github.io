#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproof ./_site  --href-ignore "#,https://www.linkedin.com/in/timdmeehan"
cp .travis.yml _site
cp README.md _site
