#!/bin/bash

FILES=`find docs -name 'master.adoc'`
BASE_URL=https://windup.github.io/windup-documentation

rm -fr website
mkdir website

for f in $FILES; do
  asciidoctor --failure-level WARN -b xhtml5 -d book $f
done

echo "HTML files built"

cp -r docs/* website/

rm index.adoc > /dev/null 2>&1
rm index.md > /dev/null 2>&1

cat << EOF > index.md
---
layout: default
---

EOF

for f in $FILES; do
  echo -e "* link:$BASE_URL/$(dirname $f)/master.html[$(dirname $f | sed 's/docs\///g; s/_/ /g; s/-/ /g' )]" >> index.md
done

echo "index.md built"

mv index.md website/index.md
