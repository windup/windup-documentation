# Build the guides
CURRENT_DIRECTORY=$(pwd)
SCRIPT_DIRECTORY=$(dirname $0)

if [ $SCRIPT_DIRECTORY = '.' ]
then
SCRIPT_DIRECTORY="$CURRENT_DIRECTORY"
fi

if [ "$#" -ne "0" ]; then
  if [ "$1"  == "?" ] || [ "$1"  == "-?" ] || [ "$1"  == "--help" ] || [ "$1"  == "-h" ] ; then 
    echo ""
    echo "Run this script from the root of your cloned repository as follows: "
    echo "     cd windup-documentation "
    echo "     scripts/buildGuides.sh"
    echo ""
    echo "If you do not pass any arguments on the command line, all guides will be built. "
    echo ""
    echo "To build a specific guide, pass the guide's directory name as an argument. "
    echo "For example:  "
    echo "    scripts/buildGuides.sh windup-user-guide" 
    echo "    scripts/buildGuides.sh windup-rules-development-guide" 
    echo "    scripts/buildGuides.sh windup-core-development-guide" 
    echo ""
    exit;
  elif [ "$1"  == "windup-user-guide" ] || 
          [ "$1"  == "windup-rules-development-guide" ] ||
          [ "$1"  == "windup-core-development-guide" ]] ; then
    
    echo ""
    echo "Building $1"
    echo ""
    cd docs/$1
    ./buildGuide.sh
    exit;
  else
    echo ""
    echo "Invalid argument passed on the command line. "
    echo "For a list of valid arguments, type the following command:"
    echo "    scripts/buildGuides -h"
    echo ""
    exit;
  fi
else 
  echo ""
  echo "Building all the guides." 
  cd docs/windup-user-guide
  ./buildGuide.sh
  cd ../windup-rules-development-guide
  ./buildGuide.sh
  cd ../windup-core-development-guide
  ./buildGuide.sh
  cd ../..
  exit;
fi


