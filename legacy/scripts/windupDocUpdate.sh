#!/bin/bash
CURRENT_DIR="$( pwd -P)"

PRODUCT_DOC_VERSION=version-2.5
OLD_PRODUCT_VERSION=2.5.0-Final
PRODUCT_VERSION=2.5.0-Final
if [ "$1" == "?" ]  || [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ] || [ "$2" == "" ]; then 

    echo "NOTE: Be sure to check out a topic branch from the upstream windup-documentation repository!" 
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
git checkout master
git fetch upstream
git reset --hard upstream/master 
cd $2
pwd
echo "Fetch of Wiki content is complete."
echo ""

echo "Copying the latest Wiki images and stylesheets..."
cp -r $1/images/*.* docs/topics/images/
echo "Copy complete."
echo ""

echo "Copying the doc pages from the Wiki to windup-documentation..."
sh scripts/windupDocCopyWiki.sh $1
echo ""

echo " Replacing the links: to external pages with xrefs:"
cd docs/topics
find . -name '*.adoc' -print | xargs sed -i 's/link:/xref:/g'
cd ../../
echo "Replacement of links with xrefs is complete."
echo ""

echo "Removing variables from individual pages... "
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
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocUserGuideURL: https:\/\/github.com\/windup\/windup/wiki\/User-Guide//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupRulesDevelopmentGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocRulesGuideURL: https:\/\/github.com\/windup\/windup\/wiki\/Rules-Development-Guide//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: http:\/\/windup.github.io\/windup\/docs\/latest\/html\/WindupCoreDevelopmentGuide.html//g'
find . -name '*.adoc' -print | xargs sed -i 's/:ProductDocCoreGuideURL: https:\/\/github.com\/windup\/windup\/wiki\/Core-Development-Guide//g'
echo "Removal of variables is complete."
echo ""

## Replace the images directory. 
echo "Replacing the images directory location... "
find . -name '*.adoc' -print | xargs sed -i 's/:imagesdir: images/:imagesdir: topics\/images/g'
cd ../../
echo "Image directory replacement is complete"
echo ""

echo "Copy the product version of the document attributes to the correct location and build"
cp docs/document-attributes-product.adoc docs/topics/templates/document-attributes.adoc
echo "Copy of product document attributes is complete"
echo ""

echo "Build the windup-user-guide"
cd docs/windup-user-guide
CURRENT_DIRECTORY=$(pwd)
CURRENT_GUIDE=${PWD##*/}
echo "Building the ccutil version of the Windup User Guide"
echo ""
ccutil compile --lang en_US --main-file master.adoc
if [ -d  build/tmp/en-US/html-single/ ]; then
  USER_GUIDE_URL=file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
  echo "$CURRENT_GUIDE (ccutil) is located at: " file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
else
  echo -e "${RED}Build of $CURRENT_GUIDE failed!"
  echo -e "${BLACK}See the log above for details."
  exit 1
fi
# Return to where we started
cd $CURRENT_DIR
echo CURRENT_DIR = $CURRENT_DIR

# Copy the windup-rules-development-guide files

# Rebuild the ccutil guide
cd docs/windup-rules-development-guide
CURRENT_DIRECTORY=$(pwd)
CURRENT_GUIDE=${PWD##*/}
echo "Building the ccutil version of the Windup Rules Development Guide"
ccutil compile --lang en_US --main-file master.adoc
if [ -d  build/tmp/en-US/html-single/ ]; then
  RULES_GUIDE_URL=file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
  echo "$CURRENT_GUIDE (ccutil) is located at: " file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
else
  echo -e "${RED}Build of $CURRENT_GUIDE failed!"
  echo -e "${BLACK}See the log above for details."
  exit 1
fi
# Return to where we started
cd $CURRENT_DIR

# Rebuild the ccutil guide
cd docs/windup-core-development-guide
CURRENT_DIRECTORY=$(pwd)
CURRENT_GUIDE=${PWD##*/}
echo "Building the ccutil version of the Windup Core Development Guide"
ccutil compile --lang en_US --main-file master.adoc
if [ -d  build/tmp/en-US/html-single/ ]; then
  CORE_GUIDE_URL=file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
  echo "$CURRENT_GUIDE (ccutil) is located at: " file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
else
  echo -e "${RED}Build of $CURRENT_GUIDE failed!"
  echo -e "${BLACK}See the log above for details."
  exit 1
fi
# Return to where we started
cd $CURRENT_DIR

echo "Windup documentation update process is complete!"
echo
echo "   windup-user-guide is located at: $USER_GUIDE_URL"
echo "   windup-rules-development-guide is located at: $RULES_GUIDE_URL"
echo "   windup-core-development-guide is located at: $CORE_GUIDE_URL"
echo ""
echo "IMPORTANT:"
echo ""
echo "1. Commit the changes to the upstream repository."
echo "   * To see the updated files, type: git status"
echo "   * To see the changes, type: git diff <filename>"
echo "   * If they look correct, add them using: git add <filename>"
echo "   * Commit the changes and push them to your repository"
echo "   * Create a pull request to the upstream master and merge"
echo ""
echo "2. Create a Drupal ticket to stage the docs."
echo "   * Project: CCS Applications"
echo "   * Component: Doc builds"
echo "     (see https://projects.engineering.redhat.com/browse/CCS-134)"

