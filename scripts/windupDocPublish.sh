#################################
# Publish the Windup Guides
#################################

# 
echo "Copying the HTML files from windup-documentation/html/"
cd ~/GitRepos/windup
git fetch upstream
git checkout gh-pages 
cd ../windup-documentation
cp html/*.html docs/*.css ../windup/docs/2.0.0.Beta6/html
cp docs/images/* ../windup/docs/2.0.0.Beta6/html/images/

# cd ../windup
# git add docs
# git commit -m "Update the docs"
# git push sgilda HEAD
## issue a pull and verify
# git push upstream gh-pages
#firefox http://windup.github.io/windup/docs/2.0.0.Beta6/html/WindupUserGuide.html

