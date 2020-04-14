#!/bin/bash

# Convert notes to html
jupyter-nbconvert *.ipynb &> /dev/null

# Move all html files to ./docs except license.html
find -maxdepth 1 -iname "*.html" -not -name LICENSE.html -exec mv {} docs/ \;

cd ./docs

# List html file names
LIST=$(find -maxdepth 1 -iname "*.html" -not -iname index.html -not -iname _template.html | grep -Po "(?<=/).*(?=\.html)")

# Generate a un-ordered html list of the file names
echo "$LIST" | sed "s/.*/<li><a href='&.html'>&<\/a><\/li>/" > links.txt

# Generate a new index.html
cp ./_template.html ./index.html

# Paste the generated links into index.html
sed -i '/LINKS_PLACEHOLDER/r links.txt' ./index.html

rm links.txt

exit 0