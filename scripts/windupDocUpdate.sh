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

## Copy the current guide to a text file for conversion to a script
###cp docs/Windup-User-Guide.adoc scripts/pageLinksUserGuide.txt

## Copy the guide page as-is to use for comparison
##cp $1/User-Guide.asciidoc docs/

## Copy the current guide to a text file for conversion to a script
##cp docs/Windup-Rules-Development-Guide.adoc scripts/pageLinksRulesDevelopmentGuide.txt
 
## Copy the guide page as-is to use for comparison
##cp $1/Rules-Development-Guide.asciidoc docs/


## Copy the current guide to a text file for conversion to a script
##cp docs/Windup-Core-Development-Guide.adoc scripts/pageLinksCoreDevelopmentGuide.txt

## Copy the guide page as-is to use for comparison
##cp $1/Core-Development-Guide.asciidoc docs/

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
sh $2/scripts/pageLinksUserGuide.sh
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
sh $2/scripts/pageLinksRulesDevelopmentGuide.sh
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
sh $2/scripts/pageLinksCoreDevelopmentGuide.sh
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
asciidoctor -t -dbook -o html/WindupUserGuide-NO-TOC.html docs/Windup-User-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupUserGuide-NO-TOC.html pdf/WindupUserGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-User-Guide.adoc

echo "Guide is located at: " file://$2/html/WindupUserGuide.html
echo ""

echo "*******************************************"
echo "* Building the Windup Rules Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupRulesDevelopmentGuide.html docs/Windup-Rules-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupRulesDevelopmentGuide-NO-TOC.html docs/Windup-Rules-Development-Guide.adoc
wkhtmltopdf --page-size Letter html/WindupRulesDevelopmentGuide-NO-TOC.html pdf/WindupRulesDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Rules-Development-Guide.adoc
echo "Guide is located at: " file://$2/html/WindupRulesDevelopmentGuide.html
echo ""

echo "*******************************************"
echo "* Building the Windup Core Development Guide..."
echo "*******************************************"
asciidoctor -t -dbook -a toc -o html/WindupCoreDevelopmentGuide.html docs/Windup-Core-Development-Guide.adoc
asciidoctor -t -dbook -o html/WindupCoreDevelopmentGuide-NO-TOC.html docs/Windup-Core-Development-Guide-NO-TOC.adoc
wkhtmltopdf --page-size Letter html/WindupCoreDevelopmentGuide-NO-TOC.html pdf/WindupCoreDevelopmentGuide.pdf
## Build docbook xml: asciidoctor -b docbook docs/Windup-Core-Development-Guide.adoc
echo "Guide is located at: " file://$2/html/WindupCoreDevelopmentGuide.html
echo ""

echo "*******************************************"
echo "Manually verify the guides and use Maven to check in the new files"
echo "*******************************************"

