#!/bin/bash
if [ "$1" == "?" ]  || [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ] || [ "$2" == "" ]; then 

    echo "Run this script from the root of the windup-documentation directory." 
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
PRODUCT_DOC_VERSION=version-2.4
OLD_PRODUCT_VERSION=2.2.0-Final
PRODUCT_VERSION=2.4.0-Final
cd $1
pwd

git fetch upstream
git reset --hard upstream/master 
cd $2
pwd
echo "Fetch complete."
echo ""

echo "*******************************************"
echo "* Copying the latest images and stylesheets..."
echo "*******************************************"
cp -r $1/images/*.* docs/topics/images/
cp -r $1/images/*.*  html/images/
echo "Copy complete."
echo ""

echo "*******************************************"
echo "* Copying the doc pages from the Wiki to windup-documentation..."
echo "*******************************************"

sh scripts/windupDocCopyWiki.sh $1

echo "Copy complete."
echo ""

echo "*******************************************"
echo "* Replacing the links: to external pages with xrefs:"
echo "*******************************************"
echo ""
cd docs/topics
find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
cd ../../
echo "Replacement of links with xrefs is complete."
echo ""

echo "*******************************************"
echo "* Removing variables from individual pages... "
echo "*******************************************"
echo ""
cd docs/topics/
find . -name '*.adoc' -print | xargs sed -i 's/:ProductName: Windup//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductShortName: Windup//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductVersion: '$OLD_PRODUCT_VERSION'//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDistribution: windup-distribution-'$OLD_PRODUCT_VERSION'//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductHomeVar: WINDUP_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocHomeVar: WINDUP_DOCUMENTATION_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductSrcHomeVar: WINDUP_SOURCE_HOME//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductReleaseVar: WINDUP_RELEASE//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocUserGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupUserGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupRulesDevelopmentGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupCoreDevelopmentGuide.html//g'
echo "Removal of variables is complete."
cd ../../
echo ""

cp wiki-docs/Windup-User-Guide.adoc docs/topics/
cp wiki-docs/Windup-User-Guide-NO-TOC.adoc docs/topics/
cp wiki-docs/Windup-Rules-Development-Guide.adoc docs/topics/
cp wiki-docs/Windup-Rules-Development-Guide-NO-TOC.adoc docs/topics/
cp wiki-docs/Windup-Core-Development-Guide.adoc docs/topics/
cp wiki-docs/Windup-Core-Development-Guide-NO-TOC.adoc docs/topics/

echo "*******************************************"
echo "* Building the Windup User Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupUserGuide.html docs/topics/Windup-User-Guide.adoc
asciidoctor -t -dbook -o html/WindupUserGuide-NO-TOC.html docs/topics/Windup-User-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupUserGuide-NO-TOC.html pdf/WindupUserGuide.pdf
echo ""


echo "*******************************************"
echo "* Building the Windup Rules Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/topics/Windup-Rules-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupRulesDevelopmentGuide-NO-TOC.html docs/topics/Windup-Rules-Development-Guide.adoc
wkhtmltopdf --page-size Letter html/WindupRulesDevelopmentGuide-NO-TOC.html pdf/WindupRulesDevelopmentGuide.pdf
echo ""
echo "*******************************************"
echo "* Building the Windup Core Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/topics/Windup-Core-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupCoreDevelopmentGuide-NO-TOC.html docs/topics/Windup-Core-Development-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupCoreDevelopmentGuide-NO-TOC.html pdf/WindupCoreDevelopmentGuide.pdf
echo ""

echo ""
echo "*******************************************"
echo "* Build for DocStage"
echo "*******************************************"
echo ""
echo "*******************************************"
echo "* Building the Windup User Guide          *o"
echo "*******************************************"
cd docs/windup-user-guide/
ccutil compile --lang en_US --main-file master.adoc
cp -r topics/images/ build/tmp/en-US/html-single/
cp -r topics/images/ build/en-US/
cd ../../

echo ""
echo "***********************************************"
echo "* Building the Windup Rules Development Guide *"
echo "***********************************************"
cd docs/windup-rules-development-guide/
ccutil compile --lang en_US --main-file master.adoc
cp -r topics/images/ build/tmp/en-US/html-single/
cp -r topics/images/ build/en-US/
cd ../../

echo ""
echo "***********************************************"
echo "* Building the Windup Core Development Guide  *"
echo "***********************************************"
cd docs/windup-core-development-guide/
ccutil compile --lang en_US --main-file master.adoc
cp -r topics/images/ build/tmp/en-US/html-single/
cp -r topics/images/ build/en-US/
cd ../../

echo "User Guide is located at: " file://$2/html/WindupUserGuide.html
echo "User Guide (PDF) is located at: " file://$2/pdf/WindupUserGuide.pdf
echo "User Guide (DocBook) is located at: " file://$2/docs/windup-user-guide/build/tmp/en-US/html-single/index.html
echo ""

echo "Rules Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo "Rules Guide (PDF) is located at: " file://$2/pdf/WindupRulesDevelopmentGuide.pdf
echo "Rules Guide (DocBook) is located at: " file://$2/docs/windup-rules-development-guide/build/tmp/en-US/html-single/index.html
echo ""

echo "Core Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo "Core Guide (PDF) is located at: " file://$2/pdf/WindupCoreDevelopmentGuide.pdf
echo "Core Guide (DocBook) is located at: " file://$2/docs/windup-core-development-guide/build/tmp/en-US/html-single/index.html
echo ""
echo "*******************************************"
echo "Manually verify the guides and use Maven to check in the new files"
echo "*******************************************"

