#!/bin/sh

# shellcheck disable=SC2039
read -r -p "Are you sure you want to perform this action? [y/N]" response
if [ "$response" = "y" ]; then
  counter="$(git log -1 --pretty=%B | grep -o -E '[0-9]+')"
  # shellcheck disable=SC2034
  message=$(printf "#%s - work in progress." $((counter + 1)))

  git config user.name "Aleksandar Rakić"
  git config user.email "aleksandar.rakic@yahoo.com"
  git add .
  git commit -m "work in progress 1"
  git push "git@github.com:atco89/lemp-dev-env.git"
fi
