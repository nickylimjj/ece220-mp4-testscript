#!/bin/bash

# tutorial: makes pipe fail when checking myoutput against solutions
#set -e
#set -o pipefail
# tutorial: assigning data variable
score=0
out=(outone outtwo outthree outfour)
tests=(testone.txt testtwo.txt testthree.txt testfour.txt)
EXE=mp4

# tutorial: colors
Gre='\033[0;32m';
Def='\033[0m';
Red='\033[0;31m';

# tutorial: loop through the number of tests
for i in {0..3}; do

    # tutorial: check if it exits cleanly (if so, you will get $? == 0)
    res=$(./$EXE ${tests[i]}| diff ${out[i]} -)
    # tutorial: $? refers to exit status.
    # for diff, 0 means no diff, 1 means diff, 2 means error
    check=$?
  if [[ check -eq 2 ]]; then
      echo -e "Test" $((i+1))": ${Red}No output from ./$EXE!${Def}"
    continue
    # tutorial: lower comand used to test.
    #res=$(diff ${out[1]} ${out[i]}| wc -l)
  elif [[ check  -eq 0 ]]; then 
    # tutorial: -e 
    echo -e  "Test" $((i+1))": ${Gre}passed${Def}"
    ((score+=1))
  else
    echo -e "Test" $((i+1))": ${Red}failed${Def}"
  fi
done

# tutorial: counts number of elements in array named out
echo Score: $score out of ${#out[@]}
