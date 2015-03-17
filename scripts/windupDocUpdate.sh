#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ]; then 

    echo "You must pass the path to the windup.wiki and windup-documentation GitHub directories on the command line." 
    echo "For example:"
    echo "    scripts/windupDocUpdate.sh ~/GitRepos/windup.wiki ~/GitRepos/windup-documentation/"
    exit
else
    echo  "Windup Wiki pages will be copied from here: " $1
    echo  "Windup Documentation will be created here:  " $2
fi

echo "*******************************************"
echo "* Fetching the latest pages from the Windup Wiki..."
echo "*******************************************"
cd $1
pwd

git fetch upstream
git reset --hard upstream/master 
cd $2
pwd
echo "Fetch complete."
echo ""

# Copy the images and stylesheets:
echo "*******************************************"
echo "* Copying the latest images and stylesheets..."
echo "*******************************************"
cp -r $1/images docs/
# There don't seem to be any css files in the Wiki that are needed.
# cp $1/*.css docs/
echo "Copy complete."
echo ""

echo "*******************************************"
echo "* Copying the User Guide Wiki pages from the Wiki to windup-documentation..."
echo "*******************************************"

## Copy the current guide to a text file for conversion to a script
cp docs/Windup-User-Guide.adoc scripts/pageLinksUserGuide.txt

## Copy the guide page as-is to use for comparison
cp $1/User-Guide.asciidoc docs/

## Overview
cp $1/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp $1/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp $1/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc
cp $1/Get-Involved.asciidoc docs/Get-Involved.adoc
cp $1/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp $1/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc
## Run Windup
cp $1/Install-Windup.asciidoc docs/Install-Windup.adoc
cp $1/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp $1/Review-the-Report.asciidoc docs/Review-the-Report.adoc
## Addtional Resources
cp $1/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp $1/Known-Issues.asciidoc docs/Known-Issues.adoc
cp $1/Glossary.asciidoc docs/Glossary.adoc
cp $1/Windup-Architectural-Components.asciidoc docs/Windup-Architectural-Components.adoc
echo "Copy complete."
echo ""


echo "*******************************************"
echo "* Copying the Rules Development Guide Wiki pages from the Wiki to windup-documentation..."
echo "*******************************************"

## Copy the current guide to a text file for conversion to a script
cp docs/Windup-Rules-Development-Guide.adoc scripts/pageLinksRulesDevelopmentGuide.txt

## Copy the guide page as-is to use for comparison
cp $1/Rules-Development-Guide.asciidoc docs/

## Overview
cp $1/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp $1/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp $1/Get-Involved.asciidoc docs/Get-Involved.adoc
cp $1/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp $1/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc
## Get Started
cp $1/Install-Windup.asciidoc docs/Install-Windup.adoc
cp $1/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp $1/Review-the-Report.asciidoc docs/Review-the-Report.adoc
## Configure Your System for Java-based Rules 
cp $1/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
## Understand the Rule Processing
cp $1/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc
#Create and Test Java Rule Addons
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Basic-Rule-Execution-Flow-Patterns.asciidoc docs/Rules-Basic-Rule-Execution-Flow-Patterns.adoc
cp $1/Rules-Create-a-Basic-Java-based-Rule-Add-on.asciidoc docs/Rules-Create-a-Basic-Java-based-Rule-Add-on.adoc
cp $1/Rules-Create-an-Advanced-Ruleset.asciidoc docs/Rules-Create-an-Advanced-Ruleset.adoc
## Create and Test XML Rules
cp $1/Rules-Create-a-Basic-XML-Rule.asciidoc docs/Rules-Create-a-Basic-XML-Rule.adoc
cp $1/Rules-XML-Rule-When-Condition-Syntax.asciidoc docs/Rules-XML-Rule-When-Condition-Syntax.adoc
cp $1/Rules-XML-Rule-Perform-Action-Syntax.asciidoc docs/Rules-XML-Rule-Perform-Action-Syntax.adoc
cp $1/Rules-Test-a-Basic-XML-Rule-in-Windup.asciidoc docs/Rules-Test-a-Basic-XML-Rule-in-Windup.adoc
##  Debugging and Troubleshooting
cp $1/Dev-Debugging-and-Profiling.asciidoc docs/Dev-Debugging-and-Profiling.adoc
cp $1/Dev-Troubleshoot-Windup-Issues.asciidoc docs/Dev-Troubleshoot-Windup-Issues.adoc
## Additional Resources
cp $1/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp $1/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp $1/Known-Issues.asciidoc docs/Known-Issues.adoc
cp $1/Glossary.asciidoc docs/Glossary.adoc
## Appendix
cp $1/Windup-Architectural-Components.asciidoc docs/Windup-Architectural-Components.adoc
cp $1/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc
cp $1/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
echo "Copy complete."
echo ""


