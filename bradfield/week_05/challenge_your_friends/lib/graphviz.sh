#!/usr/bin/env bash

# render a directed tree/graph from the supplied edge list
# eg: dgraph a:b b:c c:a

# depends on graphviz, install with: brew install graphviz

# show usage if no arg
[[ $# -eq 0 ]] && {
  echo "usage: $(basename "$0") a:b b:c c:a"
  exit 1
}

# graph data in dotviz format from arg format
gd=$(<<< "$@" sed 's/ / ; /g; s/:/ -> /g')
# hash of above
gh=$(<<< "$gd" shasum | cut -d\  -f1)
# image filename
fn="/tmp/$gh.png"
# dotscript source
ds="digraph g { $gd }"
# produce image with `dot`
<<< "$ds" dot -Tpng -o "$fn"
# print path (in case you want to keep a copy of the image)
echo "$fn"
# display image with quicklook
qlmanage -p "$fn" >& /dev/null
