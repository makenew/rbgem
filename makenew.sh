#!/usr/bin/env sh

set -e
set -u

find_replace () {
  git grep --cached -Il '' | xargs sed -i.sedbak -e "$1"
  find . -name "*.sedbak" -exec rm {} \;
}

sed_insert () {
  sed -i.sedbak -e "$2\\"$'\n'"$3"$'\n' $1
  rm $1.sedbak
}

sed_delete () {
  sed -i.sedbak -e "$2" $1
  rm $1.sedbak
}

check_env () {
  test -d .git || (echo 'This is not a Git repository. Exiting.' && exit 1)
  for cmd in ${1}; do
    command -v ${cmd} >/dev/null 2>&1 || \
      (echo "Could not find '$cmd' which is required to continue." && exit 2)
  done
  echo
  echo 'Ready to bootstrap your new project!'
  echo
}

stage_env () {
  echo
  echo 'Removing origin and tags.'
  git tag | xargs git tag -d
  git branch --unset-upstream
  git remote rm origin
  echo
  git rm -f makenew.sh
  echo
  echo 'Staging changes.'
  git add --all
  echo
  echo 'Done!'
  echo
}

makenew () {
  echo 'Answer all prompts.'
  echo 'There are no defaults.'
  echo 'Example values are shown in parentheses.'
  read -p '> Project title (My Package): ' mk_title
  read -p '> Gem name (my-gem): ' mk_slug
  read -p '> Module name (MyModule): ' mk_module
  read -p '> Short project description (Foos and bars.): ' mk_description
  read -p '> Author name (Linus Torvalds): ' mk_author
  read -p '> Author email (linus@example.com): ' mk_email
  read -p '> GitHub user or organization name (my-user): ' mk_user
  read -p '> GitHub repository name (my-repo): ' mk_repo

  sed_delete README.md '10,96d'
  sed_insert README.md '10i' 'TODO'

  find_replace "s/^  \"VERSION\" = \".*\"/  \"VERSION\" = \"0.0.0\"/g"
  find_replace "s/Ruby Gem Project Skeleton/${mk_title}/g"
  find_replace "s/Project skeleton for a Ruby gem\./${mk_description}/g"
  find_replace "s/Evan Sosenko/${mk_author}/g"
  find_replace "s/razorx@evansosenko\.com/${mk_email}/g"
  find_replace "s|MakenewRbgem|${mk_module}|g"
  find_replace "s|makenew-rbgem|${mk_slug}|g"
  find_replace "s|makenew/rbgem|${mk_user}/${mk_repo}|g"
  find_replace "s|rbgem|${mk_repo}|g"

  git mv makenew-rbgem.gemspec "${mk_slug}.gemspec"
  git mv lib/makenew-rbgem.rb "lib/${mk_slug}.rb"
  git mv lib/makenew-rbgem "lib/${mk_slug}"

  echo
  echo 'Replacing boilerplate.'
}

check_env 'git read sed xargs'
makenew
stage_env
exit
