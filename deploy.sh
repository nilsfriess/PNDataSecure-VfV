#!/bin/bash

mix edeliver build release

if [ "$TRAVIS_BRANCH" == "production" ]; then
  mix edeliver deploy release to production
elif [ "$TRAVIS_BRANCH" == "development" ]; then
  mix edeliver deploy release to staging
  mix edeliver start staging
fi