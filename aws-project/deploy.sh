#!/bin/bash

BRANCH=$(git branch --show-current)

if [ "$BRANCH" = "staging" ]; then
  echo "Deploying to STAGING"
  cp index.html /var/www/staging/index.html
elif [ "$BRANCH" = "production" ]; then
  echo "Deploying to PRODUCTION"
  cp index.html /var/www/production/index.html
else
  echo "No deploy branch selected"
fi
