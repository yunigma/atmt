#!/bin/bash

# Shuffle two parallel text files

file1=$1
file2=$2

file_name1=${file1:0:-3}
file_name2=${file2:0:-3}
lang1=${file1:(-3)}
lang2=${file2:(-3)}

echo $file_name1
echo $file_name2
echo $lang1
echo $lang2
out1="${file_name1}_shuf${lang1}"
out2="${file_name2}_shuf${lang2}"

mkfifo onerandom tworandom
tee onerandom tworandom < /dev/urandom > /dev/null &
gshuf --random-source=onerandom $file1 > $out1 &
gshuf --random-source=tworandom $file2 > $out2 &
wait

rm onerandom tworandom
