#!/bin/bash
CURRENT_DIR="$( pwd -P)"

PRODUCT_DOC_VERSION=version-2.5
OLD_PRODUCT_VERSION=2.5.0-Final
PRODUCT_VERSION=2.5.0-Final
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

echo ""
echo "Fetching the latest pages from the Windup Wiki..."
echo ""
cd $1
pwd

git fetch upstream
git reset --hard upstream/master 
cd $2
pwd
echo "Fetch complete."
echo ""

echo "Copying the latest images and stylesheets..."
cp -r $1/images/*.* docs/topics/images/
echo "Copy complete."
echo ""

echo "Copying the doc pages from the Wiki to windup-documentation..."
echo ""

sh scripts/windupDocCopyWiki.sh $1

echo "Copy complete."
echo ""

echo " Replacing the links: to external pages with xrefs:"
echo ""
cd docs/topics
find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
cd ../../
echo "Replacement of links with xrefs is complete."
echo ""

echo "Removing variables from individual pages... "
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

## Replace the images directory
find . -name '*.adoc' -print | xargs sed -i 's/:imagesdir: images/:imagesdir: topics\/images/g'
cd ../../
echo ""

## First build the community version of the guides
cp docs/document-attributes-community.adoc docs/topics/templates/document-attributes.adoc

## Build the Windup Guides
sh scripts/buildGuides.sh

## Now build the product version of the guides
cp docs/document-attributes-product.adoc docs/topics/templates/document-attributes.adoc

# Remove the html and build directories and then recreate the the html directory
if [ -d html ]; then
   rm -r html/
   mkdir -p html/topics/
   cp -r docs/topics/images/ html/topics
fi

# Copy the windup-user-guide files
GUIDE_NAME="WindupUserGuide"
cd docs/windup-user-guide
echo "Copying the $GUIDE_NAME to the new location."
if [ -d html ]; then
  cp -r html/ ../../
fi
echo "$GUIDE_NAME (AsciiDoctor) is located at: " file://$CURRENT_DIR/html/$GUIDE_NAME.html

# Rebuild the ccutil guide
echo "Rebuilding the ccutil version of the Windup User Guide"
ccutil compile --lang en_US --main-file master.adoc

# Return to where we started
cd $CURRENT_DIR

# Copy the windup-rules-development-guide files
GUIDE_NAME="WindupRulesDevelopmentGuide"
cd docs/windup-rules-development-guide
echo "Copying the $GUIDE_NAME to the new location."
if [ -d html ]; then
  cp -r html/ ../../
fi
echo "$GUIDE_NAME (AsciiDoctor) is located at: " file://$CURRENT_DIR/html/$GUIDE_NAME.html

# Rebuild the ccutil guide
echo "Rebuilding the ccutil version of the Windup Rules Development Guide"
ccutil compile --lang en_US --main-file master.adoc

# Return to where we started
cd $CURRENT_DIR

# Copy the windup-core-development-guide files
GUIDE_NAME="WindupCoreDevelopmentGuide"
cd docs/windup-core-development-guide
echo "Copying the $GUIDE_NAME to the new location."
if [ -d html ]; then
  cp -r html/ ../../
fi
echo "$GUIDE_NAME (AsciiDoctor) is located at: " file://$CURRENT_DIR/html/$GUIDE_NAME.html

# Rebuild the ccutil guide
echo "Rebuilding the ccutil version of the Windup Core Development Guide"
ccutil compile --lang en_US --main-file master.adoc

# Return to where we started
cd $CURRENT_DIR


echo "Windup documentation update process is complete!"