echo "*******************************************"
echo "*Copying the Core Development Guide Wiki pages from the Wiki to windup-documentation..."
echo "*******************************************"

## Copy the current guide to a text file for conversion to a script
cp docs/Windup-Core-Development-Guide.adoc scripts/pageLinksCoreDevelopmentGuide.txt

## Copy the guide page as-is to use for comparison
cp $1/Core-Development-Guide.asciidoc docs/

## Overview
cp $1/What-is-Windup.asciidoc docs/What-is-Windup.adoc
cp $1/Features-of-Windup-2.0.asciidoc docs/Features-of-Windup-2.0.adoc
cp $1/Get-Involved.asciidoc docs/Get-Involved.adoc
cp $1/Dev-Windup-Project-Information.asciidoc docs/Dev-Windup-Project-Information.adoc
cp $1/Report-Issues-with-Windup.asciidoc docs/Report-Issues-with-Windup.adoc
cp $1/About-the-WINDUP_HOME-Variable.asciidoc docs/About-the-WINDUP_HOME-Variable.adoc

## Developer Contributing Information
cp $1/Dev-Development-Guidelines-and-Conventions.asciidoc docs/Dev-Development-Guidelines-and-Conventions.adoc
cp $1/Dev-Submit-Code-Updates-to-the-Windup-Project.asciidoc docs/Dev-Submit-Code-Updates-to-the-Windup-Project.adoc

## Understand the Windup Architecture and Structure
cp $1/Windup-Architectural-Components.asciidoc docs/Windup-Architectural-Components.adoc
cp $1/Dev-Windup-Project-Structure.asciidoc docs/Dev-Windup-Project-Structure.adoc

## Get Started
cp $1/Install-and-Configure-Maven.asciidoc docs/Install-and-Configure-Maven.adoc
cp $1/Dev-Get-the-Windup-Source-Code.asciidoc docs/Dev-Get-the-Windup-Source-Code.adoc
cp $1/Dev-Build-Windup-from-Source.asciidoc docs/Dev-Build-Windup-from-Source.adoc
cp $1/Dev-Execute-Windup-Built-from-Source.asciidoc docs/Dev-Execute-Windup-Built-from-Source.adoc
cp $1/Execute-Windup.asciidoc docs/Execute-Windup.adoc
cp $1/Review-the-Report.asciidoc docs/Review-the-Report.adoc

## Understand the Rule Processing
cp $1/Windup-Processing-Overview.asciidoc docs/Windup-Processing-Overview.adoc
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc

#Create and Test Java Rule Addons
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Basic-Rule-Execution-Flow-Patterns.asciidoc docs/Rules-Basic-Rule-Execution-Flow-Patterns.adoc
cp $1/Rules-Create-a-Basic-Java-based-Rule-Add-on.asciidoc docs/Rules-Create-a-Basic-Java-based-Rule-Add-on.adoc
cp $1/Rules-Create-an-Advanced-Ruleset.asciidoc docs/Rules-Create-an-Advanced-Ruleset.adoc

