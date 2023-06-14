#!/bin/sh

read -r -p "Are you sure you want to perform this action? [y/N]" response
if [ "$response" = "y" ]; then
  counter="$(git log -1 --pretty=%B | grep -o -E '[0-9]+')"
  message=$(printf "#%s - work in progress." $((counter + 1)))

  git config user.name "Aleksandar Rakić"
  git config user.email "aleksandar.rakic@yahoo.com"
  git add .
  git commit -m "work in progress."
  git push "git@github.com:atco89/lemp-dev-env.git"
fi
