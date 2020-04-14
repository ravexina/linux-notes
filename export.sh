#!/bin/bash
set -e

# Convert notes to html
echo "Generating html export from ipynb files"
find -iname "*.ipynb" -exec  jupyter-nbconvert {} &> /dev/null +;

# Remove old files
echo "Removing old html files and img dir"
rm ./docs/*.html
sleep 1;
rm -rf ./docs/img/

# Move all html files to ./docs except license.html
echo "Moving html files to ./docs"
find -maxdepth 2 -not -path "./.ipynb_checkpoints/*" -iname "*.html" -not -name LICENSE.html -exec mv -t docs/ {} \+

echo "Creating a copy of img in ./docs"
cp -r ./img ./docs/img

cd ./docs

# List html file names
LIST=$(find -maxdepth 1 -iname "*.html" -not -iname index.html -not -iname _template.html | grep -Po "(?<=/).*(?=\.html)")

# Generate a un-ordered html list of the file names
echo "Generating an html un-ordered list linked to exported html files"
echo "$LIST" | sed "s/.*/<li><a href='&.html'>&<\/a><\/li>/" > links.txt

# Generate a new index.html
echo "Creating index.html"
cp ./template/_template.html ./index.html

# Paste the generated links into index.html
echo "Adding links to index.html"
sed -i '/LINKS_PLACEHOLDER/r links.txt' ./index.html

echo "Removing leftovers"
rm links.txt

echo "Done"
exit 0
