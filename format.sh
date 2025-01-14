#!/bin/bash

docker run --rm -t --user="$(id -u):$(id -g)" --net=none -v "$(pwd):/home/latex" leplusorg/latex latexindent main.tex -w
