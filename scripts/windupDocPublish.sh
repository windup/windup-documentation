#################################
# Publish the Windup Guides
#################################

# 
echo "Copying the HTML files from windup-documentation/html/"
cd ~/GitRepos/windup
git fetch upstream
git checkout gh-pages 
cd ../windup-documentation
cp html/*.html docs/*.css docs/images/* ../windup/docs/2.0.0.Beta6/html


