#!/bin/bash


git remote add origin https://github.com/TK4E/test.git
git branch -M main
git add .
git gc
git commit -m 'up'
git push -u -f origin main
#
