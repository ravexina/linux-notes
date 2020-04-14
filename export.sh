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


jt -t monokai -tf droidsans -tfs 10 -nf ptsans -nfs 13 -T

# convert notes to html
jupyter-nbconvert *.ipynb &> /dev/null

# move all html files to ./docs
mv *.html ./docs

# bring back license.html
mv ./docs/LICENSE.html .

cd ./docs

mv "Ravexna's Linux Notes (LPIC, LFCS, RHCSA).html" "index.html"

# find html files, create a list of markdown linkes for them
#find -iname "*.html" -not -iname index.html | grep -Po "(?<=/).*" | sed 's/.*/- \[&\]\(&\)  /' | xsel -bi

mv ./*.html ./dark/

cd ..


# ---- ^^ Dark ^^ ------


jt -t grade3 -tf droidsans -tfs 10 -nf ptsans -nfs 13 -T

# convert notes to html
jupyter-nbconvert *.ipynb &> /dev/null

# move all html files to ./docs
mv *.html ./docs

# bring back license.html
mv ./docs/LICENSE.html .

cd ./docs

mv "Ravexna's Linux Notes (LPIC, LFCS, RHCSA).html" "index.html"

# find html files, create a list of markdown linkes for them
#find -iname "*.html" -not -iname index.html | grep -Po "(?<=/).*" | sed 's/.*/- \[&\]\(&\)  /' | xsel -bi

mv ./*.html ./light/

cd ..

# ------------ ^^ light

# bellow is default

jt -r

# convert notes to html
jupyter-nbconvert *.ipynb &> /dev/null

# move all html files to ./docs
mv *.html ./docs

# bring back license.html
mv ./docs/LICENSE.html .

cd ./docs

mv "Ravexna's Linux Notes (LPIC, LFCS, RHCSA).html" "index.html"

# find html files, create a list of markdown linkes for them
find -iname "*.html" -not -iname index.html | grep -Po "(?<=/).*" | sed 's/.*/- \[&\]\(&\)  /' | xsel -bi


echo 'linkes are in clipboard'
