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
cp -r $1/images html/
# There don't seem to be any css files in the Wiki that are needed.
# cp $1/*.css docs/
echo "Copy complete."
echo ""

echo "*******************************************"
echo "* Copying the doc pages from the Wiki to windup-documentation..."
echo "*******************************************"

sh scripts/windupDocCopyWiki.sh $1

echo "Copy complete."
echo ""

## echo "*******************************************"
## echo "* MANUAL STEP!"
## echo "*"
## echo "* Find the internal links within the following pages and make sure "
## echo "* each referenced section has an anchor defined with dashes and double brackets." 
## echo "* For example: "
## echo "*"
## echo "*     [[section-header]]"
## echo "*     === Section Header"
## echo "*******************************************"
## echo ""
## cd docs
## grep 'xref:[a-z]' `find . -name '*.adoc'`
## cd ../
## echo ""
## echo "Verify items in list above. ^^"
## echo ""
## echo ""
## echo ""
## echo "*******************************************"
## echo "* MANUAL STEP!"
## echo "*"
## echo "* Search the User Guide to find pages that link to other pages."
## echo "* Make sure the linked to pages are part of the book."
## echo "*******************************************"
## echo ""
## cd docs
## sh $2/scripts/pageLinksUserGuide.sh
## cd ../
## echo ""
## echo "Verify items in list above. ^^"
## echo ""
## echo ""
## echo "*******************************************"
## echo "* MANUAL STEP!"
## echo "*"
## echo "* Search the Rule Development Guide to find pages that link to other pages."
## echo "* Make sure the linked to pages are part of the book."
## echo "*******************************************"
## echo ""
## cd docs
## sh $2/scripts/pageLinksRulesDevelopmentGuide.sh
## cd ../
## echo ""
## echo "Verify items in list above. ^^"
## echo ""
## echo "*******************************************"
## echo "* MANUAL STEP!"
## echo "*"
## echo "* Search the Core Development Guide to find pages that link to other pages."
## echo "* Make sure the linked to pages are part of the book."
## echo "*******************************************"
## echo ""
## cd docs
## sh $2/scripts/pageLinksCoreDevelopmentGuide.sh
## cd ../
## echo ""
## echo "Verify items in list above. ^^"
## echo ""
echo "*******************************************"
echo "* Replacing the links: to external pages with xrefs:"
echo "*******************************************"
echo ""
cd docs/
find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
cd ../
echo "Replacement of links with xrefs is complete."
echo ""

echo "*******************************************"
echo "* Removing variables from individual pages... "
echo "*******************************************"
echo ""
cd docs/
find . -name '*.adoc' -print | xargs sed -i 's/:ProductName: Windup//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductShortName: Windup//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductVersion: 2.2.0-Final//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDistribution: windup-distribution-2.2.0-Final//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductHomeVar: WINDUP_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocHomeVar: WINDUP_DOCUMENTATION_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductSrcHomeVar: WINDUP_SOURCE_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductReleaseVar: WINDUP_RELEASE//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocUserGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupUserGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupRulesDevelopmentGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupCoreDevelopmentGuide.html//g'


##find . -name '*.adoc' -print | xargs sed -i 's/{ProductName}/Windup/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductVersion}/2.2.0-Final/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductDistribution}/windup-distribution-2.2.0-Final/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductHomeVar}/WINDUP_HOME/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductDocHomeVar}/WINDUP_DOCUMENTATION_HOME/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductSrcHomeVar}/WINDUP_SOURCE_HOME/g'
##find . -name '*.adoc' -print | xargs sed -i 's/{ProductReleaseVar}/WINDUP_RELEASE/g'
## Restore the top level files
cd ../
cp Windup-User-Guide.adoc docs/
cp Windup-Rules-Development-Guide.adoc docs/
cp Windup-Core-Development-Guide.adoc docs/

cp Windup-User-Guide-NO-TOC.adoc docs/
cp Windup-Rules-Development-Guide-NO-TOC.adoc docs/
cp Windup-Core-Development-Guide-NO-TOC.adoc docs/

echo "Removal of variables is complete."
echo ""

