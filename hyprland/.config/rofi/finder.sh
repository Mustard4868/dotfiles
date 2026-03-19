#!/usr/bin/env bash

#PUT THIS FILE IN ~/.local/share/rofi/finder.sh
#USE: rofi  -show find -modi find:~/.local/share/rofi/finder.sh
if [ ! -z "$@" ]
then
  QUERY=$@
  if [[ "$@" == /* ]]
  then
    if [[ "$@" == *\?\? ]]
    then
      coproc ( xdg-open "${QUERY%\/* \?\?}"  > /dev/null 2>&1 )
      exec 1>&-
      exit;
    else
      coproc ( xdg-open "$@"  > /dev/null 2>&1 )
      exec 1>&-
      exit;
    fi
  elif [[ "$@" == \!\!* ]]
  then
    echo "!!-- Type your search query to find files"
    echo "!!-- To search again type !<search_query>"
    echo "!!-- To search parent directories type ?<search_query>"
    echo "!!-- You can print this help by typing !!"
  elif [[ "$@" == \?* ]]
  then
    while read -r line; do
      echo "$line" \?\?
    done <<< $(find ~ -type d -path '*/\.*' -prune -o -not -name '.*' -type f -iname *"${QUERY#\?}"* -print)
  else
    # find ~ -type d -path '*/\.*' -prune -o -not -name '.*' -type f -iname *"${QUERY#!}"* -print
    # Use fd to search for files
    RESULTS=$(fd -H -t f -i -E '*/\.*' "${QUERY}" ~ 2>/dev/null)

    while IFS= read -r item; do
        # Truncate path to filename only (Bash built-in)
        truncated="${item##*/}"

        # Use case statement for extension checks (faster than multiple regex)
        case "$item" in
            *.pdf)
                echo -en "${item}\0icon\x1fapplication-pdf\x1fdisplay\x1f${truncated}\n"
                ;;
            *.odt|*.odf|*.ods|*.docx)
                echo -en "${item}\0icon\x1fx-office-document\x1fdisplay\x1f${truncated}\n"
                ;;
            *.jpg|*.jpeg|*.img|*.png|*.gif)
                echo -en "${item}\0icon\x1fimage-x-generic\x1fdisplay\x1f${truncated}\n"
                ;;
            *)
                echo -en "${item}\0icon\x1ftext-x-generic\x1fdisplay\x1f${truncated}\n"
                ;;
        esac
    done <<< "$RESULTS"
  fi
fi
