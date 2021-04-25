#!/usr/bin/bash
echo The script will link all running containers namespace into /var/run/netns, so you can use ip netns command for them.
echo Deleting all existed symbol links
rm -f /var/run/netns/*

for i in `docker container  ls | awk {'print $NF'} | grep -v NAMES`
 do
        dockerpid=`docker inspect -f {{'.State.Pid'}} $i`
        ln -s /proc/$dockerpid/ns/net /var/run/netns/$i
        echo namespace for ${i} was linked into /var/run/netns/${i}
 done
