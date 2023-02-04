#!/bin/bash

# go into each sub directory and make 10 js files

for file in $(find .); do
  if [[ $file == *.js ]]; then
    rm $file
  fi
done
