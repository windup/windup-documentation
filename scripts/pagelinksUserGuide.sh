#!/bin/bash
## Windup User Guide: Find internal links
#cd ~/GitRepos/windup-documentation/docs
pwd

## Overview

grep 'link:[A-Z]' `find . -name 'What-is-Windup.adoc'`
grep 'link:[A-Z]' `find . -name 'Features-of-Windup-2.0.adoc'`
grep 'link:[A-Z]' `find . -name 'Windup-Processing-Overview.adoc'`
grep 'link:[A-Z]' `find . -name 'Get-Involved.adoc'`
grep 'link:[A-Z]' `find . -name 'Report-Issues-with-Windup.adoc'`
grep 'link:[A-Z]' `find . -name 'About-the-WINDUP_HOME-Variable.adoc'`

## Run Windup

grep 'link:[A-Z]' `find . -name 'Install-Windup.adoc'`
grep 'link:[A-Z]' `find . -name 'Execute-Windup.adoc'`
grep 'link:[A-Z]' `find . -name 'Review-the-Report.adoc'`

## Additional Resources

grep 'link:[A-Z]' `find . -name 'Review-the-Windup-Quickstarts.adoc'`
grep 'link:[A-Z]' `find . -name 'Known-Issues.adoc'`
grep 'link:[A-Z]' `find . -name 'Glossary.adoc'`
grep 'link:[A-Z]' `find . -name 'Windup-Architectural-Components.adoc'`





