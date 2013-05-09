#!/bin/bash
id="hxd"
mkdir -p /tmp/$id/mutli
host=`hostname`
pwd=`pwd`
uid=`whoami`
put_dir="/tmp/movies_put"
mkdir -p  ${put_dir}/mutli
cd "/tmp/$id"
true > a

while read line; do
  input=$line
  filename=$input
  echo $filename
  echo "$uid@$host> hadoop fs -get $input /tmp/$id$filename"
  /home/hxd/Public/hadoop-1.0.4/bin/hadoop fs -get "$input" "/tmp/$id$filename" 2>&1
  echo "ffmpeg -i '/tmp/$id$filename' -vf select='eq(pict_type\,I)',setpts='N/(28*TB)' -threads 4 '${put_dir}$filename/%09d.jpg'"
  mkdir ${put_dir}$filename
  ffmpeg -i "/tmp/$id$filename" -vf select="eq(pict_type\,I)",setpts="N/(28*TB)" -threads 4 "${put_dir}$filename/%09d.jpg"
  /home/hxd/Public/hadoop-1.0.4/bin/hadoop fs -put "${put_dir}$filename" "/mutli_movie_frames$filename" 2>&1
  #echo "\$uid@\$host> hadoop fs -chown \$id \${put_dir}/output-\$filename.3gp"
  #hadoop fs -chown \$id \${put_dir}/output-\$filename.3gp 2>&1
 
done
rm -rf /tmp/$id

