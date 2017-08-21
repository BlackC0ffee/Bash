#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Missing correct input variable" 1>&2
  exit 1
fi
search_dir=$1

if [ ! -d "$search_dir" ]
then
  echo $search_dir "- is not a directory" 1>&2
  exit 1
fi

declare -A mime
mime[image/png]="png"
mime[image/jpeg]="jpg"
mime[image/gif]="gif"

FixExtension(){
	local search_dir="$1"
    for entry in "$search_dir"/*
    do
        fullfilename=$(basename "$entry")
        extension="${fullfilename##*.}"
        filename="${fullfilename%.*}"
        mimetype="$(file -b --mime-type "$entry")"

        if [ "$mimetype" == "inode/directory" ];
        then
            FixExtension "$entry"
        elif [ ${mime[$mimetype]} ] && [ $extension != ${mime[$mimetype]} ]
        then
            echo  $fullfilename" - "$mimetype" - Renamed to "$filename"."${mime[$mimetype]}
            mv "$entry" "$(dirname "$entry")/$filename.${mime[$mimetype]}"
        fi
    done
}

FixExtension "$search_dir"

exit 0