#!/bin/bash

docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/latex latexmk -outdir=/tmp -pdf /tmp/main.tex

while inotifywait -e modify main.tex; do
  echo "Rendering..."
  docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/latex latexmk -outdir=/tmp -pdf /tmp/main.tex
done
