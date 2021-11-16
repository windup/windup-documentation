#!/bin/bash

FILES=`find docs -name 'master.adoc'`
BASE_URL=https://windup.github.io/windup-documentation

for f in $FILES; do
  asciidoctor --failure-level WARN -b xhtml5 -d book $f
done

rm index.md > /dev/null 2>&1

cat << EOF > index.md
---
layout: default
---
# Windup documentation

EOF

for f in $FILES; do
  echo -e "- [$(dirname $f | sed 's/docs\///g; s/_/ /g; s/-/ /g' )]($BASE_URL/$(dirname $f)/master.html)" >> index.md
done