echo "*******************************************"
echo "* Building the Windup User Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupUserGuide.html docs/Windup-User-Guide.adoc
asciidoctor -t -dbook -o html/WindupUserGuide-NO-TOC.html docs/Windup-User-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupUserGuide-NO-TOC.html pdf/WindupUserGuide.pdf
#echo "User Guide is located at: " file://$2/html/WindupUserGuide.html
echo ""


echo "*******************************************"
echo "* Building the Windup Rules Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/Windup-Rules-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupRulesDevelopmentGuide-NO-TOC.html docs/Windup-Rules-Development-Guide.adoc
wkhtmltopdf --page-size Letter html/WindupRulesDevelopmentGuide-NO-TOC.html pdf/WindupRulesDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Rules-Development-Guide.adoc
## echo "Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo ""
echo "*******************************************"
echo "* Building the Windup Core Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/Windup-Core-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupCoreDevelopmentGuide-NO-TOC.html docs/Windup-Core-Development-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupCoreDevelopmentGuide-NO-TOC.html pdf/WindupCoreDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Core-Development-Guide.adoc
## echo "Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo ""

echo ""
echo "*******************************************"
echo "* Build for DocStage"
echo "*******************************************"
echo "*******************************************"
echo "* Replace documentation links... "
echo "*******************************************"

cd docs/

find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocUserGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupUserGuide.html/:ProductDocUserGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit-windup\/version-2.3\/windup-user-guide/g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupRulesDevelopmentGuide.html/:ProductDocRulesGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit-windup\/version-2.3\/windup-rules-development-guide/g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupCoreDevelopmentGuide.html/:ProductDocCoreGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit-windup\/version-2.3\/windup-core-development-guide/g'

cd ../

echo ""
echo "*******************************************"
echo "* Building the Windup User Guide          *o"
echo "*******************************************"
## Build docbook xml: asciidoctor -b docbook docs/Windup-User-Guide.adoc
## Build using ccutils: 

ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-User-Guide.adoc
## Save the documentation so it is not lost when building another doc: cp -r build/ build-windup-user-guide/ 
cp -r docs/images/ build/tmp/en_US/html-single/
cp -r docs/images/ build/en_US/
rm -r build-user-guide
mv build/ build-user-guide
###echo "DocBook User Guide is located at: " file://$2/build-user-guide/tmp/en_US/html-single/index.html
echo ""

echo ""
echo "***********************************************"
echo "* Building the Windup Rules Development Guide *"
echo "***********************************************"
ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-Rules-Development-Guide.adoc
cp -r docs/images/ build/tmp/en_US/html-single/
cp -r docs/images/ build/en_US/
rm -r build-rules-guide
mv build/ build-rules-guide
###echo "DocBook Guide is located at: " file://$2/build-rules-guide/tmp/en_US/html-single/index.html
echo ""

echo ""
echo "***********************************************"
echo "* Building the Windup Core Development Guide  *"
echo "***********************************************"
ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-Core-Development-Guide.adoc
cp -r docs/images/ build/tmp/en_US/html-single/
cp -r docs/images/ build/en_US/
rm -r build-core-guide
mv build/ build-core-guide
###echo "DocBook Guide is located at: " file://$2/build-core-guide/tmp/en_US/html-single/index.html
echo ""

echo "User Guide is located at: " file://$2/html/WindupUserGuide.html
echo "User Guide (PDF) is located at: " file://$2/pdf/WindupUserGuide.pdf
echo "User Guide (DocBook) is located at: " file://$2/build-user-guide/tmp/en_US/html-single/index.html
echo ""

echo "Rules Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo "Rules Guide (PDF) is located at: " file://$2/pdf/WindupRulesDevelopmentGuide.pdf
echo "Rules Guide (DocBook) is located at: " file://$2/build-rules-guide/tmp/en_US/html-single/index.html
echo ""

echo "Core Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo "Core Guide (PDF) is located at: " file://$2/pdf/WindupCoreDevelopmentGuide.pdf
echo "Core Guide (DocBook) is located at: " file://$2/build-core-guide/tmp/en_US/html-single/index.html
echo ""
echo "*******************************************"
echo "Manually verify the guides and use Maven to check in the new files"
echo "*******************************************"

