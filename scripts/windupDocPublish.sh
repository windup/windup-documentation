#################################
# Publish the Windup Guides
#################################

WINDUP_VERSION=2.0.0.Beta7
# if [$1 != ""]; then 
#
# fi
echo "Copying the HTML files from windup-documentation/html/"
cd ~/GitRepos/windup
git fetch upstream
git checkout gh-pages 
cd docs/

echo Testing for existence of $WINDUP_VERSION
if [ ! -d  $WINDUP_VERSION ]; then
  echo Creating directory: $WINDUP_VERSION
  mkdir -p $WINDUP_VERSION/html/images
fi
cd ../../windup-documentation
 
cp html/*.html ../windup/docs/$WINDUP_VERSION/html/
cp docs/*.css ../windup/docs/$WINDUP_VERSION/html/
cp docs/images/* ../windup/docs/$WINDUP_VERSION/html/images/

# cd ../windup
# git add docs
# git commit -m "Update the docs"
# git push sgilda HEAD
## issue a pull and verify
# git push upstream gh-pages
#firefox http://windup.github.io/windup/docs/2.0.0.Beta6/html/WindupUserGuide.html

