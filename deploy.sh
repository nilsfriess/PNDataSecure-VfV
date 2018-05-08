#!/bin/bash

chmod 600 ~/.ssh/pndsm-key.pem
cp .travis/ssh_config ~/.ssh/config

cat ~/.ssh/config

if [ "$TRAVIS_BRANCH" == "production" ]; then
  mix edeliver build release --branch=production --verbose
  mix edeliver deploy release to production --verbose
elif [ "$TRAVIS_BRANCH" == "development" ]; then
  git checkout -B development
  # mix edeliver build release --branch=development --verbose
  # mix edeliver deploy release to staging --verbose
  # mix edeliver start staging --verbose
  mix edeliver update staging --branch=development --start-deploy
fi