#! /bin/bash

echo ""
echo "Source changes:"

git s #assuming you have a got a git alias configured
echo ""
read -p "Show diff? (y/n) " diff
  if [ "$diff" == "y" ]; then
    git diff
  fi
echo ""
read -p "commit? (y/n) " commit
if [ "$commit" == "y" ]; then
  echo ""
  read -p "commit message: " commitmessage
  echo ""
  git add -A #assuming your .gitignore is configured
  git commit -m "$commitmessage"
  read -p "push? (y/n) " push
  if [ "$push" == "y" ]; then
    echo ""
    git push origin #assuming you have pushed your branch to orign
    echo ""
  else
    echo ""
    echo "comitted, not pushed."
    echo ""
  fi

else
  echo "Not committed."
  echo ""
fi




echo ""
read -p "Build? (y/n) " build
if [ "$build" == "y" ]; then
  echo ""
  echo "Now building..."
  echo ""
  middleman build
  echo ""

  cd build
  echo ""
  echo "Build changes:"
  git s
  echo ""
  read -p "Show diff? (y/n) " diff
  if [ "$diff" == "y" ]; then
    git diff
  fi
  echo ""
  read -p "commit? (y/n) " commit
  if [ "$commit" == "y" ]; then
    echo ""
    read -p "commit message: " commitmessage
    echo ""
    git add -A #assuming your .gitignore is configured
    git commit -m "$commitmessage"

    read -p "push? (y/n) " push
    if [ "$push" == "y" ]; then
      echo ""
      git push origin #assuming you have pushed your branch to orign
      echo ""
    else
      echo ""
      echo "built and comitted, not pushed."
      echo ""
    fi
  else
    echo ""
    echo "Built but not committed. Bye!"
    echo ""
  fi
else
  echo ""
  echo "Not built. Bye!"
  echo ""
fi