## Create and Test XML Rules
cp $1/Rules-Create-a-Basic-XML-Rule.asciidoc docs/Rules-Create-a-Basic-XML-Rule.adoc

##  Debugging and Troubleshooting
cp $1/Dev-Debugging-and-Profiling.asciidoc docs/Dev-Debugging-and-Profiling.adoc
cp $1/Dev-Troubleshoot-Windup-Issues.asciidoc docs/Dev-Troubleshoot-Windup-Issues.adoc

## Wiki and Product Documentation

cp $1/About-the-Windup-Wiki.asciidoc docs/About-the-Windup-Wiki.adoc
cp $1/Dev-Add-Images-to-the-Windup-Wiki.asciidoc docs/Dev-Add-Images-to-the-Windup-Wiki.adoc
cp $1/Dev-Create-Windup-JavaDoc.asciidoc docs/Dev-Create-Windup-JavaDoc.adoc
cp $1/Dev-Windup-Documentation-Process.asciidoc docs/Dev-Windup-Documentation-Process.adoc

## Additional Resources
cp $1/Review-the-Windup-Quickstarts.asciidoc docs/Review-the-Windup-Quickstarts.adoc
cp $1/Known-Issues.asciidoc docs/Known-Issues.adoc
cp $1/Glossary.asciidoc docs/Glossary.adoc

## Dev topics
cp $1/Windup-Architectural-Components.asciidoc docs/Windup-Architectural-Components.adoc
cp $1/Dev-Dependencies.asciidoc docs/Dev-Dependencies.adoc

cp $1/Dev-Windup-Bootstrap.asciidoc docs/Dev-Windup-Bootstrap.adoc
cp $1/Dev-Classloading-Notes.asciidoc docs/Dev-Classloading-Notes.adoc
cp $1/Dev-Connect-to-the-Graph-via-Rexster.asciidoc docs/Dev-Connect-to-the-Graph-via-Rexster.adoc
cp $1/Dev-Decompiling.asciidoc docs/Dev-Decompiling.adoc
cp $1/Dev-Frames-Extensions.asciidoc docs/Dev-Frames-Extensions.adoc
cp $1/Dev-Internal-API-Features.asciidoc docs/Dev-Internal-API-Features.adoc
cp $1/Dev-Logging.asciidoc docs/Dev-Logging.adoc
cp $1/Dev-Variables-Stack.asciidoc docs/Dev-Variables-Stack.adoc
cp $1/Dev-Port-WindRide-Functionality-to-Windup.asciidoc docs/Dev-Port-WindRide-Functionality-to-Windup.adoc
cp $1/Dev-Git-Rebasing.asciidoc docs/Dev-Git-Rebasing.adoc

