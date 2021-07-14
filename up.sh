#!/bin/bash

#echo "# md" >> README.md
#git init
cd src && fd --type f md . | ../summary > ../SUMMARY.md && mv ../SUMMARY.md . && cd ..
mdbook build


git remote add origin https://github.com/TK4E/tk4e.github.io.git

# git branch gh-pages
# FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --subdirectory-filter docs -- gh-pages
# gti switch gh-pages
# git add .
# git commit -m "up"
# git gc
# git push -u -f origin gh-pages

git branch main
git add .
git commit -m "up"
git gc
git push -u -f origin main
