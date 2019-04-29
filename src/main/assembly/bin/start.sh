#!/bin/bash

export JAVA_HOME=/opt/devkit/jdk1.8.0_181
export PATH=$JAVA_HOME/bin:$PATH

ps -ef|grep ycwl-config.jar| awk '{print $2}'| while read pid
do
  kill -9 $pid
done

rm -f /opt/jars/admin.jar

mv /opt/code/ycwl-config/target/ycwl-config-*.jar /opt/jars/ycwl-config.jar

nohup java -jar /opt/jars/ycwl-config.jar >/opt/logs/ycwl-config.log 2>1 &