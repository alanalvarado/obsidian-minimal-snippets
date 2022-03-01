#!/bin/bash

#TODO: DELETE THE FILE, REGENERATE IT
#ADD _variables TO it AUTOMATICALLY

cd src/scss || return
search_dir="snippets"
filename="index.scss"
#Search directory
for entry in "$search_dir"/**/*; do
  if [ -f "$entry" ]; then
  	# Prepend @import " and pipe $entry through sed to remove _ and cut extension append ";
    dumpty="@import \"$(echo "${entry}" | sed 's/_//g' | cut -f 1 -d '.')\";"
	#https://stackoverflow.com/questions/4749330/how-to-test-if-string-exists-in-file-with-bash
    if grep -Fx "$dumpty" "$filename"; then
      echo "File already imported"
    else
      echo "$dumpty"
      echo "is not imported, adding..."
      echo "$dumpty" >>"$filename"
    fi

  fi
done
