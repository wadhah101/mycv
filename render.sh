#!/bin/bash

docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/tmp" leplusorg/latex latexmk -outdir=/tmp -pdf /tmp/main.tex

docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/home/latex" leplusorg/latex make4ht main.tex "charset=utf-8"

mv main.html website/index.html
mv main.css website/main.css
npx prettier website -w
