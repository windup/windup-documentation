#!/bin/bash
if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" == "" ]; then 

    echo "You must pass the following arguments on the command line:"
    echo "    Path to the local windup-documentation GitHub directory"
    echo "    Path to the local windup source GitHub directory"
    echo "    Name of the new beta version" 
    echo "For example:"
    echo "    scripts/windupDocPublish.sh ~/GitRepos/windup-documentation/ ~/GitRepos/windup/ 2.0.0.Beta8"
    exit
else
    echo  "Windup Documentation will be copied from here: " $1
    echo  "Windup Documentation will be copied to here:  " $2
fi
#################################
# Publish the Windup Guides
#################################

WINDUP_VERSION=$3
echo "Creating: " $WINDUP_VERSION

echo "Copying the HTML files from windup-documentation/html/"
cd $2
pwd
git fetch upstream
git checkout gh-pages
git reset --hard upstream/gh-pages 
cd docs/
pwd
echo Testing for existence of $WINDUP_VERSION
if [ ! -d  $WINDUP_VERSION ] || [ ! -d  $WINDUP_VERSION/html ] || [ ! -d  $WINDUP_VERSION/pdf ] ; then
  echo Creating directory: $WINDUP_VERSION
  mkdir -p $WINDUP_VERSION/html/images
  mkdir $WINDUP_VERSION/pdf
fi


cd $1
pwd
## Copy HTML files separately as we do not need the ones with NO-TOC
cp html/WindupCoreDevelopmentGuide.html $2/docs/$WINDUP_VERSION/html/
cp html/WindupRulesDevelopmentGuide.html $2/docs/$WINDUP_VERSION/html/
cp html/WindupUserGuide.html $2/docs/$WINDUP_VERSION/html/

cp docs/*.css $2/docs/$WINDUP_VERSION/html/
cp docs/images/* $2/docs/$WINDUP_VERSION/html/images/
cp pdf/*.pdf $2/docs/$WINDUP_VERSION/pdf/
 
echo "Guides can be previewed here: "
echo "    User Guide (HTML): " file://$2/docs/$WINDUP_VERSION/html/WindupUserGuide.html
echo "    User Guide (PDF):  " file://$2/docs/$WINDUP_VERSION/pdf/WindupUserGuide.pdf
echo "    Rules Development Guide (HTML): " file://$2/docs/$WINDUP_VERSION/html/WindupRulesDevelopmentGuide.html
echo "    Rules Development Guide (PDF): " file://$2/docs/$WINDUP_VERSION/pdf/WindupRulesDevelopmentGuide.pdf
echo "    Core Development Guide (HTML): " file://$2/docs/$WINDUP_VERSION/html/WindupCoreDevelopmentGuide.html
echo "    Core Development Guide (PDF): " file://$2/docs/$WINDUP_VERSION/pdf/WindupCoreDevelopmentGuide.pdf

cd $2
git add docs

git commit -m "Documentation update for release $3"

echo "*******************************************"
echo "The following are manual steps: "
echo "    Navigate to the local windup source GitHub directory."
echo "    Issue the following commands to push the doc upstream."
echo "        git push origin HEAD"
echo "        (issue a pull and verify)"
echo "        git push upstream gh-pages"
echo "        firefox http://windup.github.io/windup/docs/$WINDUP_VERSION/html/WindupUserGuide.html"
echo "    Issue the following commands to update the latest link."
echo "        unlink latest"
echo "        ln -s WINDUP_RELEASE latest"
echo "        git add latest"
echo "        git commit -m 'Replace symlink for latest to point to WINDUP_RELEASE'"
echo "        git push origin gh-pages"
echo "        git push upstream gh-pages"
echo "        firefox http://windup.github.io/windup/docs/latest/html/WindupUserGuide.html"
echo "*******************************************"

# git push origin HEAD
## issue a pull and verify
# git push upstream gh-pages
#firefox http://windup.github.io/windup/docs/$WINDUP_VERSION/html/WindupUserGuide.html

cd $1

