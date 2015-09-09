#!/bin/bash
if [ "$1" == "?" ]  || [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ] || [ "$2" == "" ]; then 

    echo "Run this script from the root of the windup-documentation directory." 
    echo "You must pass the path to the windup.wiki and windup-documentation GitHub directories on the command line." 
    echo "For example:"
    echo "    scripts/windupDocBuild.sh ~/GitRepos/windup.wiki ~/GitRepos/windup-documentation/"
    exit
else
    echo  "Windup Wiki pages will be copied from here: " $1
    echo  "Windup Documentation will be created here:  " $2
fi

echo "*******************************************"
echo "* Setting up the release information...    "
echo "*******************************************"
PRODUCT_DOC_VERSION=version-2.4
OLD_PRODUCT_VERSION=2.2.0-Final
PRODUCT_VERSION=2.4.0-Final

cd $2
pwd

## Restore the top level files
cp Windup-User-Guide.adoc docs/
cp Windup-Rules-Development-Guide.adoc docs/
cp Windup-Core-Development-Guide.adoc docs/

#cp Windup-User-Guide-NO-TOC.adoc docs/
#cp Windup-Rules-Development-Guide-NO-TOC.adoc docs/
cp Windup-Core-Development-Guide-NO-TOC.adoc docs/

echo "Removal of variables is complete."
echo ""

echo "*******************************************"
echo "* Building the Windup User Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupUserGuide.html docs/Windup-User-Guide.adoc
asciidoctor -t -dbook -o html/WindupUserGuide-NO-TOC.html docs/Windup-User-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupUserGuide-NO-TOC.html pdf/WindupUserGuide.pdf
#echo "User Guide is located at: " file://$2/pdf/WindupUserGuide.pdf
echo ""


echo "*******************************************"
echo "* Building the Windup Rules Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/Windup-Rules-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupRulesDevelopmentGuide-NO-TOC.html docs/Windup-Rules-Development-Guide.adoc
wkhtmltopdf --page-size Letter html/WindupRulesDevelopmentGuide-NO-TOC.html pdf/WindupRulesDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Rules-Development-Guide.adoc
## echo "Guide is located at: " file://$2/pdf/WindupRulesDevelopmentGuide.pdf
echo ""
echo "*******************************************"
echo "* Building the Windup Core Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/Windup-Core-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupCoreDevelopmentGuide-NO-TOC.html docs/Windup-Core-Development-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupCoreDevelopmentGuide-NO-TOC.html pdf/WindupCoreDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Core-Development-Guide.adoc
## echo "Guide is located at: " file://$2/pdf/WindupCoreDevelopmentGuide.pdf
echo ""

echo ""
echo "*******************************************"
echo "* Build for DocStage"
echo "*******************************************"
echo "*******************************************"
echo "* Replace documentation links... "
echo "*******************************************"

cd docs/

find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocUserGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupUserGuide.html/:ProductDocUserGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit\/'$PRODUCT_DOC_VERSION'\/windup-user-guide/g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupRulesDevelopmentGuide.html/:ProductDocRulesGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit\/'$PRODUCT_DOC_VERSION'\/windup-rules-development-guide/g'
## Windup Core Development Guid has not been published to the portal
## find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupCoreDevelopmentGuide.html/:ProductDocCoreGuideURL: https:\/\/access.redhat.com\/documentation\/en\/red-hat-jboss-migration-toolkit\/'$PRODUCT_DOC_VERSION'\/windup-core-development-guide/g'

cd ../

echo ""
echo "*******************************************"
echo "* Building the Windup User Guide          *o"
echo "*******************************************"
## Build docbook xml: asciidoctor -b docbook docs/Windup-User-Guide.adoc
## Build using ccutils: 

ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-User-Guide.adoc
## Save the documentation so it is not lost when building another doc: cp -r build/ build-windup-user-guide/ 
cp -r docs/images/ build/tmp/en-US/html-single/
cp -r docs/images/ build/en-US/
ls build/tmp/en-US/html-single/
rm -r build-user-guide
mv build/ build-user-guide
###echo "DocBook User Guide is located at: " file://$2/build-user-guide/tmp/en-US/html-single/index.html
echo ""

echo ""
echo "***********************************************"
echo "* Building the Windup Rules Development Guide *"
echo "***********************************************"
ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-Rules-Development-Guide.adoc
cp -r docs/images/ build/tmp/en-US/html-single/
cp -r docs/images/ build/en-US/
rm -r build-rules-guide
mv build/ build-rules-guide
###echo "DocBook Guide is located at: " file://$2/build-rules-guide/tmp/en-US/html-single/index.html
echo ""

echo ""
echo "***********************************************"
echo "* Building the Windup Core Development Guide  *"
echo "***********************************************"
ccutil compile --lang en_US --main-file ~/GitRepos/windup-documentation/docs/Windup-Core-Development-Guide.adoc
cp -r docs/images/ build/tmp/en-US/html-single/
cp -r docs/images/ build/en-US/
rm -r build-core-guide
mv build/ build-core-guide
###echo "DocBook Guide is located at: " file://$2/build-core-guide/tmp/en-US/html-single/index.html
echo ""

echo "User Guide is located at: " file://$2/html/WindupUserGuide.html
echo "User Guide (PDF) is located at: " file://$2/pdf/WindupUserGuide.pdf
echo "User Guide (DocBook) is located at: " file://$2/build-user-guide/tmp/en-US/html-single/index.html
echo ""

echo "Rules Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo "Rules Guide (PDF) is located at: " file://$2/pdf/WindupRulesDevelopmentGuide.pdf
echo "Rules Guide (DocBook) is located at: " file://$2/build-rules-guide/tmp/en-US/html-single/index.html
echo ""

echo "Core Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo "Core Guide (PDF) is located at: " file://$2/pdf/WindupCoreDevelopmentGuide.pdf
echo "Core Guide (DocBook) is located at: " file://$2/build-core-guide/tmp/en-US/html-single/index.html
echo ""
echo "*******************************************"
echo "Manually verify the guides and use Maven to check in the new files"
echo "*******************************************"