## Rule topics
cp $1/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
cp $1/Rules-Available-Rules-Utilities.asciidoc docs/Rules-Available-Rules-Utilities.adoc
cp $1/Dev-Concepts-and-Philosophy.asciidoc docs/Dev-Concepts-and-Philosophy.adoc
cp $1/Rules-Creating-Rule-Operations.asciidoc docs/Rules-Creating-Rule-Operations.adoc
cp $1/Rules-Rulesets.asciidoc docs/Rules-Rulesets.adoc
cp $1/Ruleset-Java-Basic-Ruleset.asciidoc docs/Ruleset-Java-Basic-Ruleset.adoc
cp $1/Ruleset-Java-Classifications-and-Inline-Hints.asciidoc docs/Ruleset-Java-Classifications-and-Inline-Hints.adoc
cp $1/Ruleset-Java-EE-Apps.asciidoc docs/Ruleset-Java-EE-Apps.adoc
cp $1/Ruleset-Java-EE-Servers.asciidoc docs/Ruleset-Java-EE-Servers.adoc
cp $1/Ruleset-Reporting.asciidoc docs/Ruleset-Reporting.adoc
cp $1/Ruleset-XML.asciidoc docs/Ruleset-XML.adoc
cp $1/Rules-Windup-Models.asciidoc docs/Rules-Windup-Models.adoc
cp $1/Rules-Create-Java-Queries.asciidoc docs/Rules-Create-Java-Queries.adoc
cp $1/Rule-Metadata.asciidoc docs/Rule-Metadata.adoc
cp $1/Rules-Rules-Operations.asciidoc docs/Rules-Rules-Operations.adoc
cp $1/Rules-Ops-Reporting-Classification.asciidoc docs/Rules-Ops-Reporting-Classification.adoc
cp $1/Rules-Ops-Reporting-Hint.asciidoc docs/Rules-Ops-Reporting-Hint.adoc
cp $1/Rules-Ops-Reporting-TypeReference.asciidoc docs/Rules-Ops-Reporting-TypeReference.adoc
cp $1/Rules-Ops-Xml-XsltTransformation.asciidoc docs/Rules-Ops-Xml-XsltTransformation.adoc
cp $1/Rules-Rule-Execution-Lifecycle.asciidoc docs/Rules-Rule-Execution-Lifecycle.adoc
cp $1/Rules-Java-based-Rule-Structure.asciidoc docs/Rules-Java-based-Rule-Structure.adoc
cp $1/Rules-Rule-Story-Points.asciidoc docs/Rules-Rule-Story-Points.adoc
echo "Copy complete."
echo ""

echo "*******************************************"
echo "* MANUAL STEP!"
echo "*"
echo "* Find the internal links within the following pages and make sure "
echo "* each referenced section has an anchor defined with dashes and double brackets." 
echo "* For example: "
echo "*"
echo "*     [[section-header]]"
echo "*     === Section Header"
echo "*******************************************"
echo ""
cd docs
grep 'xref:[a-z]' `find . -name '*.adoc'`
cd ../
echo ""
echo "Verify items in list above. ^^"
echo ""
echo ""
echo ""
echo "*******************************************"
echo "* MANUAL STEP!"
echo "*"
echo "* Search the User Guide to find pages that link to other pages."
echo "* Make sure the linked to pages are part of the book."
echo "*******************************************"
echo ""
cd docs
sh $2/scripts/pagelinksUserGuide.sh
# grep 'link:[A-Z]' `find . -name '*.adoc'`
cd ../
echo ""
echo "Verify items in list above. ^^"
echo ""
echo ""
echo "*******************************************"
echo "* MANUAL STEP!"
echo "*"
echo "* Search the Rule Development Guide to find pages that link to other pages."
echo "* Make sure the linked to pages are part of the book."
echo "*******************************************"
echo ""
cd docs
sh $2/scripts/pagelinksRulesDevelopmentGuide.sh
# grep 'link:[A-Z]' `find . -name '*.adoc'`
cd ../
echo ""
echo "Verify items in list above. ^^"
echo ""
echo "*******************************************"
echo "* MANUAL STEP!"
echo "*"
echo "* Search the Core Development Guide to find pages that link to other pages."
echo "* Make sure the linked to pages are part of the book."
echo "*******************************************"
echo ""
cd docs
sh $2/scripts/pagelinksCoreDevelopmentGuide.sh
# grep 'link:[A-Z]' `find . -name '*.adoc'`
cd ../
echo ""
echo "Verify items in list above. ^^"
echo ""
echo "*******************************************"
echo "* Replacing the links: to external pages with xrefs:"
echo "*******************************************"
echo ""
cd docs
find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
cd ../
echo "Replacement of links with xrefs is complete."
echo ""

echo "*******************************************"
echo "* Building the Windup User Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupUserGuide.html docs/Windup-User-Guide.adoc
echo "Guide is located at: " file://$2/html/WindupUserGuide.html
echo ""

echo "*******************************************"
echo "* Building the Windup Rules Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/Windup-Rules-Development-Guide.adoc
echo "Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo ""

echo "*******************************************"
echo "* Building the Windup Core Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/Windup-Core-Development-Guide.adoc
echo "Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo ""


