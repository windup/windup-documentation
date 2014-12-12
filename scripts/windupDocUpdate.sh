
# First, copy the latest files from the Windup Wiki pages
# This script assumes the windup.wiki and windup-documentation directories are at the same level.

# Fetch the latest Wiki data
cd ~/GitRepos/windup.wiki
git fetch upstream
git reset --hard upstream/master 
cd ../windup-documentation

# Images
#cp -r ../windup.wiki/images docs/

# Stylesheet
#cp ../windup.wiki/*.css docs/

# User Guide

## asciidoctor -t -dbook -a toc -o WindupUserGuide.html Windup-User-Guide.adoc

## Overview
cp ../windup.wiki/User-Guide.asciidoc docs/
cp ../windup.wiki/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp ../windup.wiki/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp ../windup.wiki/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc
cp ../windup.wiki/Get-Involved.asciidoc docs/Get-Involved.adoc
cp ../windup.wiki/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp ../windup.wiki/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc
## Run Windup
cp ../windup.wiki/Install-Windup.asciidoc docs/Install-Windup.adoc
cp ../windup.wiki/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp ../windup.wiki/Review-the-Report.asciidoc docs/Review-the-Report.adoc
## Addtional Resources
cp ../windup.wiki/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp ../windup.wiki/Known-Issues.asciidoc docs/Known-Issues.adoc
cp ../windup.wiki/Glossary.asciidoc docs/Glossary.adoc
## Appendix
cp ../windup.wiki/Dev-Windup-Architectural-Components.asciidoc docs/Dev-Windup-Architectural-Components.adoc
cp ../windup.wiki/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc

# Rules Development Guide

## asciidoctor -t -dbook -a toc -o WindupRulesDevelopmentGuide.html Windup-Rules-Development-Guide.adoc

## Overview
cp ../windup.wiki/Rules-Development-Guide.asciidoc docs/
cp ../windup.wiki/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp ../windup.wiki/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp ../windup.wiki/Get-Involved.asciidoc docs/Get-Involved.adoc
cp ../windup.wiki/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp ../windup.wiki/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc
## Get Started
cp ../windup.wiki/Install-Windup.asciidoc docs/Install-Windup.adoc
cp ../windup.wiki/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp ../windup.wiki/Review-the-Report.asciidoc docs/Review-the-Report.adoc
## Configure Your System for Java-based Rules 
cp ../windup.wiki/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
## Understand the Rule Processing
cp ../windup.wiki/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc
cp ../windup.wiki/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp ../windup.wiki/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc
#Create and Test Java Rule Addons
cp ../windup.wiki/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp ../windup.wiki/Rules-Basic-Rule-Execution-Flow-Patterns.asciidoc docs/Rules-Basic-Rule-Execution-Flow-Patterns.adoc
cp ../windup.wiki/Rules-Create-a-Basic-Java-based-Rule-Add-on.asciidoc docs/Rules-Create-a-Basic-Java-based-Rule-Add-on.adoc
cp ../windup.wiki/Rules-Create-an-Advanced-Ruleset.asciidoc docs/Rules-Create-an-Advanced-Ruleset.adoc
## Create and Test XML Rules
cp ../windup.wiki/Rules-Create-a-Basic-XML-Rule.asciidoc docs/Rules-Create-a-Basic-XML-Rule.adoc
##  Debugging and Troubleshooting
cp ../windup.wiki/Dev-Debugging-and-Profiling.asciidoc docs/Dev-Debugging-and-Profiling.adoc
cp ../windup.wiki/Dev-Troubleshoot-Windup-Issues.asciidoc docs/Dev-Troubleshoot-Windup-Issues.adoc
## Addtional Resources
cp ../windup.wiki/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp ../windup.wiki/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp ../windup.wiki/Known-Issues.asciidoc docs/Known-Issues.adoc
cp ../windup.wiki/Glossary.asciidoc docs/Glossary.adoc
## Appendix
cp ../windup.wiki/Dev-Windup-Architectural-Components.asciidoc docs/Dev-Windup-Architectural-Components.adoc
cp ../windup.wiki/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc
cp ../windup.wiki/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc

#cp ../windup.wiki/
#cp ../windup.wiki/
#cp ../windup.wiki/
#cp ../windup.wiki/

## Find the internal links within pages
# grep 'xref:[a-z]' `find . -name '*.adoc'`
# Add a leading undescore and replace the dashes with underscores

## Search the internal links and make sure the linked pages are part of the book
# grep 'link:' `find . -name '*.adoc'`

## Replace the links to other pages with xrefs:
# find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
# grep 'xref:' `find . -name '*.adoc'`


