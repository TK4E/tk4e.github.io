#!/bin/bash
git checkout --orphan tmp-main # create a temporary branch
git add -A  # Add all files and commit them
git commit -m 'Add files'
git branch -D main # Deletes the main branch
git branch -m main # Rename the current branch to main
git push -f origin main # Force push main branch to Git server

