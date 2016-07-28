#!/bin/bash
## Windup User Guide: Find internal links
#cd ~/GitRepos/windup-documentation/docs
pwd

### THIS IS WRONG! IT NEEDS TO BE RECURSIVE

## Overview
grep 'link:[A-Z]' `find . -name 'What-is-it.adoc'`
grep 'link:[A-Z]' `find . -name 'Features.adoc'`
grep 'link:[A-Z]' `find . -name 'About-the-HOME-Variable.adoc'`

## Run Windup
grep 'link:[A-Z]' `find . -name 'Install.adoc'`
grep 'link:[A-Z]' `find . -name 'Execute.adoc'`
grep 'link:[A-Z]' `find . -name 'Review-the-Report.adoc'`

## Additional Resources
grep 'link:[A-Z]' `find . -name 'Review-the-Quickstarts.adoc'`
grep 'link:[A-Z]' `find . -name 'Get-Involved.adoc'`
grep 'link:[A-Z]' `find . -name 'Important-Links.adoc'`
grep 'link:[A-Z]' `find . -name 'Known-Issues.adoc'`
grep 'link:[A-Z]' `find . -name 'Report-Issues.adoc'`

## Appendix
grep 'link:[A-Z]' `find . -name 'Glossary.adoc'`
grep 'link:[A-Z]' `find . -name 'Processing-Overview.adoc'`
grep 'link:[A-Z]' `find . -name 'Architectural-Components.adoc'`
grep 'link:[A-Z]' `find . -name 'Rule-Phases.adoc'`
grep 'link:[A-Z]' `find . -name 'Rules-Rule-Story-Points.adoc'`



