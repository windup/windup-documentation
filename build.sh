#!/bin/bash
DEST=html_files

rm -fr $DEST && mkdir $DEST
rm -fr website && mkdir website

FILES=`find docs -name 'master.adoc'`
BASE_URL=https://windup.github.io/windup-documentation/html_files

for f in $FILES; do
  FILENAME=$(grep "^= .*" $f | sed -e 's/= //; s/ /_/g; s/\(.*\)/\L\1/' )
  asciidoctor --failure-level WARN -b xhtml5 -d book -o $DEST/$FILENAME.html $f
done

echo "HTML files built"

cp -r $DEST website/$DEST

cat << EOF > index.md
---
layout: default
---

EOF

for d in website/$DEST/*; do
  TITLE=$(grep "<title>" $d | sed -e 's/<title>//; s/<\/title>//' )
  URL=$BASE_URL/$(basename $d)
  echo "- [$TITLE]($URL)" >> index.md
done

echo "index.md built"
