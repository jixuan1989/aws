#!/bin/bash
#hadoop distribute
#/bin/bash
for node in `cat ips`;do
  ssh $node "rm ~/Public/hadoop-1.0.4/lib/jAudio-1.0.4.jar"
  scp  /mnt/hgfs/tmp/mr/lib/* $USER@$node:~/Public/hadoop-1.0.4/lib/
done