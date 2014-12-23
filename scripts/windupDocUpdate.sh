#################################
# Build the Windup Guides
#################################

# First, copy the latest files from the Windup Wiki pages
# This script assumes the windup.wiki and windup-documentation directories are at the same level.
echo "Fetching the latest pages from the Windup Wiki..."
cd ~/GitRepos/windup.wiki
git fetch upstream
git reset --hard upstream/master 
cd ../windup-documentation

# Copy the images and stylesheets:
echo "Copying the latest images and stylesheets..."
cp -r ../windup.wiki/images docs/
cp ../windup.wiki/*.css docs/

#################################
# Windup User Guide
#################################
echo "Copying the User Guide Wiki pages from the Wiki to windup-documentation..."

## Copy the guide page as-is to use for comparison
cp ../windup.wiki/User-Guide.asciidoc docs/

## Overview
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


#################################
# Windup Rules Development Guide
#################################
echo "Copying the Rules Development Guide Wiki pages from the Wiki to windup-documentation..."

## Copy the guide page as-is to use for comparison
cp ../windup.wiki/Rules-Development-Guide.asciidoc docs/

## Overview
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
## Additional Resources
cp ../windup.wiki/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp ../windup.wiki/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp ../windup.wiki/Known-Issues.asciidoc docs/Known-Issues.adoc
cp ../windup.wiki/Glossary.asciidoc docs/Glossary.adoc
## Appendix
cp ../windup.wiki/Dev-Windup-Architectural-Components.asciidoc docs/Dev-Windup-Architectural-Components.adoc
cp ../windup.wiki/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc
cp ../windup.wiki/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc


#################################
# Windup Core Development Guide
#################################
echo "Copying the Core Development Guide Wiki pages from the Wiki to windup-documentation..."

## Wiki Guide
cp ../windup.wiki/Core-Development-Guide.asciidoc docs/

## Overview
cp ../windup.wiki/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp ../windup.wiki/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp ../windup.wiki/Get-Involved.asciidoc docs/Get-Involved.adoc
cp ../windup.wiki/Dev-Windup-Project-Information.asciidoc docs/Dev-Windup-Project-Information.adoc
cp ../windup.wiki/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp ../windup.wiki/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc

## Developer Contributing Information
cp ../windup.wiki/Dev-Development-Guidelines.asciidoc docs/Dev-Development-Guidelines.adoc
cp ../windup.wiki/Dev-Submit-Code-Updates-to-the-Windup-Project.asciidoc docs/Dev-Submit-Code-Updates-to-the-Windup-Project.adoc

## Understand the Windup Architecture and Structure
cp ../windup.wiki/Dev-Windup-Architectural-Components.asciidoc docs/Dev-Windup-Architectural-Components.adoc
cp ../windup.wiki/Dev-Windup-Project-Structure.asciidoc docs/Dev-Windup-Project-Structure.adoc

## Get Started
cp ../windup.wiki/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
cp ../windup.wiki/Dev-Get-the-Windup-Source-Code.asciidoc docs/Dev-Get-the-Windup-Source-Code.adoc
cp ../windup.wiki/Dev-Build-Windup-from-Source.asciidoc docs/Dev-Build-Windup-from-Source.adoc
cp ../windup.wiki/Dev-Execute-Windup-Built-from-Source.asciidoc docs/Dev-Execute-Windup-Built-from-Source.adoc
cp ../windup.wiki/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp ../windup.wiki/Review-the-Report.asciidoc docs/Review-the-Report.adoc

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

## Wiki and Product Documentation

cp ../windup.wiki/About-the-Windup-Wiki.asciidoc docs/About-the-Windup-Wiki.adoc
cp ../windup.wiki/Dev-Add-Images-to-the-Windup-Wiki.asciidoc docs/Dev-Add-Images-to-the-Windup-Wiki.adoc
cp ../windup.wiki/Dev-Create-Windup-JavaDoc.asciidoc docs/Dev-Create-Windup-JavaDoc.adoc
cp ../windup.wiki/Dev-Windup-Documentation-Process.asciidoc docs/Dev-Windup-Documentation-Process.adoc

## Additional Resources
cp ../windup.wiki/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp ../windup.wiki/Known-Issues.asciidoc docs/Known-Issues.adoc
cp ../windup.wiki/Glossary.asciidoc docs/Glossary.adoc

## Dev topics
cp ../windup.wiki/Dev-Windup-Architectural-Components.asciidoc docs/Dev-Windup-Architectural-Components.adoc
cp ../windup.wiki/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc

cp ../windup.wiki/Dev-Windup-Bootstrap.asciidoc docs/Dev-Windup-Bootstrap.adoc
cp ../windup.wiki/Dev-Classloading-Notes.asciidoc docs/Dev-Classloading-Notes.adoc
cp ../windup.wiki/Dev-Connect-to-the-Graph-via-Rexster.asciidoc docs/Dev-Connect-to-the-Graph-via-Rexster.adoc
cp ../windup.wiki/Dev-Decompiling.asciidoc docs/Dev-Decompiling.adoc
cp ../windup.wiki/Dev-Frames-Extensions.asciidoc docs/Dev-Frames-Extensions.adoc
cp ../windup.wiki/Dev-Internal-API-Features.asciidoc docs/Dev-Internal-API-Features.adoc
cp ../windup.wiki/Dev-Logging.asciidoc docs/Dev-Logging.adoc
cp ../windup.wiki/Dev-Variables-Stack.asciidoc docs/Dev-Variables-Stack.adoc
cp ../windup.wiki/Dev-Port-WindRide-Functionality-to-Windup.asciidoc docs/Dev-Port-WindRide-Functionality-to-Windup.adoc
cp ../windup.wiki/Dev-Git-Rebasing.asciidoc docs/Dev-Git-Rebasing.adoc

## Rule topics
cp ../windup.wiki/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
cp ../windup.wiki/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp ../windup.wiki/Dev-Concepts-and-Philosophy.asciidoc docs/Dev-Concepts-and-Philosophy.adoc
cp ../windup.wiki/Rules-Creating-Rule-Operations.asciidoc docs/Rules-Creating-Rule-Operations.adoc
cp ../windup.wiki/Rules-Rulesets.asciidoc docs/Rules-Rulesets.adoc
cp ../windup.wiki/Ruleset-Java-Basic-Ruleset.asciidoc docs/Ruleset-Java-Basic-Ruleset.adoc
cp ../windup.wiki/Ruleset-Java-Classifications-and-Inline-Hints.asciidoc docs/Ruleset-Java-Classifications-and-Inline-Hints.adoc
cp ../windup.wiki/Ruleset-Java-EE-Apps.asciidoc docs/Ruleset-Java-EE-Apps.adoc
cp ../windup.wiki/Ruleset-Java-EE-Servers.asciidoc docs/Ruleset-Java-EE-Servers.adoc
cp ../windup.wiki/Ruleset-Reporting.asciidoc docs/Ruleset-Reporting.adoc
cp ../windup.wiki/Ruleset-XML.asciidoc docs/Ruleset-XML.adoc
cp ../windup.wiki/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
cp ../windup.wiki/Rules-Create-Java-Queries.asciidoc docs/Rules-Create-Java-Queries.adoc
cp ../windup.wiki/Rules-Rules-Metadata.asciidoc docs/Rules-Rules-Metadata.adoc
cp ../windup.wiki/Rules-Rules-Operations.asciidoc docs/Rules-Rules-Operations.adoc
cp ../windup.wiki/Rules-Ops-Reporting-Classification.asciidoc docs/Rules-Ops-Reporting-Classification.adoc
cp ../windup.wiki/Rules-Ops-Reporting-Hint.asciidoc docs/Rules-Ops-Reporting-Hint.adoc
cp ../windup.wiki/Rules-Ops-Reporting-TypeReference.asciidoc docs/Rules-Ops-Reporting-TypeReference.adoc
cp ../windup.wiki/Rules-Ops-Xml-XsltTrasformation.asciidoc docs/Rules-Ops-Xml-XsltTrasformation.adoc
cp ../windup.wiki/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp ../windup.wiki/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp ../windup.wiki/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc

## Manually verify the internal links and anchors
echo ""
echo "Find the internal links within pages and make sure each referenced section "
echo "has an anchor defined with dashes and double brackets. For example: "
echo ""
echo "[[section-header]]"
echo "=== Section Header"
grep 'xref:[a-z]' `find . -name '*.adoc'`

## Manually verify the external page links and make sure the pages are included in the books
echo ""
echo "Search for links to other pages and make sure the linked pages are part of the book."
grep 'link:[A-Z]' `find . -name '*.adoc'`

## Replace external links with xrefs
echo "Replace the external links to other pages with xrefs:"
find . -name 'Windup-User-Guide.adoc' -print | xargs sed -i 's/link:/xref:/g'
find . -name 'Windup-Rules-Development-Guide.adoc' -print | xargs sed -i 's/link:/xref:/g'
find . -name 'Windup-Core-Development-Guide.adoc' -print | xargs sed -i 's/link:/xref:/g'
#find . -name 'Windup-Migration-Planning-Guide.adoc' -print | xargs sed -i 's/link:/xref:/g'

# Build the books
echo "Building the Windup User Guide..."
asciidoctor -t -dbook -a toc -o html/WindupUserGuide.html docs/Windup-User-Guide.adoc

echo "Building the Windup Rules Development Guide..."
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/Windup-Rules-Development-Guide.adoc

echo "Building the Windup Core Development Guide..."
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/Windup-Core-Development-Guide.adoc


