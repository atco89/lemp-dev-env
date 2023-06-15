#!/bin/sh

# shellcheck disable=SC2039
read -r -p "Are you sure you want to perform this action? [y/N]" response
if [ "$response" = "y" ]; then
  # shellcheck disable=SC2046
  message=$(printf "[%s] - work in progress." $(date +'%Y-%m-%d'))

  git config user.name "Aleksandar Rakić"
  git config user.email "aleksandar.rakic@yahoo.com"
  git add .
  git commit -m "$message"

  git push "git@github.com:atco89/lemp-dev-env.git"
fi
