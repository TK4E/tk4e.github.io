#!/bin/bash

#echo "# md" >> README.md
#git init
cd src && fd --type f md . | ../summary > ../SUMMARY.md && mv ../SUMMARY.md . && cd ..
git add .
git commit -m "up"
git branch -M main
git remote add origin https://github.com/TK4E/tk4e.github.io.git
git gc
git push -u origin main

