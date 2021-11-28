#!/bin/bash

rm -fr website
mkdir website && mkdir website/docs
cp -r docs/* website/docs

FILES=`find website/docs -name 'master.adoc'`
BASE_URL=https://windup.github.io/windup-documentation

for f in $FILES; do
  asciidoctor --failure-level WARN -b xhtml5 -d book $f
done

echo "HTML files built"
#
# rm index.adoc > /dev/null 2>&1
rm website/index.md > /dev/null 2>&1

cat << EOF > index.md
---
layout: default
---

EOF


HTML=`find website/docs -name 'master.html'`

for h in $HTML; do
  TITLE=$(grep "<title>" $h | sed -e 's/<title>//; s/<\/title>//')
  # echo -e "- [$TITLE]($BASE_URL/$(dirname $h | sed 's/website\///g' )/$h)"
  echo -e "- [$TITLE]($BASE_URL/$(dirname $h | sed 's/website\///')/master.html)" >> index.md
done

echo "index.md built"
#
cp index.md website/index.md
