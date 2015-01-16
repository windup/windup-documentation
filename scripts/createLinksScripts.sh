#!/bin/bash

## 

#cd scripts

find . -name '*.txt' -print | xargs sed -i 's/=/#/g'

## The following don't work
find . -name '*.txt' -print | xargs sed -i 's/include::/grep \'link:[A-Z]\' `find . -name \'/g'
find . -name '*.txt' -print | xargs sed -i 's/[tabsize#4]/\'`/g'

