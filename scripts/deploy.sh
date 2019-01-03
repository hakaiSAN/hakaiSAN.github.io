#!/bin/bash

set -eu
set -o pipefail

cd public
git add --all
git commit -m 'Publish to GitHub Pages'
git push origin master
