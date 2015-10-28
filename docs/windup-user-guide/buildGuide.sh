# Build the guide
CURRENT_DIRECTORY=$(pwd)
CURRENT_GUIDE=windup-user-guide
GUIDE_DOCUMENT=Windup-User-Guide
GUIDE_NAME=WindupUserGuide

# If there's a parameter, give usage info
if [ "$#" -ne "0" ]; then
  echo ""
  echo "Run this script from the root of this guide's directory as follows: "
  echo "     cd $CURRENT_GUIDE "
  echo "     ./buildGuide.sh"
  echo ""
  exit;
fi

# Remove the html and build directories and then recreate the html/images/ directory
#if [ -d html ]; then
#   rm -r html/
#fi 
#if [ -d build ]; then
#   rm -r build/
#fi 

#
cd ../../

BASE_DIRECTORY=$(pwd)
if [ ! -d html ]; then
  echo "No html directory in " $pwd
  mkdir -p html
fi

# Copy the latest images
cp -r docs/topics/images/ html/

echo ""
echo "********************************************"
echo " Building $CURRENT_GUIDE                "
echo "********************************************"
echo ""
echo "Building an asciidoctor version of the $GUIDE_NAME"
asciidoctor -t -dbook -a toc -o html/$GUIDE_NAME.html docs/topics/$GUIDE_DOCUMENT.adoc
 
cd docs/$CURRENT_GUIDE

echo "Building the ccutil version of the $CURRENT_GUIDE"
ccutil compile --lang en_US --main-file master.adoc

cp -r topics/images/ build/tmp/en-US/html-single/
cp -r topics/images/ build/en-US/
cd ..


echo "$CURRENT_GUIDE (AsciiDoctor) is located at: " file://$BASE_DIRECTORY/html/$GUIDE_NAME.html
echo "$CURRENT_GUIDE (ccutil) is located at: " file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html


