#!/bin/bash

rm -fr website
mkdir website
mkdir website/docs
cp -r docs/* website/docs

FILES=`find website/docs -name 'master.adoc'`
BASE_URL=https://windup.github.io/windup-documentation

for f in $FILES; do
  asciidoctor --failure-level WARN -b xhtml5 -d book $f
done

echo "HTML files built"

rm index.adoc > /dev/null 2>&1
rm index.md > /dev/null 2>&1

cat << EOF > website/index.md
---
layout: default
---

EOF

for f in $FILES; do
  echo -e "- [$(dirname $f | sed 's/website\/docs\///g; s/_/ /g; s/-/ /g' )]($BASE_URL/$(dirname $f | sed 's/website\///g' )/master.html)" >> website/index.md
done

echo "index.md built"

cp website/index.md index.md
